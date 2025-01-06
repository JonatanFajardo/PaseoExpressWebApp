namespace PaseoExpressWebApp.Services
{
    public class AuthService
    {
        public async Task<bool> Login(string email, string password)
        {
            // Simulación de autenticación (reemplázalo con una API real)
            if (email == "admin@gmail.com" && password == "123456")
            {
                // Guardar el estado de autenticación (puede ser con Identity)
                return true;
            }
            return false;
        }
    }

}
