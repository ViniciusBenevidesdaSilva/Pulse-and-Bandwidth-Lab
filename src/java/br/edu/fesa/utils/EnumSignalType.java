
package br.edu.fesa.utils;

import java.util.HashMap;


public enum EnumSignalType {
    Quadrada(1, "Quadrada"),
    Triangular(2, "Triangular"),
    DenteDeSerra(3, "Dente De Serra"),
    SenoidalRetificada(4, "Senoidal Retificada");
    
    
    private final int value;
    private final String description;
    
    EnumSignalType(int value, String description) {
        this.value = value;
        this.description = description;
    }
    
    public static EnumSignalType forInt(int value) {
        for (EnumSignalType signalType: values()) {
            if (signalType.getValue() == value) 
                return signalType;
        }
        throw new IllegalArgumentException("Invalid value: " + value);
    }   
    
    public int getValue() {
        return value;
    }
    
    public String getDescription() {
        return description;
    }
    
    public static HashMap<Integer, String> getSignalTypes(){
        HashMap<Integer, String> signalTypes = new HashMap<>();
        
        for (EnumSignalType signalType : values()) {
            signalTypes.put(signalType.getValue(), signalType.getDescription());
        }
        
        return signalTypes;
    }
    
    @Override
    public String toString(){
        return String.valueOf(value) + " " + description;
    }
}
