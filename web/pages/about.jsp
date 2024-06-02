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
    </head>
    <body class="bg-light">
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
                            <a class="nav-link" aria-current="page" href="pbl.jsp">Laboratório</a>
                        </li>
                        <li class="nav-item ps-3">
                            <a class="nav-link" aria-current="page" href="#">Sobre</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
                        
        <main class="container my-5 py-5">
            <div class="container mt-5">
                <h1 class="text-center mb-4">Integrantes do Grupo</h1>
                
                <div class="d-flex text-center">
                    <div class="card card-profile m-3">
                        <img src="../img/Vitor.jpg" class="card-img-top" alt="Foto do Integrante Vitor">
                        <div class="card-body">
                            <h5 class="card-title">Vitor Henrique Carvalho Silva</h5>
                            <p class="card-text fs-5">RA: 081200030</p>
                            <p class="card-text fs-5"><i>Especificar</i></p>
                        </div>
                    </div>
                    <div class="card card-profile m-3">
                        <img src="../img/Vinicius.jpg" class="card-img-top" alt="Foto do Integrante Vinícius">
                        <div class="card-body">
                            <h5 class="card-title">Vinicius Benevides da Silva</h5>
                            <p class="card-text fs-5">RA: 081210030</p>
                            <p class="card-text fs-5"><i>Implementar</i></p>
                        </div>
                    </div>
                    <div class="card card-profile m-3">
                        <img src="../img/Analuz.jpg" class="card-img-top" alt="Foto do Integrante Analuz">
                        <div class="card-body">
                            <h5 class="card-title">Analuz Marin Ramos</h5>
                            <p class="card-text fs-5">RA: 081210034</p>
                            <p class="card-text fs-5"><i>Implementar</i></p>
                        </div>
                    </div>
                    <div class="card card-profile m-3">
                        <img src="../img/Marcelly.jpg" class="card-img-top" alt="Foto do Integrante Marcelly">
                        <div class="card-body">
                            <h5 class="card-title">Marcelly Molinari Marsura</h5>
                            <p class="card-text fs-5">RA: 081210020</p>
                            <p class="card-text fs-5"><i>Validar</i></p>
                        </div>
                    </div>
                </div>

                <div class="container mt-5">
                    <h1 class="text-center mb-4">Sobre o Projeto</h1>
                    <div class="card p-4">
                        <div class="card-body">
                            <p class="card-text fs-5">
                                Este projeto foi desenvolvido durante o 7º semestre do curso de Engenharia da Computação, 
                                como entregável para a atividade <b>Project-Based Learning</b> (PBL). O trabalho integra conhecimentos adquiridos 
                                nas disciplinas de Linguagem de Programação III, Engenharia de Software e Comunicação de Dados.
                            </p>
                            <div id="carousel" class="carousel slide">
                                <div class="carousel-inner text-center">
                                    <div class="carousel-item active">
                                        <p>
                                            <strong>Linguagem de Programação III:</strong> Nesta disciplina, exploramos conceitos avançados de programação 
                                            utilizando a linguagem Java, desenvolvendo aplicativos Web utlizando <b>Java with Ant</b> para aplicações WEB, 
                                            <b>GlassFish</b> Server, usando <b>Jakarta EE 10 Web</b> como Java EE Version. O projeto segue a arquitetura 
                                            <b>MVC</b> aprendida em aula.
                                        </p>
                                    </div>
                                    <div class="carousel-item">
                                        <p>
                                            <strong>Engenharia de Software:</strong> Para esse projeto, aplicamos o Kanban com o Essence, proporcionando uma 
                                            abordagem prática e organizada para o desenvolvimento do projeto. Segue link do quadro Trello com o qual a equipe 
                                            trabalhou: 
                                            <a target="_blank" href="https://trello.com/invite/b/OqgM6AWd/ATTI3970c79f7388d9adb86ea18d31fd3770E812441E/pbl-canais-de-comunicacao">Quadro Kanban Trello</a>
                                        </p>
                                    </div>
                                    <div class="carousel-item">
                                        <p>
                                            <strong>Comunicação de Dados:</strong> Dessa disciplina surgiram os requisitos para o desenvolvimento desse projeto. 
                                            Focalizou na aplicação da análise de Fourier e no estudo de canais reais e teóricos, conhecimentos essenciais para a 
                                            integração e funcionamento das diferentes partes do sistema desenvolvido.
                                        </p>
                                    </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon bg-light" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
                                    <span class="carousel-control-next-icon bg-light" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                            <p class="card-text fs-5">
                                O Project-Based Learning (PBL) permite a aplicação prática dos conceitos teóricos aprendidos em sala de aula, promovendo 
                                uma experiência educacional mais rica e significativa. Através deste projeto, tivemos a oportunidade de trabalhar em equipe, 
                                enfrentar desafios reais e desenvolver soluções inovadoras.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </main>
                        
            <footer class="fixed-bottom py-3 border-top bg-light">
            <div class="container d-flex justify-content-between">
                <p class="text-muted ms-5">Projeto desenvolvido no 7° semestre do curso de Engenharia de Computação</p>
                <div class="d-flex align-items-center">
                    <button id="btn-theme"><h4><i id="btn-theme-icon" class="bi bi-sun"></i></h4></button>
                </div>
            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="../scripts/colorMode.js"></script>
    </body>
</html>
