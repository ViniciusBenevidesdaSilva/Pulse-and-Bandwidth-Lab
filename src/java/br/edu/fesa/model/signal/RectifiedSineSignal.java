
package br.edu.fesa.model.signal;

import br.edu.fesa.utils.EnumSignalType;


public class RectifiedSineSignal extends Signal {
    
    public RectifiedSineSignal(double frequency) {
        super(frequency, EnumSignalType.SenoidalRetificada);
    }
    
    @Override
    protected double returnAmplitude(int harmonic){
        // a0
        if(harmonic == 0)
            return 2 / PI;
        
        // an
        return 4 / (PI - 4 * PI * harmonic * harmonic);
    }
    
    @Override
    protected double returnPhase(int harmonic){
        return 0;
    }
}
