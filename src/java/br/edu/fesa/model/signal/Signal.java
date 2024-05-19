
package br.edu.fesa.model.signal;

import br.edu.fesa.model.Point;
import br.edu.fesa.utils.Const;
import br.edu.fesa.utils.EnumSignalType;
import java.util.ArrayList;
import java.util.List;


public abstract class Signal {

    // Props
    protected final double PI = Math.PI;
    private final double frequency;
    private final EnumSignalType signalType;
    
    private List<Point> amplitude = new ArrayList<>();
    private List<Point> phase = new ArrayList<>();
    private final List<Point> signal = new ArrayList<>();

    // Constructor
    public Signal(double frequency, EnumSignalType signalType){
        this.frequency = frequency;
        this.signalType = signalType;
    }
    
    // Gets
    public double getFrequency() {
        return frequency;
    }
    public EnumSignalType getSignalType() {
        return signalType;
    }
    public List<Point> getAmplitude() {
        return amplitude;
    }
    public List<Point> getPhase() {
        return phase;
    }
    public List<Point> getSignal() {
        return signal;
    }
    
    // Método que, após a realização dos cálculos, exibe apenas os 10 primeiros valores de amplitude e fase por frequência
    public void normalizeFrequencyLists(){
        int elementQuantity = Math.min(20, Const.HARMONIC);

        amplitude = amplitude.subList(0, elementQuantity);
        phase = phase.subList(0, elementQuantity);
    }
    
    // Método generico que realiza a inserção de um ponto em uma lista
    protected void insertPointAt(List<Point> list, double x, double y){
        Point newPoint = new Point(x, y);
        list.add(newPoint);
    }
    
    // Public Methods
    
    // Amplitude
    // Método público que preenche os valores de amplitude x frequencia
    public void fillAmplitudeList(){
        amplitude.clear();
        double amplitudeValue;
        
        for(int harmonic = 0; harmonic <= Const.HARMONIC; harmonic++){
            amplitudeValue = returnAmplitude(harmonic);
            insertPointAt(amplitude, harmonic * frequency, amplitudeValue);
        }
    }
    
    // Método que será sobreescrito, que efetivamente realiza o calculo da amplitude
    protected double returnAmplitude(int harmonic){
        return 0;
    }
    
    
    // Phase
    // Método público que preenche os valores de fase x frequencia
    public void fillPhaseList(){
        phase.clear();
        double phaseValue;
        
        for(int harmonic = 0; harmonic <= Const.HARMONIC; harmonic++){
            phaseValue = returnPhase(harmonic);
            insertPointAt(phase, harmonic * frequency, phaseValue);
        }
    }
    
    // Método que será sobreescrito, que efetivamente realiza o calculo da fase
    protected double returnPhase(int harmonic){
        return 0;
    }
    
    // Signal
    public void fillSignalList(){
        signal.clear();
        
        double signalValue;
        
        double period = 1 / frequency;
        double signalDuration = 3 * period;
        double samplingRate = period / (2 * Const.HARMONIC);  // teorema da amostragem de Nyquist-Shannon
        
        for(double time = 0; time <= signalDuration; time += samplingRate){
            signalValue = 0;
            
            for(int harmonic = 0; harmonic <= Const.HARMONIC; harmonic++){
                signalValue += returnSignal(harmonic, time);
            }
            
            insertPointAt(signal, time, signalValue);
        }
    }
    
    // Método que calcula o sinal da harmonica atual. Não precisa ser sobreescrito
    protected double returnSignal(int harmonic, double time){
        double amplitudeValue = amplitude.get(harmonic).getY();
        double phaseValue = phase.get(harmonic).getY();
        
        double signalValue = amplitudeValue * Math.cos(2 * PI * harmonic * time * frequency + phaseValue);
        return signalValue;
    }
    
    
    // Construtor a depender to tipo de Sinal
    public static Signal returnSignalByType(EnumSignalType signalType, double frequency) throws IllegalArgumentException{
        switch(signalType){
            case Quadrada -> {
                return new SquareSignal(frequency);
            }
            case Triangular -> {
                return new TriangularSignal(frequency);
            }
            case DenteDeSerra -> {
                return new SawtoothSignal(frequency);
            }
            case SenoidalRetificada -> {
                return new RectifiedSineSignal(frequency);
            }
            default -> throw new IllegalArgumentException("Tipo de sinal inválido: " + signalType);
        }
    }
}
