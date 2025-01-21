namespace PaseoExpressWebApp.Models
{
    public class LoginDto
    {

        public int IdUser { get; set; }
        public string? Imagen { get; set; }
        public string? Correo { get; set; }
        public string? Clave { get; set; }
        public string? Rol { get; set; }
    }
}