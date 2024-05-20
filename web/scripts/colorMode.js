
let colorMode = 'light';

document.getElementById('btn-theme').addEventListener('click', setTheme);

function changeTheme(){
    // Alterar ícone
    var icone = document.getElementById('btn-theme-icon');
    var oldIcon = colorMode === 'light' ? 'bi-moon' : 'bi-sun';
    var newIcon = colorMode === 'light' ? 'bi-sun' : 'bi-moon';

    icone.classList.remove(oldIcon);
    icone.classList.add(newIcon);
    
    // Alterar tema body
    var bodyElement = document.querySelector('body');
    bodyElement.setAttribute('data-bs-theme', colorMode);
    
    // alterar classes
    var oldClass = colorMode === 'light' ? 'bg-dark' : 'bg-light';
    var newClass = colorMode === 'light' ? 'bg-light' : 'bg-dark';
    
    var elements = document.querySelectorAll('.' + oldClass);
    
    elements.forEach(function(element) {
        element.classList.remove(oldClass);
        element.classList.add(newClass);
    });
    
    // Gráficos
    if (typeof exibeResult === 'function') {
        exibeResult();
    }
}

function setTheme() {
    colorMode = colorMode === 'light' ? 'dark' : 'light';
    localStorage.setItem('theme', colorMode);
    changeTheme();
}

function loadTheme() {
    colorMode = localStorage.getItem('theme');
    if (!colorMode) {
        colorMode = 'light';  // Tema inicial
        localStorage.setItem('theme', colorMode);
    }
    changeTheme();
}


window.addEventListener("load", loadTheme);
