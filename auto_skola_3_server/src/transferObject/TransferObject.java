/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package transferObject;

import java.io.Serializable;
import java.util.List;
import model.GenericObject;

/**
 *
 * @author Filip
 */
public class TransferObject implements Serializable {
    private String action;
    private boolean signal;
    private GenericObject inputObject;
    private List<GenericObject> result;
    private String message;

    public TransferObject() {}
    public TransferObject(String action, boolean signal, GenericObject input_object, List<GenericObject> result, String message) {
        this.action = action;
        this.signal = signal;
        this.inputObject = input_object;
        this.result = result;
        this.message = message;
    }
    public String getAction() {return action;}
    public void setAction(String action) {this.action = action;}
    public boolean getSignal() {return signal;}
    public void setSignal(boolean signal) {this.signal = signal;}
    public GenericObject getInputObject() {return inputObject;}
    public void setInput_object(GenericObject input_object) {this.inputObject = input_object;}
    public List<GenericObject> getResult() {return result;}
    public void setResult(List<GenericObject> result) {this.result = result;}
    public String getMessage() {return message;}
    public void setMessage(String message) {this.message = message;}
    @Override
    public String toString() {
        return "TransferObject{" + "action=" + action + ", signal=" + signal + ", input_object=" + inputObject + ", result=" + result + ", message=" + message + '}';
    }
    
}
