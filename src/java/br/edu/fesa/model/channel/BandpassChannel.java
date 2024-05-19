
package br.edu.fesa.model.channel;


public class BandpassChannel extends Channel {
    
    public BandpassChannel(double minFrequency, double maxFrequency) {
        super(minFrequency, maxFrequency);
    }
    
    @Override
    protected double returnResponseModule(int frequency){
        return frequency / (minFrequency * Math.sqrt(
                (1 + Math.pow((frequency / minFrequency), 2)) *
                (1 + Math.pow((frequency / maxFrequency), 2))
        ));    
    }
    
    @Override
    protected double returnResponsePhase(int frequency){
        return - Math.PI / 2 - Math.atan((frequency * (minFrequency + maxFrequency))
                / ((minFrequency * maxFrequency) - frequency * frequency));
    }
}