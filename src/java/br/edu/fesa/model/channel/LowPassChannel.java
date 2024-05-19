
package br.edu.fesa.model.channel;


public class LowPassChannel extends Channel {
    
    public LowPassChannel(double maxFrequency) {
        super(0, maxFrequency);
    }
    
    @Override
    public double returnResponseModule(double frequency){
        return 1 / (Math.sqrt(1 + Math.pow((frequency / maxFrequency), 2)));
    }
    
    @Override
    public double returnResponsePhase(double frequency){
        return Math.atan(- frequency / maxFrequency);        
    }
}
