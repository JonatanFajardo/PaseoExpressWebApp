using PaseoExpressWebApp.Context;

namespace PaseoExpressWebApp.Services
{
    public class ChatSignalService
    {
        private readonly DB_UberContext _context;

        public ChatSignalService(DB_UberContext context)
        {
            _context = context;
        }

        public async Task<List<PR_Chat_ObtenerUltimoMensajePorUsuarioResult>> ObtenerUltimoMensajePorUsuario(int IdUsuario)
        {
            List<PR_Chat_ObtenerUltimoMensajePorUsuarioResult> lista = await _context.Procedures.PR_Chat_ObtenerUltimoMensajePorUsuarioAsync(IdUsuario);
            return lista;
        }
    }
}
