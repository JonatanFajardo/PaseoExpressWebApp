using System.ComponentModel.DataAnnotations;

namespace PaseoExpressWebApp.Models
{

    public class ServicioModel : IValidatableObject
    {
        public int IdTipoServicio { get; set; }

        [StringLength(4000)]
        public string Imagenes { get; set; }

        [StringLength(250)]
        [Required(ErrorMessage = "El campo Título es obligatorio.")]
        public string Titulo { get; set; }

        [StringLength(550)]
        [Required(ErrorMessage = "El campo Descripción es obligatorio.")]
        public string Descripcion { get; set; }

        [Required(ErrorMessage = "La fecha del servicio es obligatoria")]
        public DateTime FechaServicio { get; set; }

        [Display(Name = "Costo Total")]
        [RangoPersonalizado(1, 999999999.99)]
        public decimal CostoTotal { get; set; }

        [StringLength(250)]
        public string Marca { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Debe seleccionar el tipo de mantenimiento.")]
        public int IdTipoMantenimiento { get; set; }


        public int MillajeVehiculo { get; set; }

        public DateTime ProximaFechaMantenimiento { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Debe seleccionar un vehículo.")]
        public int IdVehiculo { get; set; }

        public int? IdUsuario { get; set; }

        public bool EsRecurrente { get; set; }

        public long ProximoMillaje { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Debe seleccionar una ubicación en el automóvil.")]
        public int IdUbicacionEnAutomovil { get; set; }

        //[Display(Name = "Costo Total")]
        //[RangoPersonalizado(1, 999999999.99)]
        //public decimal Monto { get; set; }

        public decimal PrecioManoObra { get; set; }

        public bool Confirmado { get; set; }

        [StringLength(250)]
        public string Viaticos { get; set; }

        public int ManoObraPersonal { get; set; }


        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (ProximaFechaMantenimiento < FechaServicio)
            {
                yield return new ValidationResult(
                    "La Próxima Fecha de Mantenimiento no puede ser menor que la Fecha de Servicio.",
                    new[] { nameof(ProximaFechaMantenimiento) }
                );
            }
        }
    }
    public class RangoPersonalizadoAttribute : RangeAttribute
    {
        public RangoPersonalizadoAttribute(double minimum, double maximum)
            : base(minimum, maximum)
        {
            ErrorMessage = "El campo {0} debe estar entre {1} y {2}";
        }
    }

}
