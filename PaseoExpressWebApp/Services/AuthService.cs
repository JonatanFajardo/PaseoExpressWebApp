using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Models;

namespace PaseoExpressWebApp.Services
{
    public class AuthService
    {
        private readonly DB_UberContext _context;

        public AuthService(DB_UberContext context)
        {
            _context = context;
        }

        public async Task<AuthResult<LoginDto>> Login(LoginDto login)
        {
            var verificandoUsuarioResult = await Usuario(login);

            // Validacion con Result
            if (!verificandoUsuarioResult.Success)
            {
                // Si es error de usuario no encontrado, devolver mensaje específico para login
                if (verificandoUsuarioResult.ErrorType == "UserNotFound")
                    return AuthResult<LoginDto>.UserNotFound();

                // Si es error de servidor, mantener el mensaje
                return AuthResult<LoginDto>.ServerError(verificandoUsuarioResult.ErrorMessage);
            }

            var verificandoUsuario = verificandoUsuarioResult.Data;

            // Mapeo
            LoginDto resultLogin = new LoginDto
            {
                IdUser = verificandoUsuario.IdUsuario,
                Imagen = verificandoUsuario.Imagen,
                Usuario = verificandoUsuario.Usuario,
                Clave = verificandoUsuario.Password,
                Rol = verificandoUsuario.NombreRol
            };

            return AuthResult<LoginDto>.Ok(resultLogin);
        }

        public async Task<AuthResult<PR_VerificandoUsuarioResult>> Usuario(LoginDto login)
        {
            try
            {
                var resul = await _context.Procedures.PR_VerificandoUsuarioAsync(login.Usuario, login.Clave);
                var usuarioEncontrado = resul.FirstOrDefault();

                // Aquí es donde manejas el null - usuario no existe
                if (usuarioEncontrado == null)
                    return AuthResult<PR_VerificandoUsuarioResult>.UserNotFound("Las credenciales proporcionadas no son válidas");

                return AuthResult<PR_VerificandoUsuarioResult>.Ok(usuarioEncontrado);
            }
            catch (Exception ex)
            {
                return AuthResult<PR_VerificandoUsuarioResult>.ServerError("Ocurrió un problema al verificar las credenciales. Intente más tarde.");
            }
        }


        public async Task<List<tbUsuarios>> Usuarios()
        {
            try
            {
                var resul = await _context.tbUsuarios.ToListAsync();
                return resul;
            }
            catch (Exception ex)
            {
                throw new Exception("Error inesperado durante la verificación del usuario: " + ex.Message, ex);
            }
        }
    }
}