
package br.edu.fesa.model.signal;

import br.edu.fesa.utils.EnumSignalType;


public class TriangularSignal extends Signal {
    
    public TriangularSignal(double frequency) {
        super(frequency, EnumSignalType.Triangular);
    }
    
    @Override
    protected double returnAmplitude(int harmonic){
        // a0
        if(harmonic == 0)
            return 0;
        
        // an
        return harmonic % 2 == 0 ? 0 : 8 / (PI * PI * harmonic * harmonic);
    }
    
    @Override
    protected double returnPhase(int harmonic){
        return harmonic % 2 == 0 ? 0 : - Math.sin(PI * harmonic / 2) * PI / 2;
    }
}
