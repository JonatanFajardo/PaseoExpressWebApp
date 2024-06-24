using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
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
        public async Task<ActionResult<List<ObtenerVehiculosSinExistenciaHoyResult>>> ObtenerVehiculosSinExistenciaHoy()
        {
            List<ObtenerVehiculosSinExistenciaHoyResult> lista = await _context.Procedures.ObtenerVehiculosSinExistenciaHoyAsync();
            return Ok(lista);
        }


    }
}
