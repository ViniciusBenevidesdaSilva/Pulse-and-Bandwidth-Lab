
package br.edu.fesa.model;

import br.edu.fesa.model.channel.Channel;
import br.edu.fesa.model.signal.Signal;
import br.edu.fesa.utils.EnumSignalType;


public class Result {
    
    private String error = "";
    
    
    private Signal emitted = null;
    private Channel channel = null;
    private Signal received = null;
    
    public Result(){
        
    }
    
    public Result(String error){
        this.error = error;
    }
    
    public Result(double frequency, double minFrequency, double maxFrequency, EnumSignalType signalType, boolean isCanalReal) throws IllegalArgumentException{
        this.emitted = Signal.returnSignalByType(signalType, frequency);
        this.channel = Channel.returnChannelByFrequency(minFrequency, maxFrequency, isCanalReal);
        this.received = Signal.returnSignalByType(signalType, frequency);
    }

    public Signal getEmitted() {
        return emitted;
    }
    public Channel getChannel() {
        return channel;
    }
    public Signal getReceived() {
        return received;
    }
    
    
    public String getError() {
        return error;
    }
}
