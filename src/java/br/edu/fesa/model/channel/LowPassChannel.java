
package br.edu.fesa.model.channel;


public class LowPassChannel extends Channel {
    
    public LowPassChannel(double maxFrequency, boolean isRealChannel) {
        super(0, maxFrequency, isRealChannel);
    }
    
    @Override
    public double returnResponseModule(double frequency){
        if(isRealChannel)
            return 1 / (Math.sqrt(1 + Math.pow((frequency / maxFrequency), 2)));
        
        return frequency <= maxFrequency ? 1 : 0;
    }
    
    @Override
    public double returnResponsePhase(double frequency){
        if(isRealChannel)
            return Math.atan(- frequency / maxFrequency);
        
        return 0;
    }
}
