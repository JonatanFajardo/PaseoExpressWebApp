using Microsoft.AspNetCore.SignalR;
using PaseoExpressWebApp.Services;

namespace PaseoExpressWebApp.Hubs
{
    public class YourHub : Hub
    {
        private readonly TransaccionesService _transaccionesService;
        public YourHub(TransaccionesService transaccionesService) {
            _transaccionesService = transaccionesService;
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
    }
}
