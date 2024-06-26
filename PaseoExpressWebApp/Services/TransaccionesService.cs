using PaseoExpressWebApp.Context;

namespace PaseoExpressWebApp.Services
{
    public class TransaccionesService
    {

        private readonly DB_UberContext _context;


        public TransaccionesService(DB_UberContext context)
        {
            _context = context;
        }


        public async Task<List<ObtenerTransaccionesResult>> ObtenerTransaccionesAsync()
        {

            return await _context.Procedures.ObtenerTransaccionesAsync();
        }


    }
}
