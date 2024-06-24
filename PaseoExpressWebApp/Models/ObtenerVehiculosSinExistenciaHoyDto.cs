namespace PaseoExpressWebApp.Models
{
    public class ObtenerVehiculosSinExistenciaHoyDto
    {
        public int IdVehiculo { get; set; }
        public string Imagen { get; set; }
        public int Anio { get; set; }
        public string Placa { get; set; }
        public decimal TarifaDiaria { get; set; }
        public decimal TarifaAhorro { get; set; }
    }
}
