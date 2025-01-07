using Microsoft.AspNetCore.Mvc;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Models;
using PaseoExpressWebApp.Services;


namespace PaseoExpressWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : Controller
    {
        //    [HttpPost]
        //    [Route("Login")]
        //    public async Task<IActionResult> Login(LoginDto login)
        //    {
        //        // Lista de usuarios simulada
        //        var usuarios = new List<SesionDto>
        //{
        //    new SesionDto { Nombre = "admin", Correo = "admin@gmail.com", Clave = "admin", Rol = "Administrador" },
        //    new SesionDto { Nombre = "empleado", Correo = "empleado@gmail.com", Clave = "empleado123", Rol = "Empleado" }
        //};

        //        // Buscar el usuario en la lista usando Find
        //        var usuarioEncontrado = usuarios.Find(u => u.Correo == login.Correo && u.Clave == login.Clave);

        //        if (usuarioEncontrado != null)
        //        {
        //            return Ok(usuarioEncontrado); // Retorna el usuario encontrado
        //        }

        //        return Unauthorized(); // Si no se encuentra el usuario, retorna Unauthorized
        //    }


        private LoginService _loginService;

        public UsuarioController(LoginService loginService)
        {
            _loginService = loginService;
        }

        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login(LoginDto login)
        {
            PR_VerificandoUsuarioResult result = (await _loginService.VerificandoUsuario(login)).ToList().FirstOrDefault();

            LoginDto resultLogin = new LoginDto
            {
                Correo = result.Usuario,
                Clave = result.Password,
                Rol = result.NombreRol
            };

            return Ok(resultLogin);
        }

    }
}
