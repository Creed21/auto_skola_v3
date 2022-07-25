/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Filip
 */
public class Polaznici extends GenericObject {
    private Integer id_grupa = -1;
    private Integer id_ucenik = -1;
    private String usc;
    private Date dtc;

    public Polaznici(Integer id_grupa, Integer id_ucenik, String usc, Date dtc) {
        this.id_grupa = id_grupa;
        this.id_ucenik = id_ucenik;
        this.usc = usc;
        this.dtc = dtc;
    }

    public Polaznici() {    }

    public Integer getId_grupa() { return id_grupa; }
    public void setId_grupa(Integer id_grupa) { this.id_grupa = id_grupa; }
    public Integer getId_ucenik() { return id_ucenik; }
    public void setId_ucenik(Integer id_ucenik) { this.id_ucenik = id_ucenik; }
    public String getUsc() { return usc; }
    public void setUsc(String usc) { this.usc = usc; }
    public Date getDtc() { return dtc; }
    public void setDtc(Date dtc) { this.dtc = dtc; }

    @Override
    public String toString() {
        return "Polaznik{" + "id_grupa=" + id_grupa + ", id_ucenik=" + id_ucenik + ", usc=" + usc + ", dtc=" + dtc + '}';
    }

//    @Override
//    public String getColumnNames() {
//        return "id_grupa, id_ucenik, usc, dtc";
//    }
//
//    @Override
//    public String getColumnValues() {
//        return id_grupa+", "+id_ucenik+", '"+usc+"', "+dtc;
//    }
//    
//    @Override
//    public String getColumnNamesInsert() {
//        return getColumnNames();
//    }
//    
//    @Override
//    public String getColumnValuesInsert() {
//        return getColumnValues();
//    }
//    
//    @Override
//    public String getColumnsForUpdate() {
//        throw new UnsupportedOperationException("Ovaj entitet "+getClassName()+" ne podrzava insert on conflict operaciju");
//    }
//
//    @Override
//    public String getClassName() {
//        return "polaznici";
//    }
//    
//    @Override
//    public String getPrimaryKey() {
//        return "id_grupa, id_ucenik";
//    }
//
//    @Override
//    public String makeWherePrimKey() {
//        return " and id_grupa = "+id_grupa+
//               " and id)ucenik = "+id_ucenik;
//    }
//
//    @Override
//    public String makeSpecificWhere() {
//        String where_cond = "";
//        if(id_grupa != -1 && id_ucenik != -1) 
//            return makeWherePrimKey();
//        if(usc != null)
//            where_cond += " and usc = '"+usc+"'";
//        if(dtc != null)
//            where_cond += " and dtc = "+dtc;
//        
//        return where_cond;
//    }

    @Override
    public GenericObject getRecord(ResultSet resultSet) {
        try {
            return new Polaznici(
                    resultSet.getInt("id_grupa"),
                    resultSet.getInt("id_ucenik"),
                    resultSet.getString("usc"),
                    resultSet.getDate("dtc")
            );
        } catch (SQLException ex) {
            Logger.getLogger(Polaznici.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    
    
}
