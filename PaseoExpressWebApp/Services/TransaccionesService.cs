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

        public async Task<List<PR_ObtenerTransaccionesResult>> ObtenerTransaccionesAsync()
        {
            try
            {
                var resul = await _context.Procedures.PR_ObtenerTransaccionesAsync();
                return resul;
            }
            catch (Exception e)
            {

                throw;
            }

        }

        public async Task<List<PR_ObtenerTransaccionesResult>> ObtenerTransaccionesNoConfirmadasAsync()
        {
            var resul = await _context.Procedures.PR_ObtenerTransaccionesAsync();
            if (resul is not null)
            {
                resul.Find(x => x.Confirmada = false);
                return resul;
            }
            return null;
        }

        public async Task ActualizarTransaccion()
        {
            // Notificar a los clientes conectados sobre la actualización
            var transacciones = await ObtenerTransaccionesAsync();
            await _hubContext.Clients.All.SendAsync("RecibirTransacciones", transacciones);
        }
    }
}