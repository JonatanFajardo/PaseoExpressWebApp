﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace PaseoExpressWebApp.Context
{
    public partial class InformacionCompra
    {
        public int IdPurchase { get; set; }
        public int? VehicleId { get; set; }
        public DateTime? PurchaseDate { get; set; }
        public decimal? PurchasePrice { get; set; }
        public string SellerDetails { get; set; }
    }
}