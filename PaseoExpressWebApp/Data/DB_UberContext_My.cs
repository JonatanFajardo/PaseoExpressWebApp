
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Models;

namespace PaseoExpressWebApp.Data
{
    public class DB_UberContext_My : DbContext
    {
        private readonly DB_UberContext _context;

        public DB_UberContext_My(DB_UberContext context)
        {
            _context = context;
        }

        //public virtual async Task<int> InsertarUnServiciosAsync(ServicioModel servicio, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default)
        //{
        //    var parameterreturnValue = new SqlParameter
        //    {
        //        ParameterName = "returnValue",
        //        Direction = System.Data.ParameterDirection.Output,
        //        SqlDbType = System.Data.SqlDbType.Int,
        //    };

        //    var sqlParameters = new[]
        //    {
        //    new SqlParameter
        //    {
        //        ParameterName = "IdTipoServicio",
        //        Value = servicio.IdTipoServicio != 0 ? (object)servicio.IdTipoServicio : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Int,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "Imagenes",
        //        Size = 8000,
        //        Value = !string.IsNullOrEmpty(servicio.Imagenes) ? (object)servicio.Imagenes : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.NVarChar,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "Titulo",
        //        Size = 500,
        //        Value = !string.IsNullOrEmpty(servicio.Titulo) ? (object)servicio.Titulo : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.NVarChar,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "Descripcion",
        //        Size = 1100,
        //        Value = !string.IsNullOrEmpty(servicio.Descripcion) ? (object)servicio.Descripcion : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.NVarChar,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "FechaServicio",
        //        Value = servicio.FechaServicio != DateTime.MinValue ? (object)servicio.FechaServicio : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Date,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "CantidadComprada",
        //        Value = servicio.CantidadComprada != 0 ? (object)servicio.CantidadComprada : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Int,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "CostoUnitario",
        //        Precision = 10,
        //        Scale = 2,
        //        Value = servicio.CostoUnitario != 0 ? (object)servicio.CostoUnitario : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Decimal,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "CostoTotal",
        //        Precision = 10,
        //        Scale = 2,
        //        Value = servicio.CostoTotal != 0 ? (object)servicio.CostoTotal : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Decimal,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "Marca",
        //        Size = 500,
        //        Value = !string.IsNullOrEmpty(servicio.Marca) ? (object)servicio.Marca : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.NVarChar,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "IdTipoMantenimiento",
        //        Value = servicio.IdTipoMantenimiento != 0 ? (object)servicio.IdTipoMantenimiento : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Int,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "KilometrajeVehiculo",
        //        Value = servicio.KilometrajeVehiculo != 0 ? (object)servicio.KilometrajeVehiculo : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Int,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "MillajeVehiculo",
        //        Value = servicio.MillajeVehiculo != 0 ? (object)servicio.MillajeVehiculo : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Int,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "ProximaFechaMantenimiento",
        //        Value = servicio.ProximaFechaMantenimiento != DateTime.MinValue ? (object)servicio.ProximaFechaMantenimiento : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Date,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "IdVehiculo",
        //        Value = servicio.IdVehiculo != 0 ? (object)servicio.IdVehiculo : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Int,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "EsRecurrente",
        //        Value = servicio.EsRecurrente,
        //        SqlDbType = System.Data.SqlDbType.Bit,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "ProximoKilometraje",
        //        Value = servicio.ProximoKilometraje != 0 ? (object)servicio.ProximoKilometraje : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.BigInt,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "ProximoMillaje",
        //        Value = servicio.ProximoMillaje != 0 ? (object)servicio.ProximoMillaje : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.BigInt,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "IdUbicacionEnAutomovil",
        //        Value = servicio.IdUbicacionEnAutomovil != 0 ? (object)servicio.IdUbicacionEnAutomovil : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Int,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "PrecioManoObra",
        //        Precision = 10,
        //        Scale = 2,
        //        Value = servicio.PrecioManoObra != 0 ? (object)servicio.PrecioManoObra : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Decimal,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "Confirmado",
        //        Value = servicio.Confirmado,
        //        SqlDbType = System.Data.SqlDbType.Bit,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "Viaticos",
        //        Size = 500,
        //        Value = !string.IsNullOrEmpty(servicio.Viaticos) ? (object)servicio.Viaticos : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.NVarChar,
        //    },
        //    new SqlParameter
        //    {
        //        ParameterName = "ManoObraPersonal",
        //        Value = servicio.ManoObraPersonal != 0 ? (object)servicio.ManoObraPersonal : DBNull.Value,
        //        SqlDbType = System.Data.SqlDbType.Int,
        //    },
        //    parameterreturnValue,
        //};

        //    var _ = await _context.Database.ExecuteSqlRawAsync(
        //        "EXEC @returnValue = [dbo].[InsertarUnServicios] @IdTipoServicio = @IdTipoServicio, @Imagenes = @Imagenes, @Titulo = @Titulo, @Descripcion = @Descripcion, @FechaServicio = @FechaServicio, @CantidadComprada = @CantidadComprada, @CostoUnitario = @CostoUnitario, @CostoTotal = @CostoTotal, @Marca = @Marca, @IdTipoMantenimiento = @IdTipoMantenimiento, @KilometrajeVehiculo = @KilometrajeVehiculo, @MillajeVehiculo = @MillajeVehiculo, @ProximaFechaMantenimiento = @ProximaFechaMantenimiento, @IdVehiculo = @IdVehiculo, @EsRecurrente = @EsRecurrente, @ProximoKilometraje = @ProximoKilometraje, @ProximoMillaje = @ProximoMillaje, @IdUbicacionEnAutomovil = @IdUbicacionEnAutomovil, @PrecioManoObra = @PrecioManoObra, @Confirmado = @Confirmado, @Viaticos = @Viaticos, @ManoObraPersonal = @ManoObraPersonal",
        //        sqlParameters,
        //        cancellationToken);

        //    returnValue?.SetValue((int)parameterreturnValue.Value);

        //    return _;
        //}
    }


}
