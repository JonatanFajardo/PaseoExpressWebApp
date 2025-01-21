using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Models;
using System.Data;

namespace PaseoExpressWebApp.Services
{
    public class ServicioServices
    {
        private readonly DB_UberContext _context;

        public ServicioServices(DB_UberContext context)
        {
            _context = context;
        }

        private SqlParameter CreateSqlParameter(string name, object value, SqlDbType type, int? size = null, byte? precision = null, byte? scale = null)
        {
            return new SqlParameter
            {
                ParameterName = name,
                Value = value ?? DBNull.Value,
                SqlDbType = type,
                Size = size ?? 0,
                Precision = precision ?? 0,
                Scale = scale ?? 0
            };
        }

        public virtual async Task<bool> InsertarUnServicios(ServicioModel servicio, OutputParameter<int> returnValue = null, CancellationToken cancellationToken = default)
        {
            try
            {
                var parameterreturnValue = new SqlParameter
                {
                    ParameterName = "returnValue",
                    Direction = ParameterDirection.Output,
                    SqlDbType = SqlDbType.Int,
                };

                var sqlParameters = new[]
                {
                CreateSqlParameter("IdTipoServicio", servicio.IdTipoServicio != 0 ? (object)servicio.IdTipoServicio : DBNull.Value, SqlDbType.Int),
                CreateSqlParameter("Imagenes", !string.IsNullOrEmpty(servicio.Imagenes) ? (object)servicio.Imagenes : DBNull.Value, SqlDbType.NVarChar, 4000),
                CreateSqlParameter("Titulo", !string.IsNullOrEmpty(servicio.Titulo) ? (object)servicio.Titulo : DBNull.Value, SqlDbType.NVarChar, 250),
                CreateSqlParameter("Descripcion", !string.IsNullOrEmpty(servicio.Descripcion) ? (object)servicio.Descripcion : DBNull.Value, SqlDbType.NVarChar, 550),
                CreateSqlParameter("FechaServicio", servicio.FechaServicio != DateTime.MinValue ? (object)servicio.FechaServicio : DBNull.Value, SqlDbType.Date),
				//CreateSqlParameter("CantidadComprada", servicio.CantidadComprada != 0 ? (object)servicio.CantidadComprada : DBNull.Value, SqlDbType.Int),
				//CreateSqlParameter("CostoUnitario", servicio.CostoUnitario != 0 ? (object)servicio.CostoUnitario : DBNull.Value, SqlDbType.Decimal, precision: 10, scale: 2),
				CreateSqlParameter("CostoTotal", servicio.CostoTotal != 0 ? (object)servicio.CostoTotal : DBNull.Value, SqlDbType.Decimal, precision: 10, scale: 2),
                CreateSqlParameter("Marca", !string.IsNullOrEmpty(servicio.Marca) ? (object)servicio.Marca : DBNull.Value, SqlDbType.NVarChar, 250),
                CreateSqlParameter("IdTipoMantenimiento", servicio.IdTipoMantenimiento != 0 ? (object)servicio.IdTipoMantenimiento : DBNull.Value, SqlDbType.Int),
				//CreateSqlParameter("KilometrajeVehiculo", servicio.KilometrajeVehiculo != 0 ? (object)servicio.KilometrajeVehiculo : DBNull.Value, SqlDbType.Int),
				CreateSqlParameter("MillajeVehiculo", servicio.MillajeVehiculo != 0 ? (object)servicio.MillajeVehiculo : DBNull.Value, SqlDbType.Int),
                CreateSqlParameter("ProximaFechaMantenimiento", servicio.ProximaFechaMantenimiento != DateTime.MinValue ? (object)servicio.ProximaFechaMantenimiento : DBNull.Value, SqlDbType.Date),
                CreateSqlParameter("IdVehiculo", servicio.IdVehiculo != 0 ? (object)servicio.IdVehiculo : DBNull.Value, SqlDbType.Int),
                CreateSqlParameter("IdUsuario", servicio.IdUsuario != 0 ? (object)servicio.IdUsuario : DBNull.Value, SqlDbType.Int),
                CreateSqlParameter("EsRecurrente", servicio.EsRecurrente, SqlDbType.Bit),
				//CreateSqlParameter("ProximoKilometraje", servicio.ProximoKilometraje != 0 ? (object)servicio.ProximoKilometraje : DBNull.Value, SqlDbType.BigInt),
				CreateSqlParameter("ProximoMillaje", servicio.ProximoMillaje != 0 ? (object)servicio.ProximoMillaje : DBNull.Value, SqlDbType.BigInt),
                CreateSqlParameter("IdUbicacionEnAutomovil", servicio.IdUbicacionEnAutomovil != 0 ? (object)servicio.IdUbicacionEnAutomovil : DBNull.Value, SqlDbType.Int),
                CreateSqlParameter("PrecioManoObra", servicio.PrecioManoObra != 0 ? (object)servicio.PrecioManoObra : DBNull.Value, SqlDbType.Decimal, precision: 10, scale: 2),
                CreateSqlParameter("Confirmado", servicio.Confirmado, SqlDbType.Bit),
                CreateSqlParameter("Viaticos", !string.IsNullOrEmpty(servicio.Viaticos) ? (object)servicio.Viaticos : DBNull.Value, SqlDbType.NVarChar, 250),
                CreateSqlParameter("ManoObraPersonal", servicio.ManoObraPersonal != 0 ? (object)servicio.ManoObraPersonal : DBNull.Value, SqlDbType.Int),
                parameterreturnValue
            };

                var _ = await _context.Database.ExecuteSqlRawAsync(
                    "EXEC @returnValue = [dbo].[InsertarUnServicios] @IdTipoServicio = @IdTipoServicio, @Imagenes = @Imagenes, @Titulo = @Titulo, @Descripcion = @Descripcion, @FechaServicio = @FechaServicio, @CostoTotal = @CostoTotal, @Marca = @Marca, @IdTipoMantenimiento = @IdTipoMantenimiento, @MillajeVehiculo = @MillajeVehiculo, @ProximaFechaMantenimiento = @ProximaFechaMantenimiento, @IdVehiculo = @IdVehiculo, @IdUsuario = @IdUsuario, @EsRecurrente = @EsRecurrente, @ProximoMillaje = @ProximoMillaje, @IdUbicacionEnAutomovil = @IdUbicacionEnAutomovil, @PrecioManoObra = @PrecioManoObra, @Confirmado = @Confirmado, @Viaticos = @Viaticos, @ManoObraPersonal = @ManoObraPersonal",
                    sqlParameters,
                    cancellationToken);

                returnValue?.SetValue((int)parameterreturnValue.Value);

                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public List<tbTipoServicios> TipoServicios()

        {
            var dd = _context.tbTipoServicios.ToList();
            return dd;
        }

        public List<tbTipoMantenimientos> TipoMantenimientos()
        {
            return _context.tbTipoMantenimientos.ToList();
        }

        public List<tbVehiculo> Vehiculos()
        {
            return _context.tbVehiculo.ToList();
        }

        public List<tbUbicacionEnAutomovil> UbicacionesEnAutomovil()
        {
            return _context.tbUbicacionEnAutomovil.ToList();
        }

        public List<tbUsuarios> ObtenerUsuarios()
        {
            return _context.tbUsuarios.ToList();
        }
    }
}