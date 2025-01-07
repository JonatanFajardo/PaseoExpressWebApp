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
            var resul = await _context.Procedures.PR_VerificandoUsuarioAsync(login.Correo, login.Clave);
            return resul;
        }
    }
}
