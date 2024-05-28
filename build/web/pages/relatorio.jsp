<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pulse and Bandwidth Lab</title>
        <link rel="icon" type="image/x-icon" href="../assets/icon.ico">
        
        <!-- Styles -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">        
        <link href="../styles/relatorio.css" rel="stylesheet" type="text/css"/>

        <!-- highcharts.js -->
        <script src="https://code.highcharts.com/highcharts.js"></script>
    </head>
    <body class="container">
        <main>
            <div id="graficos" class="text-center mt-1">
                
                <section class="container table-container">
                    <table class="table table-bordered m-0 text-center">
                        <tbody>
                            <tr>
                                <td rowspan="3" class="align-middle" style="width: 20%;">
                                    <img src="../assets/icon.ico" alt="Ícone da Aplicação" class="img-fluid">
                                </td>
                                <td colspan="3"><strong>Pulse and Bandwidth Lab</strong></td>
                            </tr>
                            <tr>
                                <td>Onda: <b><span class="signalType"></span></b></td>
                                <td>Frequência: <span class="frequency"></span> kHz</td>
                                <td>Data: <span class="todayDate"></span></td>
                            </tr>
                            <tr>
                                <td>Canal: <b><span class="channelType"></span></b></td>
                                <td>Mínimo: <span class="minFrequency"></span> kHz</td>
                                <td>Máximo: <span class="maxFrequency"></span> kHz</td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <div class="d-flex justify-content-evenly align-items-center">
                    <h2>Sinal Emitido</h2>
                    <div id="sinal-emitido" class="grafico-main"></div>             
                </div>
                <div class="d-flex justify-content-evenly align-items-center">
                    <h2>Sinal Recebido</h2>
                    <div id="sinal-recebido" class="grafico-main"></div>
                </div>
                
                <section class="container table-container">
                    <table class="table table-bordered m-0 text-center">
                        <tbody>
                            <tr>
                                <td rowspan="3" class="align-middle" style="width: 20%;">
                                    <img src="../assets/icon.ico" alt="Ícone da Aplicação" class="img-fluid">
                                </td>
                                <td colspan="3"><strong>Pulse and Bandwidth Lab</strong></td>
                            </tr>
                            <tr>
                                <td>Onda: <b><span class="signalType"></span></b></td>
                                <td>Frequência: <span class="frequency"></span> kHz</td>
                                <td>Data: <span class="todayDate"></span></td>
                            </tr>
                            <tr>
                                <td>Canal: <b><span class="channelType"></span></b></td>
                                <td>Mínimo: <span class="minFrequency"></span> kHz</td>
                                <td>Máximo: <span class="maxFrequency"></span> kHz</td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <div class="d-flex justify-content-evenly align-items-center">
                    <h2>Módulo Emitido</h2>
                    <div id="modulo-emitido" class="grafico"></div>
                    <h2>Fase Emitida</h2>
                    <div id="fase-emitido" class="grafico"></div>
                </div>
                
                <section class="container table-container">
                    <table class="table table-bordered m-0 text-center">
                        <tbody>
                            <tr>
                                <td rowspan="3" class="align-middle" style="width: 20%;">
                                    <img src="../assets/icon.ico" alt="Ícone da Aplicação" class="img-fluid">
                                </td>
                                <td colspan="3"><strong>Pulse and Bandwidth Lab</strong></td>
                            </tr>
                            <tr>
                                <td>Onda: <b><span class="signalType"></span></b></td>
                                <td>Frequência: <span class="frequency"></span> kHz</td>
                                <td>Data: <span class="todayDate"></span></td>
                            </tr>
                            <tr>
                                <td>Canal: <b><span class="channelType"></span></b></td>
                                <td>Mínimo: <span class="minFrequency"></span> kHz</td>
                                <td>Máximo: <span class="maxFrequency"></span> kHz</td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <div class="d-flex justify-content-evenly align-items-center">
                    <h2>Módulo Canal</h2>
                    <div id="modulo-canal" class="grafico"></div>
                    <h2>Fase Canal</h2>
                    <div id="fase-canal" class="grafico"></div>
                </div>
                
                <section class="container table-container">
                    <table class="table table-bordered m-0 text-center">
                        <tbody>
                            <tr>
                                <td rowspan="3" class="align-middle" style="width: 20%;">
                                    <img src="../assets/icon.ico" alt="Ícone da Aplicação" class="img-fluid">
                                </td>
                                <td colspan="3"><strong>Pulse and Bandwidth Lab</strong></td>
                            </tr>
                            <tr>
                                <td>Onda: <b><span class="signalType"></span></b></td>
                                <td>Frequência: <span class="frequency"></span> kHz</td>
                                <td>Data: <span class="todayDate"></span></td>
                            </tr>
                            <tr>
                                <td>Canal: <b><span class="channelType"></span></b></td>
                                <td>Mínimo: <span class="minFrequency"></span> kHz</td>
                                <td>Máximo: <span class="maxFrequency"></span> kHz</td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <div class="d-flex justify-content-evenly align-items-center">
                    <h2>Modulo Recebido</h2>
                    <div id="modulo-recebido" class="grafico"></div>
                    <h2>Fase Recebida</h2>
                    <div id="fase-recebido" class="grafico"></div>
                </div>
            </div>
        </main>

        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="../scripts/relatorio.js"></script>
    </body>
</html>
