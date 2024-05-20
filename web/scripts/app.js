
const form = document.getElementById('form');
const frequenciaElement = document.getElementById('frequencia');
const tipoSinalElement = document.getElementById('tipoSinal');
const passaFaixasElement = document.getElementById('passaFaixas');
const canalRealElement = document.getElementById('canalReal');
const frequenciaMinElement = document.getElementById('frequenciaMin');
const frequenciaMaxElement = document.getElementById('frequenciaMax');
const phaseUnitElement = document.getElementById('phaseUnit');
const btnRelatorio = document.getElementById('btn-relatorio');

var requestResult;

form.addEventListener('submit', function(event){
    event.preventDefault();
    
    try {
        const formData = retornaFormData(event);
        
        if(!realizaValidacoes(formData)){
            return;
        }
        
        realizaChamadoServlet(formData);
        
        
    } catch(error) {
        alert('Erro ao enviar requisição: ' + error);
    }
});

function retornaFormData(event){
    frequenciaMinElement.disabled = false; // Habilito para entrar no form data
        
    formData = new FormData(event.target);
        
    frequenciaMinElement.disabled = passaFaixasElement.checked;  // Desabilito novamente se necessário

    return formData;
}

function realizaValidacoes(formData){
    const frequencia = parseFloat(formData.get('frequencia'));
    const tipoSinal = formData.get('tipoSinal');
    const frequenciaMin = parseFloat(formData.get('frequenciaMin'));
    const frequenciaMax = parseFloat(formData.get('frequenciaMax'));
    
    frequenciaElement.classList.remove('input-error');
    tipoSinalElement.classList.remove('input-error');
    frequenciaMinElement.classList.remove('input-error');
    frequenciaMaxElement.classList.remove('input-error');
    
    if(frequencia <= 0 || frequencia > 100){
        frequenciaElement.classList.add('input-error');
        alert("A frequência fundamental deve estar entre 1 e 100");
        frequenciaElement.focus(); 
        return false;
    }
    
    if(!tipoSinal){
        tipoSinalElement.classList.add('input-error');
        alert("O tipo de sinal deve ser preenchido");
        tipoSinalElement.focus(); 
        return false;
    }
    
    if(frequenciaMax <= 0){
        frequenciaMaxElement.classList.add('input-error');
        alert("A frequência máxima não pode ser zero");
        frequenciaMaxElement.focus(); 
        return false;
    }
    
    if(frequenciaMin < 0 || frequenciaMin > 100){
        frequenciaMinElement.classList.add('input-error');
        alert("A frequência mínima deve estar entre 0 e 100");
        frequenciaMinElement.focus(); 
        return false;
    }
    
    if(frequenciaMax <= 0 || frequenciaMax > 100){
        frequenciaMaxElement.classList.add('input-error');
        alert("A frequência máxima deve estar entre 0 e 100");
        frequenciaMaxElement.focus(); 
        return false;
    }
    
    if(frequenciaMin >= frequenciaMax){
        frequenciaMinElement.classList.add('input-error');
        frequenciaMaxElement.classList.add('input-error');
        alert("A frequência mínima deve ser menor que a frequência máxima do canal");
        frequenciaMinElement.focus(); 
        return false;
    }
    
    return true;
}

function realizaChamadoServlet(formData){
    const xhr = new XMLHttpRequest();
    xhr.open('POST', '../PBLController');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    xhr.onload = function() {
        if (xhr.status === 200) {
            var result = JSON.parse(xhr.responseText);
            
            if(result.error){
                alert('Erro do servidor: ' + result.error);
            } else {
                requestResult = result;
                exibeResult();
            }
        } else {
            alert('Erro ao enviar requisição: ' + xhr.statusText);
        }
    };
    
    const encodedFormData = new URLSearchParams(formData).toString();
    xhr.send(encodedFormData);
}

