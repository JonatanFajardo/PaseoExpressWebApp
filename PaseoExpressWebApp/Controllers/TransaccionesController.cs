using Microsoft.AspNetCore.Mvc;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Services;

namespace PaseoExpressWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TransaccionesController : Controller
    {
        private TransaccionesService _transaccionesService;

        public TransaccionesController(TransaccionesService transaccionesService)
        {
            _transaccionesService = transaccionesService;
        }

        public ActionResult<List<ObtenerTransaccionesResult>> ObtenerTransaccion()
        {
            var result = _transaccionesService.ObtenerTransaccionesAsync();
            return Ok(result);
        }
    }
}
