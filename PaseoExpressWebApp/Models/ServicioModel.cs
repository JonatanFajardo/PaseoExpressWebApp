using System.ComponentModel.DataAnnotations;

namespace PaseoExpressWebApp.Models
{

    public class ServicioModel
    {
        public int IdTipoServicio { get; set; }

        [StringLength(4000)]
        public string Imagenes { get; set; }

        [StringLength(250)]
        public string Titulo { get; set; }

        [StringLength(550)]
        public string Descripcion { get; set; }

        public DateTime FechaServicio { get; set; }

        public int CantidadComprada { get; set; }

        [Range(0, 9999999999.99)]
        public decimal CostoUnitario { get; set; }

        [Range(0, 9999999999.99)]
        public decimal CostoTotal { get; set; }

        [StringLength(250)]
        public string Marca { get; set; }

        public int IdTipoMantenimiento { get; set; }

        public int KilometrajeVehiculo { get; set; }

        public int MillajeVehiculo { get; set; }

        public DateTime ProximaFechaMantenimiento { get; set; }

        public int IdVehiculo { get; set; }

        public bool EsRecurrente { get; set; }

        public long ProximoKilometraje { get; set; }

        public long ProximoMillaje { get; set; }

        public int IdUbicacionEnAutomovil { get; set; }

        [Range(0, 9999999999.99)]
        public decimal PrecioManoObra { get; set; }

        public bool Confirmado { get; set; }

        [StringLength(250)]
        public string Viaticos { get; set; }

        public int ManoObraPersonal { get; set; }
    }

}
