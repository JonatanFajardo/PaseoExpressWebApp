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
				throw new Exception("Error al acceder a la base de datos: " + ex.Message, ex);
			}
			catch (Exception ex) // Captura otras excepciones generales
			{
				throw new Exception("Error inesperado durante la verificación del usuario: " + ex.Message, ex);
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