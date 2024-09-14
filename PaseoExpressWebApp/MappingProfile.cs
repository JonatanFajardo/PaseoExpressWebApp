using AutoMapper;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Models;

namespace PaseoExpressWebApp
{

    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<ObtenerVehiculosResult, VehiculoModel>(); // Definición del mapeo de ObtenerVehiculosResult a Vehiculo
        }
    }
}
