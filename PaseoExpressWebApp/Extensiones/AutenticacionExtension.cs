using Blazored.SessionStorage;
using Microsoft.AspNetCore.Components.Authorization;
using PaseoExpressWebApp.Models;
using System.Security.Claims;

namespace PaseoExpressWebApp.Extensiones
{
    public class AutenticacionExtension : AuthenticationStateProvider
    {
        private readonly ISessionStorageService _sessionStorage;
        private ClaimsPrincipal _sinInformacion = new ClaimsPrincipal(new ClaimsIdentity());

        public AutenticacionExtension(ISessionStorageService sessionStorage)
        {
            _sessionStorage = sessionStorage;
        }

        public async Task ActualizarEstadoAutenticacion(LoginDto? sesionUsuario)
        {
            ClaimsPrincipal claimsPrincipal;

            if (sesionUsuario != null)
            {
                claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
                {
                    new Claim(ClaimTypes.Name,sesionUsuario.Correo),
                    new Claim("IdUser", sesionUsuario.IdUser.ToString()), // Claim para el ID
                    //new Claim("Imagen", sesionUsuario.Imagen),
                    //new Claim(ClaimTypes.Email,sesionUsuario.Clave),
                    new Claim(ClaimTypes.Role,sesionUsuario.Rol)
                }, "JwtAuth"));

                await _sessionStorage.GuardarStorage("sesionUsuario", sesionUsuario);
            }
            else
            {
                claimsPrincipal = _sinInformacion;
                await _sessionStorage.RemoveItemAsync("sesionUsuario");
            }

            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));

        }


        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            var sesionUsuario = await _sessionStorage.ObtenerStorage<LoginDto>("sesionUsuario");

            if (sesionUsuario == null)
                return await Task.FromResult(new AuthenticationState(_sinInformacion));

            var claimPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new List<Claim>
                {
                    new Claim(ClaimTypes.Name,sesionUsuario.Correo),
                    new Claim("IdUser", sesionUsuario.IdUser.ToString()), // Claim para el ID
                    new Claim("Imagen", sesionUsuario.Imagen),
                    new Claim(ClaimTypes.Role,sesionUsuario.Rol)
                }, "JwtAuth"));


            return await Task.FromResult(new AuthenticationState(claimPrincipal));

        }

        public async Task<LoginDto> GetSessionUser()
        {
            LoginDto sesionUsuario = await _sessionStorage.ObtenerStorage<LoginDto>("sesionUsuario");
            return sesionUsuario;
        }
    }
}
