
package br.edu.fesa.model.channel;


public class BandpassChannel extends Channel {
    
    public BandpassChannel(double minFrequency, double maxFrequency, boolean isRealChannel) {
        super(minFrequency, maxFrequency, isRealChannel);
    }
    
    @Override
    public double returnResponseModule(double frequency){
        if(isRealChannel)
            return frequency / (minFrequency * Math.sqrt(
                    (1 + Math.pow((frequency / minFrequency), 2)) *
                    (1 + Math.pow((frequency / maxFrequency), 2))
            ));
        
        return frequency >= minFrequency && frequency <= maxFrequency ? 1 : 0;
    }
    
    @Override
    public double returnResponsePhase(double frequency){
        if(isRealChannel)
            return - Math.PI / 2 - Math.atan((frequency * (minFrequency + maxFrequency))
                / ((minFrequency * maxFrequency) - frequency * frequency));
        
        return 0;
    }
}