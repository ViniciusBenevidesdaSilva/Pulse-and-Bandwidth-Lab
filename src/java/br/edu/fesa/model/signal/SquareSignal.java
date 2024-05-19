
package br.edu.fesa.model.signal;

import br.edu.fesa.utils.EnumSignalType;


public class SquareSignal extends Signal {
    
    public SquareSignal(double frequency) {
        super(frequency, EnumSignalType.Quadrada);
    }
    
    @Override
    protected double returnAmplitude(int harmonic){
        // a0
        if(harmonic == 0)
            return 0;
        
        // an
        return harmonic % 2 == 0 ? 0 : 4 / (harmonic * PI);
    }
    
    @Override
    protected double returnPhase(int harmonic){
        return harmonic % 2 == 0 ? 0 : - PI / 2;
    }
        
    @Override
    protected double returnPhase(int harmonic, double chanelPhase){
        return harmonic % 2 == 0 ? 0 : super.returnPhase(harmonic, chanelPhase);
    }
}
