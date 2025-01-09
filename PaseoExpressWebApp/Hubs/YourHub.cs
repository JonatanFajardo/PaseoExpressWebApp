using Microsoft.AspNetCore.SignalR;
using Microsoft.Data.SqlClient;
using PaseoExpressWebApp.Models;
using PaseoExpressWebApp.Services;

namespace PaseoExpressWebApp.Hubs
{
    public class YourHub : Hub
    {
        private readonly TransaccionesService _transaccionesService;
        private readonly IConfiguration _config;

        public YourHub(TransaccionesService transaccionesService, IConfiguration config = null)
        {
            _transaccionesService = transaccionesService;
            _config = config;
        }
        public async Task ObtenerYEnviarTransacciones()
        {
            var transacciones = await _transaccionesService.ObtenerTransaccionesAsync();
            // Enviar las transacciones a todos los clientes conectados
            await Clients.All.SendAsync("RecibirTransacciones", transacciones);
        }

        //// Método para notificar a los clientes que hubo un cambio en la base de datos
        //public async Task NotificarCambioEnTransacciones()
        //{
        //    var transacciones = await _transaccionesService.ObtenerTransaccionesAsync();
        //    await Clients.All.SendAsync("RecibirTransacciones", transacciones);
        //}

        // Método que puede ser llamado desde el cliente para actualizar una transacción
        public async Task ActualizarTransaccion()
        {
            var transacciones = await _transaccionesService.ObtenerTransaccionesAsync();
            await Clients.All.SendAsync("RecibirTransacciones", transacciones);
        }






        public async Task SendMessage(MessageDto message)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(_config.GetConnectionString("DefaultConnection")))
                {
                    using (SqlCommand cmd = new SqlCommand("PR_InsertMessageWithDetail", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@Description", message.Description ?? (object)DBNull.Value);
                        cmd.Parameters.AddWithValue("@IsRead", 0);
                        cmd.Parameters.AddWithValue("@SenderId", message.SenderId);
                        cmd.Parameters.AddWithValue("@ReceiverId", message.ReceiverId);
                        cmd.Parameters.AddWithValue("@GroupId", 0);
                        cmd.Parameters.AddWithValue("@Time", DateTime.UtcNow);

                        conn.Open();
                        await cmd.ExecuteNonQueryAsync();
                    }
                }

                // Enviar mensaje a través de SignalR
                await Clients.All.SendAsync("ReceiveMessage", message);
                //return message;
            }
            catch (Exception ex)
            {
                // Manejo de error: loggear o enviar respuesta de error
                Console.WriteLine($"Error al enviar mensaje: {ex.Message}");
                throw;
            }
        }

    }
}
