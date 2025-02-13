using PaseoExpressWebApp.Context;

namespace PaseoExpressWebApp.Services
{
    public class comprobantediarioservice
    {
        private readonly DB_UberContext _context;

        public comprobantediarioservice(DB_UberContext context)
        {
            _context = context;
        }

        public async Task<List<PR_ObtenerVehiculosSinExistenciaHoyResult>> obtenervehiculossinexistenciahoy()
        {
            List<PR_ObtenerVehiculosSinExistenciaHoyResult> lista = await _context.Procedures.PR_ObtenerVehiculosSinExistenciaHoyAsync();
            return lista;
        }

        public async Task TransaccionTarifaNoPagada(int idVehiculo, DateTime FechaTransaccion, DateTime? FechaTransaccionHasta)
        {
            _context.Procedures.PR_TransaccionTarifaNoPagadaAsync(idVehiculo, FechaTransaccion, FechaTransaccionHasta);
        }

        public async Task CierreDiarioAsync()
        {
            _context.Procedures.PR_CierreDiarioAsync();
        }

        public async Task<List<PR_ObtenerVehiculosResult>> Obtenervehiculos()
        {
            List<PR_ObtenerVehiculosResult> lista = await _context.Procedures.PR_ObtenerVehiculosAsync();
            return lista;
        }
    }
}