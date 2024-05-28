
window.addEventListener("load", generateRelatorio);

function generateRelatorio() {
    var requestResult = JSON.parse(localStorage.getItem('requestResult'));
    
    if(!requestResult){
        history.back();
        return;
    }
    
    formateTable(requestResult);
    exibeResult(requestResult);
    
    function afterPrint() {
        window.removeEventListener('afterprint', afterPrint);
        history.back();
    }

    window.addEventListener('afterprint', afterPrint);
    
    print();
}

function formateTable(requestResult){
    var today = formatDate(new Date());
    
    updateTextByClass('signalType', requestResult.emitted.signalType);
    updateTextByClass('frequency', requestResult.emitted.frequency);
    updateTextByClass('todayDate', today);
    updateTextByClass('minFrequency', requestResult.channel.minFrequency);
    updateTextByClass('maxFrequency', requestResult.channel.maxFrequency);
    updateTextByClass('channelType', requestResult.channel.isRealChannel ? 'Canal Real' : 'Canal Teórico');
}

function updateTextByClass(className, newText) {
    const elements = document.querySelectorAll(`.${className}`);
    
    elements.forEach(element => {
        element.textContent = newText;
    });
}

function formatDate(date) {
    var day = String(date.getDate()).padStart(2, '0');
    var month = String(date.getMonth() + 1).padStart(2, '0');
    var year = date.getFullYear();
    return day + '/' + month + '/' + year;
}

function exibeResult(requestResult){
    if(!requestResult)
        return;
    
    let phaseUnit = requestResult.phaseUnit;
    indiceFase = 180 / Math.PI;
    
    // Sinais
    atualizarGraficoLinha(requestResult.emitted.signal, 'sinal-emitido', 'Sinal Emitido', 'Tempo (ms)', 'Amplitude', '#00A400');    
    atualizarGraficoLinha(requestResult.received.signal, 'sinal-recebido', 'Sinal Recebido', 'Tempo (ms)', 'Amplitude', '#0D6EFD');    
    
    // Modulos
    atualizarGraficoBarras(requestResult.emitted.amplitude, 'modulo-emitido', 'Módulo Emitido', 'Frequência (kHz)', 'Amplitude', '#00A400');    
    atualizarGraficoLinha(requestResult.channel.responseModule, 'modulo-canal', 'Modulo Canal', 'Frequência (kHz)', 'Amplitude', '#FF0B0B');    
    atualizarGraficoBarras(requestResult.received.amplitude, 'modulo-recebido', 'Módulo Recebido', 'Frequência (kHz)', 'Amplitude', '#0D6EFD');    
    
    // Fases
    if(phaseUnit === 'radianos'){
        atualizarGraficoBarras(requestResult.emitted.phase, 'fase-emitido', 'Fase Emitido', 'Frequência (kHz)', 'Fase (radianos)', '#00A400');   
        atualizarGraficoLinha(requestResult.channel.responsePhase, 'fase-canal', 'Fase Canal', 'Frequência (kHz)', 'Fase (radianos)', '#FF0B0B');    
        atualizarGraficoBarras(requestResult.received.phase, 'fase-recebido', 'Fase Recebido', 'Frequência (kHz)', 'Fase (radianos)', '#0D6EFD');
    } else {
        atualizarGraficoBarras(requestResult.emitted.phase.map(obj => ({ x: obj.x, y: obj.y * indiceFase })), 'fase-emitido', 'Fase Emitido', 'Frequência (kHz)', 'Fase (graus)', '#00A400');   
        atualizarGraficoLinha(requestResult.channel.responsePhase.map(obj => ({ x: obj.x, y: obj.y * indiceFase })), 'fase-canal', 'Fase Canal', 'Frequência (kHz)', 'Fase (graus)', '#FF0B0B');    
        atualizarGraficoBarras(requestResult.received.phase.map(obj => ({ x: obj.x, y: obj.y * indiceFase })), 'fase-recebido', 'Fase Recebido', 'Frequência (kHz)', 'Fase (graus)', '#0D6EFD');
    }
}

function atualizarGraficoLinha(dados, grafico, nome, xName, yName, cor) {
    
    const fontColor = '#454545';
    
    var chart = Highcharts.chart(grafico, {
        chart: {
            type: 'line',
            backgroundColor: 'transparent',
            animation: false,
            style: {
                fontFamily: 'Arial, sans-serif',
                color: fontColor
            }
        },
        title: {
            text: '',
            style: {
                color: fontColor,
                fontSize: '1px'
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
            },
            animation: false
        }],
        plotOptions: {
            series: {
                animation: false
            }
        }
    });
}

function atualizarGraficoBarras(dados, grafico, nome, xName, yName, cor) {
    
    const fontColor = '#454545';
    
    var chart = Highcharts.chart(grafico, {
        chart: {
            type: 'column',
            backgroundColor: 'transparent',
            animation: false,
            style: {
                fontFamily: 'Arial, sans-serif',
                color: fontColor
            }
        },
        title: {
            text: '',
            style: {
                color: fontColor,
                fontSize: '1px'
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
            animation: false
        }],
        plotOptions: {
            series: {
                animation: false
            }
        }
    });
}