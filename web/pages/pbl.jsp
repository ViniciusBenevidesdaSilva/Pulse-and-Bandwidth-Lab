<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="br.edu.fesa.utils.EnumSignalType"%>
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
        <link href="../styles/style.css" rel="stylesheet" type="text/css"/>

        <!-- highcharts.js -->
        <script src="https://code.highcharts.com/highcharts.js"></script>
    </head>
    <body class="bg-light">
        <%
            HashMap<Integer, String> signalTypes = EnumSignalType.getSignalTypes();
        %>
        <nav class="navbar navbar-expand-lg border-bottom bg-light fixed-top">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item ps-3">
                            <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/">Home</a>
                        </li>
                        <li class="nav-item ps-3">
                            <a class="nav-link active" aria-current="page" href="#">Laboratório</a>
                        </li>
                        <li class="nav-item ps-3">
                            <a class="nav-link" aria-current="page" href="about.jsp">Sobre</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <main class="container my-5 py-5">
            <h1 class="my-5">Pulse and Bandwidth Lab</h1>
            <section class="accordion" id="accordionForm">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button id="btn-collapse-form" class="accordion-button accordion-button-light" type="button" data-bs-toggle="collapse" data-bs-target="#collapseForm" aria-expanded="true" aria-controls="collapseForm">
                            Dados Simulação 
                        </button>
                    </h2>
                    <div id="collapseForm" class="accordion-collapse collapse show bg-light" data-bs-parent="#accordionForm">
                        <div class="accordion-body">
                            <form id="form" action="PBLController" method="POST">
                                <h4>Sinal Emitido:</h4>
                                <div class="d-flex flex-wrap justify-content-evenly align-items-center mb-3">
                                    <div class="form-floating col-4">
                                        <input id="frequencia" name="frequencia" type="number" class="form-control bg-light" required min="1" max="100" placeholder="Frequência [kHz]">
                                        <label for="frequencia">Informe a frequência (kHz)</label>
                                    </div>
                                    <div class="form-floating col-4">
                                        <select id="tipoSinal" name="tipoSinal" class="form-select my-2 bg-light" aria-label="Tipo de Sinal" required>
                                            <option value="" disabled selected hidden>Selecione um tipo de sinal</option>
                                            <% for (Map.Entry<Integer, String> type : signalTypes.entrySet()) { %>
                                            <option value="<%= type.getKey() %>"><%= type.getValue() %></option>
                                            <% } %>
                                        </select>
                                        <label for="tipoSinal">Selecione o tipo de sinal</label>
                                    </div>
                                </div>
                                <h4>Dados Canal:</h4>
                                <div class="d-flex justify-content-evenly align-items-center mb-3">
                                    <div class=" col-4">
                                        <div class="form-floating">
                                            <input id="frequenciaMin" name="frequenciaMin" type="number" class="form-control bg-light" required min="0" max="100" placeholder="Frequência Mínima">
                                            <label for="frequenciaMin">Frequência mínima (kHz)</label>
                                        </div>
                                        <div class="form-check form-switch d-flex flex-wrap justify-content-center mt-2">
                                            <input class="form-check-input" type="checkbox" role="switch" id="passaFaixas" name="passaFaixas">
                                            <label class="form-check-label px-3" for="passaFaixas" id="labelPassaFaixas">Passa-Faixas</label>
                                        </div>
                                    </div>
                                    <div class=" col-4">
                                        <div class="form-floating">
                                            <input id="frequenciaMax" name="frequenciaMax" type="number" class="form-control bg-light" required min="0" max="100" placeholder="Frequência Máxima">
                                            <label for="frequenciaMax">Frequência máxima (kHz)</label>
                                        </div>
                                        <div class="form-check form-switch d-flex justify-content-center mt-2">
                                                    <input class="form-check-input" type="checkbox" role="switch" id="canalReal" name="canalReal" checked>
                                                    <label class="form-check-label px-3" for="canalReal" id="labelTipoCanalReal">Canal Real</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex flex-wrap justify-content-center">
                                    <button type="submit" class="btn btn-outline-success mt-2 mx-2">Calcular</button>
                                    <a id="btn-relatorio" href="relatorio.jsp" class="btn btn-outline-primary mt-2 mx-2 d-none">Gerar Relatório</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <section id="graficos" class="text-center mt-5">
                <div class="d-flex justify-content-evenly align-items-center">
                    <div id="sinal-emitido" class="grafico"></div>             
                </div>
                <div class="d-flex justify-content-evenly align-items-center">
                    <div id="modulo-emitido" class="grafico"></div>
                    <div id="fase-emitido" class="grafico"></div>
                </div>
                <div class="d-flex justify-content-evenly align-items-center">
                    <div id="modulo-canal" class="grafico"></div>
                    <div id="fase-canal" class="grafico"></div>
                </div>
                <div class="d-flex justify-content-evenly align-items-center">
                    <div id="modulo-recebido" class="grafico"></div>
                    <div id="fase-recebido" class="grafico"></div>
                </div>
                <div class="d-flex justify-content-evenly align-items-center">
                    <div id="sinal-recebido" class="grafico"></div>
                </div>
            </section>
        </main>
        <footer class="fixed-bottom py-3 border-top bg-light">
            <div class="container d-flex justify-content-between align-items-center">
                <p class="text-muted ms-5">Projeto desenvolvido no 7° semestre do curso de Engenharia de Computação</p>
                <div class="d-flex align-items-center">
                    <select class="form-select h-75 me-3 bg-light" id="phaseUnit">
                        <option value="graus">Graus</option>
                        <option value="radianos">Radianos</option>
                    </select>
                    <button id="btn-theme"><h4><i id="btn-theme-icon" class="bi bi-sun"></i></h4></button>
                </div>
            </div>
        </footer>
        
        <!-- Script Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="../scripts/colorMode.js"></script>
        <script src="../scripts/app.js"></script>
    </body>
</html>