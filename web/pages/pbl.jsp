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
    <body data-bs-theme="dark">
    <%
        HashMap<Integer, String> signalTypes = EnumSignalType.getSignalTypes();
    %>

        <main class="container">
            
            <h1 class="my-5">Project-Based Learning</h1>

            <section id="section-form" class="p-1">
                <form id="form" action="PBLController" method="POST">
                    <div class="d-flex justify-content-evenly align-items-center mb-3">
                        <h4 class="col-2">Dados Entrada:</h4>
                        <div class="form-floating col-4">
                            <input id="frequencia" name="frequencia" type="number" class="form-control" required min="1" max="100" placeholder="Frequência [kHz]">
                            <label for="frequencia">Informe a frequência (kHz)</label>
                        </div>
                        <div class="form-floating col-4">
                            <select id="tipoSinal" name="tipoSinal" class="form-select my-2" aria-label="Tipo de Sinal" required>
                                <option value="" disabled selected hidden>Selecione um tipo de sinal</option>
                                <% for (Map.Entry<Integer, String> type : signalTypes.entrySet()) { %>
                                <option value="<%= type.getKey() %>"><%= type.getValue() %></option>
                                <% } %>
                            </select>
                            <label for="tipoSinal">Selecione o tipo de sinal</label>
                        </div>
                    </div> 
                            
                    <div class="d-flex justify-content-evenly align-items-center mb-3">
                        <h4 class="col-2">Dados Canal:</h4>
                        <div class=" col-4">
                            <div class="form-check form-switch d-flex justify-content-center mb-2">
                                <input class="form-check-input" type="checkbox" role="switch" id="passaFaixas" name="passaFaixas">
                                <label class="form-check-label px-3" for="passaFaixas" id="labelPassaFaixas">Passa-Faixas</label>
                            </div>
                            <div class="form-floating">
                                <input id="frequenciaMin" name="frequenciaMin" type="number" class="form-control" required min="0" max="100" placeholder="Frequência Mínima">
                                <label for="frequenciaMin">Frequência mínima (kHz)</label>
                            </div>
                        </div>
                        <div class=" col-4">
                            <div class="form-check form-switch d-flex justify-content-center mb-2">
                                <input class="form-check-input" type="checkbox" role="switch" id="canalReal" name="canalReal" checked>
                                <label class="form-check-label px-3" for="canalReal" id="labelTipoCanalReal">Canal Real</label>
                            </div>
                            <div class="form-floating">
                                <input id="frequenciaMax" name="frequenciaMax" type="number" class="form-control" required min="0" max="100" placeholder="Frequência Máxima">
                                <label for="frequenciaMax">Frequência máxima (kHz)</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-secondary mt-2">Calcular</button>
                    </div>
                </form>
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
        
        
        <script src="../scripts/app.js"></script>
        <!-- Script Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>