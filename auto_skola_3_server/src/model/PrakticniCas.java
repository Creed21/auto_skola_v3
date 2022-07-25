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
public class PrakticniCas extends GenericObject {
    private Integer rbr;
    private Integer id_instruktor;
    private Instruktor instruktor;
    private Integer id_ucenik;
    private Ucenik ucenik;
    private String naziv;
    private Date odrzan;
    private String usc;
    private Date dtc;

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof PrakticniCas) {
            PrakticniCas pc = (PrakticniCas) obj;
            if(rbr == pc.rbr && instruktor.equals(pc.instruktor) && ucenik.equals(pc.ucenik))
                return true;
        }
        return false;
    }

    @Override
    public String toString() {
        return "PrakticniCas{" + "rbr=" + rbr + ", id_instruktor=" + id_instruktor + ", id_ucenik=" + id_ucenik 
                    + ", naziv=" + naziv + ", odrzan=" + odrzan + ", usc=" + usc + ", dtc=" + dtc;
    }

    public PrakticniCas() {
    }
//    @Deprecated
//    public PrakticniCas(Instruktor instruktor, Ucenik ucenik, String naziv, Date odrzan, String usc, Date dtc) {
//        this.instruktor = instruktor;
//        this.ucenik = ucenik;
//        this.naziv = naziv;
//        this.odrzan = odrzan;
//        this.usc = usc;
//        this.dtc = dtc;
//    }
//    @Deprecated
//    public PrakticniCas(int rbr, Instruktor instruktor, Ucenik ucenik, String naziv, Date odrzan, String usc, Date dtc) {
//        this.rbr = rbr;
//        this.instruktor = instruktor;
//        this.ucenik = ucenik;
//        this.naziv = naziv;
//        this.odrzan = odrzan;
//        this.usc = usc;
//        this.dtc = dtc;
//    }
    public PrakticniCas(Integer rbr, Integer id_instruktor, Integer id_ucenik, String naziv, Date odrzan, String usc, Date dtc) {
        this.rbr = rbr;
        this.id_instruktor = id_instruktor;
        this.id_ucenik = id_ucenik;
        this.naziv = naziv;
        this.odrzan = odrzan;
        this.usc = usc;
        this.dtc = dtc;
    }
    public Integer getId_profesor() { return id_instruktor; }
    public void setId_profesor(Integer id_profesor) { this.id_instruktor = id_profesor; }
    public Integer getId_ucenik() { return id_ucenik; }
    public void setId_ucenik(Integer id_ucenik) { this.id_ucenik = id_ucenik; }
    public Integer getRbr() { return rbr; }
    public void setRbr(Integer rbr) { this.rbr = rbr; }
    public Instruktor getInstruktor() { return instruktor; }
    public void setInstruktor(Instruktor instruktor) { this.instruktor = instruktor; }
    public Ucenik getUcenik() { return ucenik; }
    public void setUcenik(Ucenik ucenik) { this.ucenik = ucenik; }
    public String getNaziv() { return naziv; }
    public void setNaziv(String naziv) { this.naziv = naziv; }
    public Date getOdrzan() { return odrzan; }
    public void setOdrzan(Date odrzan) { this.odrzan = odrzan; }
    public String getUsc() { return usc; }
    public void setUsc(String usc) { this.usc = usc; }
    public Date getDtc() { return dtc; }
    public void setDtc(Date dtc) { this.dtc = dtc; }

//    @Override
//    public String getColumnNames() {
//        return "rbr, id_instruktor, id_ucenik, naziv, odrzan, usc, dtc";
//    }
//
//    @Override
//    public String getColumnValues() {
//        return rbr+", "+id_instruktor+", "+id_ucenik+", '"+naziv+"', "+odrzan+", '"+usc+"', "+dtc;
//    }
//    
//    @Override
//    public String getColumnNamesInsert() {
//        return getColumnNames();
//    }
//    
//    @Override
//    public String getColumnValuesInsert() {
//        return "(select coalesce(max(p.rbr), 0)+ 1 from "+getClassName()+" p where p.id_instr = "+id_instruktor+" and p.id_ucenik = "+id_ucenik+"), "+
//                id_instruktor+", "+id_ucenik+", '"+naziv+"', "+odrzan+", '"+usc+"', "+dtc;
//    }
//    
//    @Override
//    public String getColumnsForUpdate() {
//        String cols_upd = 
//                "naziv = '"+naziv+"',"+
//                "odrzan = '"+odrzan+"', ";
//        return cols_upd;
//    }
//
//    @Override
//    public String getClassName() {
//        return "prakticniCas";
//    }
//
//    @Override
//    public String getPrimaryKey() {
//        return "rbr, id_instruktor, id_ucenik";
//    }
//
//    @Override
//    public String makeWherePrimKey() {
//        return " and rbr = "+rbr+" and id_instruktor = "+id_instruktor+" and id_ucenik = "+id_ucenik;
//    }
//
//    @Override
//    public String makeSpecificWhere() {
//        String where_cond = "";
//        if(rbr != null && id_instruktor != null && id_ucenik != null) 
//            return makeWherePrimKey();
//        if(naziv!= null) 
//            where_cond += " and lower(naziv) like lower('%"+naziv+"%')";
//        if(odrzan != null )
//            where_cond += " and odrzan = "+odrzan;
//        if(usc != null)
//            where_cond += " and usc = '"+usc+"'";
//        if(dtc != null)
//            where_cond += " and dtc = '"+dtc+"'";
//        
//        return where_cond;
//    }

    @Override
    public GenericObject getRecord(ResultSet resultSet) {
        try {
            return new PrakticniCas(
                    resultSet.getInt("rbr"),
                    resultSet.getInt("id_instr"),
                    resultSet.getInt("id_ucenik"),
                    resultSet.getString("naziv"),
                    resultSet.getDate("odrzan"),
                    resultSet.getString("usc"),
                    resultSet.getDate("dtc")
            );
        } catch (SQLException ex) {
            Logger.getLogger(PrakticniCas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
