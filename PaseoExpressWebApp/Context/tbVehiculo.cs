﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace PaseoExpressWebApp.Context
{
    public partial class tbVehiculo
    {
        public tbVehiculo()
        {
            SaleInformation = new HashSet<SaleInformation>();
            tbServicios = new HashSet<tbServicios>();
            tbTransacciones = new HashSet<tbTransacciones>();
        }

        public int IdVehiculo { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public string Color { get; set; }
        public int? Anio { get; set; }
        public string VIN { get; set; }
        public string Placa { get; set; }
        public long? Kilometraje { get; set; }
        public long? Millaje { get; set; }
        public long? MillajeActual { get; set; }
        public int TarifaDiaria { get; set; }
        public int TarifaAhorro { get; set; }
        public string TipoAceite { get; set; }
        public int? IdPropietario { get; set; }
        public int? IdConductor { get; set; }
        public bool? Inhabilitado { get; set; }
        public string Imagen { get; set; }

        public virtual tbUsuarios IdConductorNavigation { get; set; }
        public virtual ICollection<SaleInformation> SaleInformation { get; set; }
        public virtual ICollection<tbServicios> tbServicios { get; set; }
        public virtual ICollection<tbTransacciones> tbTransacciones { get; set; }
    }
}