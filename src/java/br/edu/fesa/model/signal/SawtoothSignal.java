
package br.edu.fesa.model.signal;

import br.edu.fesa.utils.EnumSignalType;


public class SawtoothSignal extends Signal {
    
    public SawtoothSignal(double frequency) {
        super(frequency, EnumSignalType.DenteDeSerra);
    }
    
    @Override
    protected double returnAmplitude(int harmonic){
        // a0
        if(harmonic == 0)
            return 0;
        
        // an
        return 2 / (harmonic * PI);
    }
    
    @Override
    protected double returnPhase(int harmonic){
        return (harmonic % 2 == 0 ? 1 : -1) * PI / 2;
    }
}