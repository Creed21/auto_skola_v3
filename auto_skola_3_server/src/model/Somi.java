/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.ResultSet;

/**
 *
 * @author Filip
 */
public class Somi extends GenericObject {
    String ime;
    String prezime;
    Double plata;
    @ConstuctorAnnotation(forGetRecord = "Y")
    public Somi(String ime, String prezime, Double plata) {
        this.ime = ime;
        this.prezime = prezime;
        this.plata = plata;
    }
    
    
    @Override
    public GenericObject getRecord(ResultSet resultSet) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
