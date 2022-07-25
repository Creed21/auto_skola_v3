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
public class X extends GenericObject{
    private String x;
    private Integer id;
    private double y;
    private String novo_polje;
    private String xyz;

    public X(String x, int id, double y, String novo_polje, String xyz) {
        this.x = x;
        this.id = id;
        this.y = y;
        this.novo_polje = novo_polje;
        this.xyz = xyz;
    }

    @Override
    public GenericObject getRecord(ResultSet resultSet) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
