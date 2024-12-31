using PaseoExpressWebApp.Context;

namespace PaseoExpressWebApp.Services
{
    public class VehiculoService
    {
        private readonly DB_UberContext _context;

        public VehiculoService(DB_UberContext context)
        {
            _context = context;
        }

        public async Task<List<ObtenerVehiculosResult>> Obtenervehiculos()
        {
            List<ObtenerVehiculosResult> lista = await _context.Procedures.ObtenerVehiculosAsync();
            return lista;
        }

        public async Task<List<ObtenerTransaccionesPorVehiculoResult>> ObtenerTransaccionesPorVehiculo(int IdVehiculo)
        {
            List<ObtenerTransaccionesPorVehiculoResult> lista = await _context.Procedures.ObtenerTransaccionesPorVehiculoAsync(IdVehiculo);
            return lista;
        }

        public async Task<List<ObtenerServiciosPorVehiculoResult>> ObtenerServiciosPorVehiculoAsync(int IdVehiculo)
        {
            List<ObtenerServiciosPorVehiculoResult> results = await _context.Procedures.ObtenerServiciosPorVehiculoAsync(IdVehiculo);
            return results;
        }

        public async Task<List<ObtenerVehiculoInformacionDashboardResult>> VehiculoInformacionDashboardAsync()
        {
            List<ObtenerVehiculoInformacionDashboardResult> lista = await _context.Procedures.ObtenerVehiculoInformacionDashboardAsync();
            return lista;
        }
    }
}