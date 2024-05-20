var requestResult;

function realizaChamadoServlet(){
    
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'PBLController');
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    console.log('Requisição');
    
    xhr.onload = function() {
        console.log(xhr.status);
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
    
    const frequencia = Math.floor(Math.random() * 5);
    const tipoSinal = 1 + Math.floor(Math.random() * 4);
    const frequenciaMax = 1 + Math.floor(Math.random() * 10);
    
    const data = `frequencia=${frequencia}&tipoSinal=${tipoSinal}&frequenciaMin=0&canalReal=on&frequenciaMax=${frequenciaMax}`;
    xhr.send(data);
}

function exibeResult(){
    if(!requestResult)
        return;
    
    atualizarGraficoLinha(requestResult.emitted.signal, 'exemplo-entrada', 'Sinal Emitido', 'Tempo (ms)', 'Amplitude', '#00A400');
    atualizarGraficoLinha(requestResult.received.signal, 'exemplo-saida', 'Sinal Recebido', 'Tempo (ms)', 'Amplitude', '#0D6EFD');    
}

function atualizarGraficoLinha(dados, grafico, nome, xName, yName, cor) {
    var colorMode = localStorage.getItem('theme');
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

realizaChamadoServlet();