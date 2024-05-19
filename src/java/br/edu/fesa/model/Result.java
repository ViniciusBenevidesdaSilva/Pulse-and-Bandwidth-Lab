
package br.edu.fesa.model;

import br.edu.fesa.model.signal.Signal;
import br.edu.fesa.utils.EnumSignalType;


public class Result {
    
    private String error = "";
    
    
    private Signal emitted = null;
    
    public Result(){
        
    }
    
    public Result(String error){
        this.error = error;
    }
    
    public Result(double frequency, double minFrequency, double maxFrequency, EnumSignalType signalType){
        this.emitted = Signal.returnSignalByType(signalType, frequency);
    }

    public Signal getEmitted() {
        return emitted;
    }
    
    public String getError() {
        return error;
    }
}
