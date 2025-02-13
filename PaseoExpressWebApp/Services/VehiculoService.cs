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

        public async Task<List<PR_ObtenerVehiculosResult>> Obtenervehiculos()
        {
            List<PR_ObtenerVehiculosResult> lista = await _context.Procedures.PR_ObtenerVehiculosAsync();
            return lista;
        }

        public async Task<List<PR_ObtenerTransaccionesPorVehiculoResult>> ObtenerTransaccionesPorVehiculo(int IdVehiculo)
        {
            List<PR_ObtenerTransaccionesPorVehiculoResult> lista = await _context.Procedures.PR_ObtenerTransaccionesPorVehiculoAsync(IdVehiculo);
            return lista;
        }

        public async Task<List<PR_ObtenerServiciosPorVehiculoResult>> ObtenerServiciosPorVehiculoAsync(int IdVehiculo)
        {
            List<PR_ObtenerServiciosPorVehiculoResult> results = await _context.Procedures.PR_ObtenerServiciosPorVehiculoAsync(IdVehiculo);
            return results;
        }

        public async Task<List<PR_ObtenerVehiculoInformacionDashboardResult>> VehiculoInformacionDashboardAsync()
        {
            List<PR_ObtenerVehiculoInformacionDashboardResult> lista = await _context.Procedures.PR_ObtenerVehiculoInformacionDashboardAsync();
            return lista;
        }
    }
}