using Microsoft.EntityFrameworkCore;
using MudBlazor.Services;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Hubs;
using PaseoExpressWebApp.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();




// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();

builder.Services.AddSignalR();

//builder.Services.AddHttpClient<ComprobanteDiarioService>(client =>
//{
//    client.BaseAddress = new Uri("http://localhost:3000/");
//});
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAllOrigins", builder =>
    {
        builder.AllowAnyOrigin() // Permitir cualquier origen
               .AllowAnyMethod() // Permitir cualquier método
               .AllowAnyHeader(); // Permitir cualquier encabezado
    });
});

builder.Services.AddDbContext<DB_UberContext>(options =>
        options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddAutoMapper(typeof(Program).Assembly); // Configuración de AutoMapper

//builder.Services.AddDbContext<DB_UberContext_My>(options =>
//{
//    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
//});

builder.Services.AddScoped<comprobantediarioservice>();
builder.Services.AddScoped<TransaccionesService>();
builder.Services.AddTransient<VehiculoService>();
builder.Services.AddScoped<ServicioServices>();
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




app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseCors(builder => builder
    .AllowAnyOrigin() // O especifica los orígenes permitidos
    .AllowAnyMethod()
    .AllowAnyHeader());

app.UseRouting();

//app.MapBlazorHub();
//app.MapFallbackToPage("/_Host");


//app.UseEndpoints(endpoints =>
//{
//    // Configurar la ruta del hub
//    endpoints.MapHub<YourHub>("/transacciones");

//    // Mapear otros controladores o páginas
//    //endpoints.MapControllers(); // Si tienes controladores
//    endpoints.MapBlazorHub(); // Si estás usando Blazor Server
//    //endpoints.MapFallbackToPage("/_Host"); // Si usas Blazor Server o WebAssembly
//});

app.UseEndpoints(endpoints =>
{
    endpoints.MapBlazorHub(); // Mapeo de Blazor Hub
    endpoints.MapFallbackToPage("/_Host"); // Página de fallback para Blazor

    // Configurar la ruta del hub de SignalR
    endpoints.MapHub<YourHub>("/YourHub");
});

app.Run();
