using Microsoft.AspNetCore.SignalR;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Hubs;

namespace PaseoExpressWebApp.Services
{
    public class TransaccionesService
    {

        private readonly DB_UberContext _context;
        private readonly IHubContext<YourHub> _hubContext;


        public TransaccionesService(DB_UberContext context, IHubContext<YourHub> hubContext)
        {
            _context = context;
            _hubContext = hubContext;
        }


        public async Task<List<ObtenerTransaccionesResult>> ObtenerTransaccionesAsync()
        {

                var resul = await _context.Procedures.ObtenerTransaccionesAsync();
            return resul;

        }

        public async Task ActualizarTransaccion()
        {
            // Notificar a los clientes conectados sobre la actualización
            var transacciones = await ObtenerTransaccionesAsync();
            await _hubContext.Clients.All.SendAsync("RecibirTransacciones", transacciones);

        }
 

    }
}
