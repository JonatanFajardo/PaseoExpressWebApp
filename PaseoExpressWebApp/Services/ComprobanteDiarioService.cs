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

        public async Task<List<ObtenerVehiculosSinExistenciaHoyResult>> obtenervehiculossinexistenciahoy()
        {
            List<ObtenerVehiculosSinExistenciaHoyResult> lista = await _context.Procedures.ObtenerVehiculosSinExistenciaHoyAsync();
            return lista;
        }

        public async Task TransaccionTarifaNoPagada(int idVehiculo, DateTime FechaTransaccion, DateTime? FechaTransaccionHasta)
        {
            _context.Procedures.TransaccionTarifaNoPagadaAsync(idVehiculo, FechaTransaccion, FechaTransaccionHasta);
        }

        public async Task CierreDiarioAsync()
        {
            _context.Procedures.CierreDiarioAsync();
        }

        public async Task<List<ObtenerVehiculosResult>> Obtenervehiculos()
        {
            List<ObtenerVehiculosResult> lista = await _context.Procedures.ObtenerVehiculosAsync();
            return lista;
        }
    }
}