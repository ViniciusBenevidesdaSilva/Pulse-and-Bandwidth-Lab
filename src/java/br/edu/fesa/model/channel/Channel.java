
package br.edu.fesa.model.channel;

import br.edu.fesa.model.Point;
import br.edu.fesa.utils.Const;
import java.util.ArrayList;
import java.util.List;


public abstract class Channel {
    
    // Props
    protected final double minFrequency;
    protected final double maxFrequency;

    private List<Point> responseModule = new ArrayList<>();
    private List<Point> responsePhase = new ArrayList<>();

    // Constructor
    public Channel(double minFrequency, double maxFrequency) {
        this.minFrequency = minFrequency;
        this.maxFrequency = maxFrequency;
    }

    // Gets
    public double getMinFrequency() {
        return minFrequency;
    }
    public double getMaxFrequency() {
        return maxFrequency;
    }
    
    public List<Point> getResponseModule() {
        return responseModule;
    }
    public List<Point> getResponsePhase() {
        return responsePhase;
    }
    
    // Método que, após a realização dos cálculos, exibe apenas os 10 primeiros valores de amplitude e fase por frequência
    public void normalizeFrequencyLists(){
        int elementQuantity = Math.min(50, Const.HARMONIC);
        
        responseModule = responseModule.subList(0, elementQuantity);
        responsePhase = responsePhase.subList(0, elementQuantity);
    }
    
    // Método generico que realiza a inserção de um ponto em uma lista
    protected void insertPointAt(List<Point> list, double x, double y){
        Point newPoint = new Point(x, y);
        list.add(newPoint);
    }
    
    // Public Methods
    public void fillResponseModule(double frequencyStep){
        responseModule.clear();
        double responseModuleValue;
        for(int frequency = 0; frequency <= Const.HARMONIC * frequencyStep; frequency++){
            responseModuleValue = returnResponseModule(frequency);
            insertPointAt(responseModule, frequency, responseModuleValue);
        }
    }
    
    public double returnResponseModule(double frequency){
        return 0;
    }
    
        
    public void fillResponsePhase(double frequencyStep){
        responsePhase.clear();
        double responsePhaseValue;
        for(int frequency = 0; frequency <= Const.HARMONIC * frequencyStep; frequency++){
            responsePhaseValue = returnResponsePhase(frequency);
            insertPointAt(responsePhase, frequency, responsePhaseValue);
        }
    }
    
    public double returnResponsePhase(double frequency){
        return 0;
    }
    
    public static Channel returnChannelByFrequency(double minFrequency, double maxFrequency) throws IllegalArgumentException{
        if(maxFrequency <= 0){
            throw new IllegalArgumentException("A Frequência máxima deve ser maior que zero.");
        }
        
        if(minFrequency < 0){
            throw new IllegalArgumentException("A Frequência mínima deve ser maior ou igual a zero.");
        }
        
        if(minFrequency > maxFrequency){
            throw new IllegalArgumentException("A frequência mínima deve ser menor que a máxima");
        }
        
        
        if(minFrequency == 0)
            return new LowPassChannel(maxFrequency);
        
        return new BandpassChannel(minFrequency, maxFrequency);
    }
}
