/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.reflection;

import model.GenericObject;
import model.Instruktor;
import model.Kategorija;
import model.Somi;
import systemOperation.SystemOperation;
import systemOperation.SystemOperation_Find;
import transferObject.TransferObject;

/**
 *
 * @author Filip
 */
public class TestReflection_get_object_from_result_set {
    public static void main(String[] args) {
        System.out.println("=========find instuktor==========");
        
        SystemOperation so_find = new SystemOperation_Find();
        GenericObject test_input = new Instruktor("aca_janko", "1");
        TransferObject transferObject = new TransferObject("find", false, test_input, null, null);
        so_find.setTransferObject(transferObject);
        so_find.performGenericOperation();
        
        System.out.println("=========find instuktor==========");
        
        System.out.println("=========find kategorija==========");
        SystemOperation so_find_kategorija = new SystemOperation_Find();
        Kategorija test_input_find_kategorija = new Kategorija();
        test_input_find_kategorija.setId(1);
        TransferObject transferObject_find_kategorija = new TransferObject("find", false, test_input_find_kategorija, null, null);
        so_find_kategorija.setTransferObject(transferObject_find_kategorija);
        so_find_kategorija.performGenericOperation();
        System.out.println("=========find kategorija==========");
        
        System.out.println("=========find kategorija==========");
        Somi nova_klasa = new Somi("Misa", "Jovanovic", 4567.99);
        transferObject_find_kategorija = new TransferObject("find", false, nova_klasa, null, null);
        so_find_kategorija.setTransferObject(transferObject_find_kategorija);
        so_find_kategorija.performGenericOperation();
        System.out.println("=========find kategorija==========");
        
        
    }
    
}
