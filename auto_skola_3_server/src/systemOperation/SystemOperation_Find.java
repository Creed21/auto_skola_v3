/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package systemOperation;

import java.util.ArrayList;
import java.util.List;
import model.GenericObject;
import transferObject.TransferObject;

/**
 *
 * @author Filip
 */
public class SystemOperation_Find extends SystemOperation {

//    public boolean pronadji(TransferObject transferObject) {
//        super.transferObject = transferObject;
//        return super.performGenericOperation();
//    }
    
    @Override
    public boolean perform(List<GenericObject> out_result) {
        GenericObject input_object = transferObject.getInputObject();
        
        boolean signal = dbBroker.find(input_object, out_result);
        if(!out_result.isEmpty()) {
//            transferObject.setMessage("Sistem je pronašao "+out_result.size()+" "+input_object.getClassName()+" po zadatim kriterijumima.");
            transferObject.setMessage("Sistem je pronasao "+out_result.size()+" rezultata");
        }
        else {
//            transferObject.setMessage("Sistem ne može da pronađe "+input_object.getClassName()+" po zadatim kriterijimuma");
            transferObject.setMessage("Nema rezultata pretrage");
        }
        transferObject.setResult(out_result);
        transferObject.setSignal(signal);
        System.out.println("signal: "+transferObject.getSignal());
        System.out.println("message: "+transferObject.getMessage());
        System.out.println("result");
        System.out.println(out_result);
        return signal;
    }
    
}
