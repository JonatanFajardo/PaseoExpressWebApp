using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.EntityFrameworkCore;
using PaseoExpressWebApp.Context;
using PaseoExpressWebApp.Data;
using PaseoExpressWebApp.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddSingleton<WeatherForecastService>();




// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
//builder.Services.AddHttpClient<ComprobanteDiarioService>(client =>
//{
//    client.BaseAddress = new Uri("http://localhost:3000/");
//});

builder.Services.AddDbContext<DB_UberContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
});

builder.Services.AddScoped<comprobantediarioservice>();
builder.Services.AddScoped<TransaccionesService>();

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

app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
