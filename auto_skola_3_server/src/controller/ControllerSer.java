/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import transferObject.TransferObject;

/**
 *
 * @author Filip
 */
public class ControllerSer {
    private static ControllerSer instance;
    
    private ControllerSer() {  }
    
    public static ControllerSer getInstance() {
        if(instance == null)
            instance = new ControllerSer();
        return instance;
    }
    
    public TransferObject logIn(TransferObject user) {
        return null;
    }
}
