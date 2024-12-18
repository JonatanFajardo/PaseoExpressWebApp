window.crearGraficaTransacciones = (transaccionesMensuales) => {

    var existingChart = Chart.getChart('transaccionesChart'); // Verifica si ya existe un gráfico

    // Si ya existe un gráfico, destrúyelo
    if (existingChart) {
        existingChart.destroy();
    }

    const ctx = document.getElementById('transaccionesChart').getContext('2d');
    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    const datosGastos = new Array(12).fill(0);
    const datosIngresos = new Array(12).fill(0);

    transaccionesMensuales.forEach(transaccion => {
        datosGastos[transaccion.mes - 1] = transaccion.gastos;
        datosIngresos[transaccion.mes - 1] = transaccion.ingresos;
    });

    new Chart(ctx, {
        type: 'line',
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
                    borderColor: 'rgba(0, 1, 13)',
                    borderWidth: 1
                }
            ]
        },
        options: {
            plugins: {
                datalabels: {
                    display: true,
                    anchor: 'end',
                    align: 'top',
                    formatter: (value, context) => value,
                    color: 'black'
                },
                //legend: {
                //    position: 'bottom'  // Cambia 'top' por 'left', 'bottom' o 'right' según lo necesites
                //}
            },
            scales: {
                y: {
                    beginAtZero: true
                }
            },

        },
        //plugins: [ChartDataLabels]
    });
};

//window.crearGraficaTransaccionesVehiculo = (transaccionesMensuales) => {
//    const ctx = document.getElementById('transaccionesChartVehiculo').getContext('2d');
//    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

//    const datosGastos = new Array(12).fill(0);
//    const datosIngresos = new Array(12).fill(0);

//    transaccionesMensuales.forEach(transaccion => {
//        datosGastos[transaccion.mes - 1] = transaccion.gastos;
//        datosIngresos[transaccion.mes - 1] = transaccion.ingresos;
//    });

//    new Chart(ctx, {
//        type: 'bar',
//        data: {
//            labels: meses,
//            datasets: [
//                {
//                    label: 'Gastos',
//                    data: datosGastos,
//                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
//                    borderColor: 'rgba(255, 99, 132, 1)',
//                    borderWidth: 1
//                },
//                {
//                    label: 'Ingresos',
//                    data: datosIngresos,
//                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
//                    borderColor: 'rgba(54, 162, 235, 1)',
//                    borderWidth: 1
//                }
//            ]
//        },
//        options: {
//            plugins: {
//                datalabels: {
//                    display: true,
//                    anchor: 'end',
//                    align: 'top',
//                    formatter: (value, context) => value.toFixed(2),
//                    color: 'black'
//                }
//            },
//            scales: {
//                y: {
//                    beginAtZero: true
//                }
//            }
//        },
//        plugins: [ChartDataLabels]
//    });
//};
