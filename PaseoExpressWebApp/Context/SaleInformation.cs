﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace PaseoExpressWebApp.Context
{
    public partial class SaleInformation
    {
        public int IdSale { get; set; }
        public int? VehicleId { get; set; }
        public DateTime? SaleDate { get; set; }
        public decimal? SalePrice { get; set; }
        public string BuyerDetails { get; set; }

        public virtual tbVehiculo Vehicle { get; set; }
    }
}