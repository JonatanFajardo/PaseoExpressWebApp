using Blazored.SessionStorage;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.EntityFrameworkCore;
using MudBlazor.Services;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Extensiones;
using PaseoExpressWebApp.Hubs;
using PaseoExpressWebApp.Services;

var builder = WebApplication.CreateBuilder(args);


//NUGETS

//blazored.session.Storage
//microsoft.aspnetcore.components.authorization



// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();




// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();

builder.Services.AddSignalR();

builder.Services.AddHttpClient();


//Proteger P�ginas en Blazor:

builder.Services.AddAuthorizationCore();
builder.Services.AddBlazoredSessionStorage();
builder.Services.AddScoped<AuthenticationStateProvider, AutenticacionExtension>();



//builder.Services.AddHttpClient<ComprobanteDiarioService>(client =>
//{
//    client.BaseAddress = new Uri("http://localhost:3000/");
//});
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAllOrigins", builder =>
    {
        builder.AllowAnyOrigin() // Permitir cualquier origen
               .AllowAnyMethod() // Permitir cualquier m�todo
               .AllowAnyHeader(); // Permitir cualquier encabezado
    });
});

builder.Services.AddDbContext<DB_UberContext>(options =>
        options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddAutoMapper(typeof(Program).Assembly); // Configuraci�n de AutoMapper

//builder.Services.AddDbContext<DB_UberContext_My>(options =>
//{
//    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
//});

builder.Services.AddScoped<comprobantediarioservice>();
builder.Services.AddScoped<TransaccionesService>();
builder.Services.AddTransient<VehiculoService>();
builder.Services.AddScoped<ServicioServices>();
builder.Services.AddScoped<LoginService>();
builder.Services.AddScoped<ChatSignalService>();
builder.Services.AddHttpClient();

builder.Services.AddMudServices();

//builder.Services.AddDbContext<DB_UberContext>(options =>
//    options.UseSqlServer());
//builder.Services.AddScoped<ComprobanteDiarioService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}


app.MapControllers();


app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseCors(builder => builder
    .AllowAnyOrigin() // O especifica los or�genes permitidos
    .AllowAnyMethod()
    .AllowAnyHeader());

app.UseRouting();

//app.MapBlazorHub();
//app.MapFallbackToPage("/_Host");


//app.UseEndpoints(endpoints =>
//{
//    // Configurar la ruta del hub
//    endpoints.MapHub<YourHub>("/transacciones");

//    // Mapear otros controladores o p�ginas
//    //endpoints.MapControllers(); // Si tienes controladores
//    endpoints.MapBlazorHub(); // Si est�s usando Blazor Server
//    //endpoints.MapFallbackToPage("/_Host"); // Si usas Blazor Server o WebAssembly
//});

app.UseEndpoints(endpoints =>
{
    endpoints.MapBlazorHub(); // Mapeo de Blazor Hub
    endpoints.MapFallbackToPage("/_Host"); // P�gina de fallback para Blazor

    // Configurar la ruta del hub de SignalR
    endpoints.MapHub<YourHub>("/YourHub");
});

app.Run();
