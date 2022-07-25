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
public class TeorijskiCas extends GenericObject {
    private Integer rbr_teor_cas;
    private Integer id_instruktor;
    private Instruktor instruktor;
    private Integer id_grupa;
    private Grupa grupa;
    private Date dt;
    private String tema;
    private String usc;
    private Date dtc;
    private String usm;
    private Date dtm;

    public TeorijskiCas() {
    }

    @Override
    public String toString() {
        return "TeorijskiCas{" + "rbr_teor_cas=" + rbr_teor_cas + ", instruktor=" + instruktor + ", grupa=" + grupa + ", dt=" + dt + ", tema=" + tema + ", usc=" + usc + ", dtc=" + dtc + ", usm=" + usm + ", dtm=" + dtm + '}';
    }

    public TeorijskiCas(Integer rbr_teor_cas, Integer id_instruktor, Integer id_grupa, Date dt, String tema, String usc, Date dtc, String usm, Date dtm) {
        this.rbr_teor_cas = rbr_teor_cas;
        this.id_instruktor = id_instruktor;
        this.id_grupa = id_grupa;
        this.dt = dt;
        this.tema = tema;
        this.usc = usc;
        this.dtc = dtc;
        this.usm = usm;
        this.dtm = dtm;
    }
//    public TeorijskiCas(Instruktor instruktor, Grupa grupa, Date dt, String tema, String usc, Date dtc, String usm, Date dtm) {
//        this.instruktor = instruktor;
//        this.grupa = grupa;
//        this.dt = dt;
//        this.tema = tema;
//        this.usc = usc;
//        this.dtc = dtc;
//        this.usm = usm;
//        this.dtm = dtm;
//    }
//    public TeorijskiCas(int rbr_teor_cas, Instruktor instruktor, Grupa grupa, Date dt, String tema, String usc, Date dtc, String usm, Date dtm) {
//        this.rbr_teor_cas = rbr_teor_cas;
//        this.instruktor = instruktor;
//        this.grupa = grupa;
//        this.dt = dt;
//        this.tema = tema;
//        this.usc = usc;
//        this.dtc = dtc;
//        this.usm = usm;
//        this.dtm = dtm;
//    }
    public Integer getId_instruktor() { return id_instruktor; }
    public void setId_instruktor(Integer id_instruktor) { this.id_instruktor = id_instruktor; }
    public Integer getId_grupa() { return id_grupa; }
    public void setId_grupa(Integer id_grupa) { this.id_grupa = id_grupa; } 
    public Integer getRbr_teor_cas() { return rbr_teor_cas; }
    public void setRbr_teor_cas(Integer rbr_teor_cas) { this.rbr_teor_cas = rbr_teor_cas; }
    public Instruktor getInstruktor() { return instruktor; }
    public void setInstruktor(Instruktor instruktor) { this.instruktor = instruktor; }
    public Grupa getGrupa() { return grupa; }
    public void setGrupa(Grupa grupa) { this.grupa = grupa; }
    public Date getDt() { return dt; }
    public void setDt(Date dt) { this.dt = dt; }
    public String getTema() { return tema; }
    public void setTema(String tema) { this.tema = tema; }
    public String getUsc() { return usc; }
    public void setUsc(String usc) { this.usc = usc; }
    public Date getDtc() { return dtc; }
    public void setDtc(Date dtc) { this.dtc = dtc; }
    public String getUsm() { return usm; }
    public void setUsm(String usm) { this.usm = usm; }
    public Date getDtm() { return dtm; }
    public void setDtm(Date dtm) { this.dtm = dtm; }

//    @Override
//    public String getColumnNames() {
//        return "rbr_teor_cas, id_instr, id_grupa, dt, tema, usc, dtc, usm, dtm";
//    }
//
//    @Override
//    public String getColumnValues() {
//        return rbr_teor_cas+", "+id_instruktor+", "+id_grupa+", "+dt+", '"+tema+"', '"+usc+"', "+dtc+", '"+usm+"', "+dtm;
//    }
//    
//    @Override
//    public String getColumnNamesInsert() {
//        return "rbr_teor_cas, id_instr, id_grupa, dt, tema, usc, dtc";
//    }
//    
//    @Override
//    public String getColumnValuesInsert() {
//        return "(select coalesce(max(t.rbr_teor_cas), 0)+ 1 from "+getClassName()+" t where id_instr = "+id_instruktor+
//                    " and id_grupa = "+id_grupa+ "), "+
//                id_instruktor+", "+id_grupa+", "+dt+", '"+tema+"', '"+usc+"', "+dtc;
//    }
//    
//    @Override
//    public String getColumnsForUpdate() {
//        String cols_upd = 
//                "tema = '"+tema+"',"+
//                "usm = '"+usm+"', "+
//                "dtm = current_timestamp";
//        return cols_upd;
//    }
//
//    @Override
//    public String getClassName() {
//        return "teorijskiCas";
//    }
//
//    @Override
//    public String getPrimaryKey() {
//        return "rbr_teor_cas, id_instr, id_grupa";
//    }
//
//    @Override
//    public String makeWherePrimKey() {
//        return " and rbr_teor_cas = "+rbr_teor_cas+
//               " and  id_instr = "+id_instruktor+
//               " and id_grupa = "+id_grupa;
//    }
//
//    @Override
//    public String makeSpecificWhere() {
//        String where_cond = "";
//        if(rbr_teor_cas != -1 && id_instruktor != -1 && id_grupa != -1) 
//            return makeWherePrimKey();
//        if(dt != null)
//            where_cond += " and dt = "+dt;
//        if(tema!= null) 
//            where_cond += " and lower(tema) like lower('%"+tema+"%')";
//        if(usc != null)
//            where_cond += " and usc = '"+usc+"'";
//        if(dtc != null)
//            where_cond += " and dtc = "+dtc;
//        if(usm != null)
//            where_cond += " and usm = '"+usm+"'";
//        if(dtm != null)
//            where_cond += " and dtm = "+dtm;
//        
//        return where_cond;
//    }

    @Override
    public GenericObject getRecord(ResultSet resultSet) {
        try {
            return new TeorijskiCas(
                    resultSet.getInt("rbr_teor_cas"),
                    resultSet.getInt("id_instr"), 
                    resultSet.getInt("id_grupa"), 
                    resultSet.getDate("dt"), 
                    resultSet.getString("tema"),
                    resultSet.getString("usc"),
                    resultSet.getDate("dtc"),
                    resultSet.getString("usm"),
                    resultSet.getDate("dtm")
            );
        } catch (SQLException ex) {
            Logger.getLogger(TeorijskiCas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
