<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pulse and Bandwidth Lab</title>
        <link rel="icon" type="image/x-icon" href="assets/icon.ico">

        <!-- Styles -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">        
        <link href="styles/style.css" rel="stylesheet" type="text/css"/>

        <!-- highcharts.js -->
        <script src="https://code.highcharts.com/highcharts.js"></script>
    </head>
    <body data-bs-theme="light">
        <nav class="navbar navbar-expand-lg border-bottom bg-light fixed-top">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item ps-3">
                            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/">Home</a>
                        </li>
                        <li class="nav-item ps-3">
                            <a class="nav-link" aria-current="page" href="pages/pbl.jsp">Laboratório</a>
                        </li>
                        <li class="nav-item ps-3">
                            <a class="nav-link" aria-current="page" href="pages/about.jsp">Sobre</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <main class="container">
            <h1 class="mb-5">Pulse and Bandwidth Lab</h1>
            <p class="text-center mx-5 mt-3">O objetivo desse projeto é criar um <strong>Simulador de Canal de Comunicação</strong>, que, diante da entrada do usuário, exibirá como será o sinal de saída resultante.</p>
            <section id="home-graficos" class="my-5">
                <div id="exemplo-entrada" class="grafico-exemplo"></div>
                <h1><i class="bi bi-arrow-right-square-fill"></i></h1>
                <div id="exemplo-saida" class="grafico-exemplo"></div>
            </section>
            <a class="btn btn-secondary" href="pages/pbl.jsp">Acessar</a>
        </main>
        <footer class="fixed-bottom py-3 border-top bg-light">
            <div class="container d-flex justify-content-between">
                <p class="text-muted ms-5">Projeto desenvolvido no 7° semestre do curso de Engenharia de Computação</p>
                <div class="d-flex align-items-center">
                    <button id="btn-theme"><h4><i id="btn-theme-icon" class="bi bi-sun"></i></h4></button>
                </div>
            </div>
        </footer>
        <!-- Script Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="scripts/colorMode.js"></script>
        <script src="scripts/example.js"></script>
    </body>
</html>
