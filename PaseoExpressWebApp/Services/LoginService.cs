using Microsoft.EntityFrameworkCore;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Models;

namespace PaseoExpressWebApp.Services
{
    public class LoginService
    {

        private readonly DB_UberContext _context;

        public LoginService(DB_UberContext context)
        {
            _context = context;
        }
        public async Task<List<PR_VerificandoUsuarioResult>> VerificandoUsuario(LoginDto login)
        {
            try
            {
                var resul = await _context.Procedures.PR_VerificandoUsuarioAsync(login.Correo, login.Clave);
                return resul;
            }
            catch (DbUpdateException ex) // Captura excepciones de base de datos
            {
                // Manejo específico para errores de base de datos (ej: clave duplicada, etc.)
                // Loguear el error es crucial para el diagnóstico
                //_logger.LogError(ex, "Error al verificar usuario en la base de datos."); // Usa un logger (ver abajo)
                throw new Exception("Error al acceder a la base de datos durante la verificación del usuario: " + ex.Message, ex);

                // Opciones de manejo:
                // 1. Relanzar la excepción (para que se maneje en una capa superior)
                // throw; 

                // 2. Retornar un valor por defecto (ej: una lista vacía o null, dependiendo del contexto)
                //return new List<PR_VerificandoUsuarioResult>();

                // 3. Retornar un mensaje de error específico (usando un objeto de respuesta personalizado)
                // return new ErrorResponse { Message = "Error de base de datos al verificar usuario." };
            }
            catch (Exception ex) // Captura otras excepciones generales
            {
                // Manejo para otras excepciones no relacionadas con la base de datos
                throw new Exception("Error inesperado durante la verificación del usuario: " + ex.Message, ex);

                //_logger.LogError(ex, "Error inesperado al verificar usuario.");

                // Opciones de manejo (similares a DbUpdateException):
                // throw;
                //return new List<PR_VerificandoUsuarioResult>();
                // return new ErrorResponse { Message = "Error inesperado al verificar usuario." };
            }
        }


        public async Task<List<tbUsuarios>> Usuarios()
        {
            try
            {
                var resul = await _context.tbUsuarios.ToListAsync();
                return resul;
            }
            catch (Exception ex) // Captura otras excepciones generales
            {
                // Manejo para otras excepciones no relacionadas con la base de datos
                throw new Exception("Error inesperado durante la verificación del usuario: " + ex.Message, ex);

                //_logger.LogError(ex, "Error inesperado al verificar usuario.");

                // Opciones de manejo (similares a DbUpdateException):
                // throw;
                //return new List<PR_VerificandoUsuarioResult>();
                // return new ErrorResponse { Message = "Error inesperado al verificar usuario." };
            }
        }



    }
}
