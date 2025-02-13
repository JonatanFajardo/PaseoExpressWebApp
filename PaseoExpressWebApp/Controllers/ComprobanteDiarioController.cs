using Microsoft.AspNetCore.Mvc;
using PaseoExpressWebApp.Context;

namespace PaseoExpressWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComprobanteDiarioController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        private readonly DB_UberContext _context;

        public ComprobanteDiarioController(DB_UberContext applicationDbContext)
        {
            _context = applicationDbContext;
        }

        [HttpGet("ObtenerVehiculosSinExistenciaHoy")]
        public async Task<ActionResult<List<PR_ObtenerVehiculosSinExistenciaHoyResult>>> ObtenerVehiculosSinExistenciaHoy()
        {
            List<PR_ObtenerVehiculosSinExistenciaHoyResult> lista = await _context.Procedures.PR_ObtenerVehiculosSinExistenciaHoyAsync();
            return Ok(lista);
        }
    }
}