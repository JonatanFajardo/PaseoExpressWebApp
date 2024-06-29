window.crearGraficaTransacciones = (transaccionesMensuales) => {
    const ctx = document.getElementById('transaccionesChart').getContext('2d');
    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

    const datosGastos = new Array(12).fill(0);
    const datosIngresos = new Array(12).fill(0);

    transaccionesMensuales.forEach(transaccion => {
        datosGastos[transaccion.mes - 1] = transaccion.gastos;
        datosIngresos[transaccion.mes - 1] = transaccion.ingresos;
    });

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: meses,
            datasets: [
                {
                    label: 'Gastos',
                    data: datosGastos,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Ingresos',
                    data: datosIngresos,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
};

window.crearGraficaTransaccionesVehiculo = (transaccionesMensuales) => {
    const ctx = document.getElementById('transaccionesChartVehiculo').getContext('2d');
    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

    const datosGastos = new Array(12).fill(0);
    const datosIngresos = new Array(12).fill(0);

    transaccionesMensuales.forEach(transaccion => {
        datosGastos[transaccion.mes - 1] = transaccion.gastos;
        datosIngresos[transaccion.mes - 1] = transaccion.ingresos;
    });

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: meses,
            datasets: [
                {
                    label: 'Gastos',
                    data: datosGastos,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Ingresos',
                    data: datosIngresos,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
};
