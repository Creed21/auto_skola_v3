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
public class OdslusaniCas extends GenericObject {
    private Integer rbr_teor_cas;
    private Integer id_ucenik;
    private String usc;
    private Date dtc;

    public OdslusaniCas(Integer rbr_teor_cas, Integer id_ucenik, String usc, Date dtc) {
        this.rbr_teor_cas = rbr_teor_cas;
        this.id_ucenik = id_ucenik;
        this.usc = usc;
        this.dtc = dtc;
    }

    public OdslusaniCas() { }
    public Integer getRbr_teor_cas() { return rbr_teor_cas; }
    public void setRbr_teor_cas(Integer rbr_teor_cas) { this.rbr_teor_cas = rbr_teor_cas; }
    public Integer getId_ucenik() { return id_ucenik; }
    public void setId_ucenik(Integer id_ucenik) { this.id_ucenik = id_ucenik; }
    public String getUsc() { return usc; }
    public void setUsc(String usc) { this.usc = usc; }
    public Date getDtc() { return dtc; }
    public void setDtc(Date dtc) { this.dtc = dtc; }

    @Override
    public String toString() {
        return "OdslusaniCas{" + "rbr_teor_cas=" + rbr_teor_cas + ", id_ucenik=" + id_ucenik + ", usc=" + usc + ", dtc=" + dtc + '}';
    }

//    @Override
//    public String getColumnNames() {
//        return "rbr_teor_cas, id_instruktor, id_ucenik, usc, dtc";
//    }
//
//    @Override
//    public String getColumnValues() {
//        return rbr_teor_cas+", "+id_ucenik+", '"+usc+"', "+dtc;
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
//        return "odslusaniCas";
//    }
//
//    @Override
//    public String getPrimaryKey() {
//        return "rbr_teor_cas, id_ucenik";
//    }
//
//    @Override
//    public String makeWherePrimKey() {
//        return " and rbr_teor_cas = "+rbr_teor_cas+
//               " and id_ucenik = "+id_ucenik;
//    }
//
//    @Override
//    public String makeSpecificWhere() {
//        String where_cond = "";
//        if(rbr_teor_cas != null && id_ucenik != null) 
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
            return new OdslusaniCas(
                    resultSet.getInt("rbr_teor_cas"),
                    resultSet.getInt("id_ucenik"),
                    resultSet.getString("usc"),
                    resultSet.getDate("dtc")
            );
        } catch (SQLException ex) {
            Logger.getLogger(OdslusaniCas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    
}
