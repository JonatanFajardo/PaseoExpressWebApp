using Microsoft.AspNetCore.Mvc;
using PaseoExpressWebApp.Models;

namespace PaseoExpressWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : Controller
    {
        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login(LoginDto login)
        {
            // Lista de usuarios simulada
            var usuarios = new List<SesionDto>
    {
        new SesionDto { Nombre = "admin", Correo = "admin@gmail.com", Clave = "admin", Rol = "Administrador" },
        new SesionDto { Nombre = "empleado", Correo = "empleado@gmail.com", Clave = "empleado123", Rol = "Empleado" }
    };

            // Buscar el usuario en la lista usando Find
            var usuarioEncontrado = usuarios.Find(u => u.Correo == login.Correo && u.Clave == login.Clave);

            if (usuarioEncontrado != null)
            {
                return Ok(usuarioEncontrado); // Retorna el usuario encontrado
            }

            return Unauthorized(); // Si no se encuentra el usuario, retorna Unauthorized
        }
    }
}
