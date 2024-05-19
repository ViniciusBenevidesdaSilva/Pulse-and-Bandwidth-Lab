
const form = document.getElementById('form');
const frequenciaElement = document.getElementById('frequencia');
const tipoSinalElement = document.getElementById('tipoSinal');
const frequenciaMinElement = document.getElementById('frequenciaMin');
const frequenciaMaxElement = document.getElementById('frequenciaMax');

form.addEventListener('submit', function(event){
    event.preventDefault();
    
    try {
        const formData = new FormData(event.target);
        
        if(!realizaValidacoes(formData)){
            return;
        }
        
        realizaChamadoServlet(formData);
       
    } catch(error) {
        alert('Erro ao enviar requisição: ' + error);
    }
});

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
                exibeResult(result);
            }
        } else {
            alert('Erro ao enviar requisição: ' + xhr.statusText);
        }
    };
    
    const encodedFormData = new URLSearchParams(formData).toString();
    xhr.send(encodedFormData);
}

function exibeResult(result){
    atualizarGraficoLinha(result.emitted.signal, 'sinal-emitido', 'Sinal Emitido', 'Tempo (ms)', 'Amplitude', '#00c8ff');    
    atualizarGraficoBarras(result.emitted.amplitude, 'modulo-emitido', 'Módulo da Resposta em frequência Emitido', 'Frequência (kHz)', 'Amplitude', '#00c8ff');    
    atualizarGraficoBarras(result.emitted.phase, 'fase-emitido', 'Fase da Resposta em frequência Emitido', 'Frequência (kHz)', 'Fase (radianos)', '#00c8ff');   
    

    atualizarGraficoLinha(result.channel.responseModule, 'modulo-canal', 'Modulo da resposta em Frequência', 'Frequência (kHz)', 'Amplitude', '#ff0055');    
    atualizarGraficoLinha(result.channel.responsePhase, 'fase-canal', 'Fase da resposta em Frequência', 'Frequência (kHz)', 'Fase (radianos)', '#ff0055');    
    /*
    atualizarGraficoLinha(result.received.signal, 'sinal-recebido', 'Sinal Recebido', 'Tempo (ms)', 'Amplitude', '#2be331');    
    atualizarGraficoBarras(result.received.amplitude, 'modulo-recebido', 'Módulo da Resposta em frequência Recebido', 'Frequência (kHz)', 'Amplitude', '#2be331');    
    atualizarGraficoBarras(result.received.phase, 'fase-recebido', 'Fase da Resposta em frequência Recebido', 'Frequência (kHz)', 'Fase (radianos)', '#2be331');
    */
}

function atualizarGraficoLinha(dados, grafico, nome, xName, yName, cor) {
    var chart = Highcharts.chart(grafico, {
        chart: {
            type: 'line',
            backgroundColor: '#343a40',
            style: {
                fontFamily: 'Arial, sans-serif',
                color: '#f8f9fa'
            }
        },
        title: {
            text: nome,
            style: {
                color: '#f8f9fa'
            }
        },
        xAxis: {
            title: {
                text: xName,
                style: {
                    color: '#f8f9fa'
                }
            },
            labels: {
                style: {
                    color: '#f8f9fa'
                }
            }
        },
        yAxis: {
            title: {
                text: yName,
                style: {
                    color: '#f8f9fa'
                }
            },
            labels: {
                style: {
                    color: '#f8f9fa'
                }
            }
        },
        legend: {
            style: {
                color: '#f8f9fa'
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
    var chart = Highcharts.chart(grafico, {
        chart: {
            type: 'column',
            backgroundColor: '#343a40',
            style: {
                fontFamily: 'Arial, sans-serif',
                color: '#f8f9fa' 
            }
        },
        title: {
            text: nome,
            style: {
                color: '#f8f9fa'
            }
        },
        xAxis: {
            title: {
                text: xName,
                style: {
                    color: '#f8f9fa'
                }
            },
            labels: {
                style: {
                    color: '#f8f9fa'
                }
            }
        },
        yAxis: {
            title: {
                text: yName,
                style: {
                    color: '#f8f9fa'
                }
            },
            labels: {
                style: {
                    color: '#f8f9fa'
                }
            }
        },
        legend: {
            style: {
                color: '#f8f9fa'
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
