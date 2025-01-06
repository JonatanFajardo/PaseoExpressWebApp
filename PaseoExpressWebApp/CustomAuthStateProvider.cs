namespace PaseoExpressWebApp
{
    using Microsoft.AspNetCore.Components.Authorization;
    using System.Security.Claims;

    public class CustomAuthStateProvider : AuthenticationStateProvider
    {
        private ClaimsPrincipal _anonymous = new ClaimsPrincipal(new ClaimsIdentity());
        private bool _isAuthenticated = false;

        public void MarkUserAsAuthenticated(string email)
        {
            var claims = new[]
            {
            new Claim(ClaimTypes.Name, email)
        };

            var identity = new ClaimsIdentity(claims, "apiauth_type");
            var user = new ClaimsPrincipal(identity);

            _isAuthenticated = true;
            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(user)));
        }

        public void MarkUserAsLoggedOut()
        {
            _isAuthenticated = false;
            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(_anonymous)));
        }

        public override Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            if (_isAuthenticated)
            {
                var claims = new[]
                {
                new Claim(ClaimTypes.Name, "admin@gmail.com")
            };
                var identity = new ClaimsIdentity(claims, "apiauth_type");
                var user = new ClaimsPrincipal(identity);
                return Task.FromResult(new AuthenticationState(user));
            }

            return Task.FromResult(new AuthenticationState(_anonymous));
        }
    }

}