function exibeResult(){
    if(!requestResult)
        return;
    
    let phaseUnit = phaseUnitElement.value;
    indiceFase = 180 / Math.PI;
    
    // Sinais
    atualizarGraficoLinha(requestResult.emitted.signal, 'sinal-emitido', 'Sinal Emitido', 'Tempo (ms)', 'Amplitude', '#00A400');    
    atualizarGraficoLinha(requestResult.received.signal, 'sinal-recebido', 'Sinal Recebido', 'Tempo (ms)', 'Amplitude', '#0D6EFD');    
    
    // Modulos
    atualizarGraficoBarras(requestResult.emitted.amplitude, 'modulo-emitido', 'Módulo da Resposta em frequência Emitido', 'Frequência (kHz)', 'Amplitude', '#00A400');    
    atualizarGraficoLinha(requestResult.channel.responseModule, 'modulo-canal', 'Modulo da resposta em Frequência', 'Frequência (kHz)', 'Amplitude', '#FF0B0B');    
    atualizarGraficoBarras(requestResult.received.amplitude, 'modulo-recebido', 'Módulo da Resposta em frequência Recebido', 'Frequência (kHz)', 'Amplitude', '#0D6EFD');    
    
    // Fases
    if(phaseUnit === 'radianos'){
        atualizarGraficoBarras(requestResult.emitted.phase, 'fase-emitido', 'Fase da Resposta em frequência Emitido', 'Frequência (kHz)', 'Fase (radianos)', '#00A400');   
        atualizarGraficoLinha(requestResult.channel.responsePhase, 'fase-canal', 'Fase da resposta em Frequência', 'Frequência (kHz)', 'Fase (radianos)', '#FF0B0B');    
        atualizarGraficoBarras(requestResult.received.phase, 'fase-recebido', 'Fase da Resposta em frequência Recebido', 'Frequência (kHz)', 'Fase (radianos)', '#0D6EFD');
    } else {
        atualizarGraficoBarras(requestResult.emitted.phase.map(obj => ({ x: obj.x, y: obj.y * indiceFase })), 'fase-emitido', 'Fase da Resposta em frequência Emitido', 'Frequência (kHz)', 'Fase (graus)', '#00A400');   
        atualizarGraficoLinha(requestResult.channel.responsePhase.map(obj => ({ x: obj.x, y: obj.y * indiceFase })), 'fase-canal', 'Fase da resposta em Frequência', 'Frequência (kHz)', 'Fase (graus)', '#FF0B0B');    
        atualizarGraficoBarras(requestResult.received.phase.map(obj => ({ x: obj.x, y: obj.y * indiceFase })), 'fase-recebido', 'Fase da Resposta em frequência Recebido', 'Frequência (kHz)', 'Fase (graus)', '#0D6EFD');
    }
    
    btnRelatorio.classList.remove('d-none');
    requestResult.phaseUnit = phaseUnit;
    localStorage.setItem('requestResult', JSON.stringify(requestResult));
}

function atualizarGraficoLinha(dados, grafico, nome, xName, yName, cor) {
    
    const fontColor = colorMode === 'dark' ? '#f8f9fa' : '#454545';
    
    var chart = Highcharts.chart(grafico, {
        chart: {
            type: 'line',
            backgroundColor: 'transparent',
            style: {
                fontFamily: 'Arial, sans-serif',
                color: fontColor
            }
        },
        title: {
            text: nome,
            style: {
                color: fontColor
            }
        },
        xAxis: {
            title: {
                text: xName,
                style: {
                    color: fontColor
                }
            },
            labels: {
                style: {
                    color: fontColor
                }
            }
        },
        yAxis: {
            title: {
                text: yName,
                style: {
                    color: fontColor
                }
            },
            labels: {
                style: {
                    color: fontColor
                }
            }
        },
        legend: {
            style: {
                color: fontColor
            }
        },
        series: [{
            name: nome,
            data: dados,
            color: cor,
            borderColor: 'transparent',
            marker: {
                enabled: false
            }
        }]
    });
}

function atualizarGraficoBarras(dados, grafico, nome, xName, yName, cor) {
    
    const fontColor = colorMode === 'dark' ? '#f8f9fa' : '#454545';
    
    var chart = Highcharts.chart(grafico, {
        chart: {
            type: 'column',
            backgroundColor: 'transparent',
            style: {
                fontFamily: 'Arial, sans-serif',
                color: fontColor
            }
        },
        title: {
            text: nome,
            style: {
                color: fontColor
            }
        },
        xAxis: {
            title: {
                text: xName,
                style: {
                    color: fontColor
                }
            },
            labels: {
                style: {
                    color: fontColor
                }
            }
        },
        yAxis: {
            title: {
                text: yName,
                style: {
                    color: fontColor
                }
            },
            labels: {
                style: {
                    color: fontColor
                }
            }
        },
        legend: {
            style: {
                color: fontColor
            }
        },
        series: [{
            name: nome,
            data: dados,
            color: cor,
            borderColor: 'transparent'
        }]
    });
}

passaFaixasElement.addEventListener('change', function() {
    const labelTipoCanalFaixa = document.getElementById('labelPassaFaixas');
    
    if(passaFaixasElement.checked){
        labelTipoCanalFaixa.innerHTML = 'Passa-Baixas';
        frequenciaMinElement.value = 0;
        frequenciaMinElement.disabled = true;
    } else {
        labelTipoCanalFaixa.innerHTML = 'Passa-Faixas';
        frequenciaMinElement.value = '';
        frequenciaMinElement.disabled = false;

    }
});

canalRealElement.addEventListener('change', function() {
    const labelTipoCanalReal = document.getElementById('labelTipoCanalReal');
    
    labelTipoCanalReal.innerHTML = canalRealElement.checked ? 'Canal Real' : 'Canal Teórico';
});

phaseUnitElement.addEventListener('change', function() {
    exibeResult();
});
