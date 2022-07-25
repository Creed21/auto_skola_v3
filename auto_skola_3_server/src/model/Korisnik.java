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

@Deprecated
public class Korisnik extends GenericObject {
    protected Integer id = -1;
    protected String ime;
    protected String prezime;
    protected String email;
    protected String jmbg;
    protected String telefon;
    protected Date datrodj;
    protected String usc;
    protected Date dtc;
    protected String usm;
    protected Date dtm;

    public Korisnik() {
    }

    public Korisnik(String ime, String prezime, String email, String jmbg, String telefon, Date datrodj, String usc, Date dtc, String usm, Date date) {
        this.ime = ime;
        this.prezime = prezime;
        this.email = email;
        this.jmbg = jmbg;
        this.telefon = telefon;
        this.datrodj = datrodj;
        this.usc = usc;
        this.dtc = dtc;
        this.usm = usm;
        this.dtm = date;
    }

    public Korisnik(int id, String ime, String prezime, String email, String jmbg, String telefon, Date datrodj, String usc, Date dtc, String usm, Date date) {
        this.id = id;
        this.ime = ime;
        this.prezime = prezime;
        this.email = email;
        this.jmbg = jmbg;
        this.telefon = telefon;
        this.datrodj = datrodj;
        this.usc = usc;
        this.dtc = dtc;
        this.usm = usm;
        this.dtm = date;
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Korisnik) {
            Korisnik k = (Korisnik) obj;
            if(this.id == k.id)
                return true;
        }
        return false;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getIme() { return ime; }
    public void setIme(String ime) { this.ime = ime; }
    public String getPrezime() { return prezime; }
    public void setPrezime(String prezime) { this.prezime = prezime; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getJmbg() { return jmbg; }
    public void setJmbg(String jmbg) { this.jmbg = jmbg; }
    public String getTelefon() { return telefon; }
    public void setTelefon(String telefon) { this.telefon = telefon; }
    public Date getDatrodj() { return datrodj; }
    public void setDatrodj(Date datrodj) { this.datrodj = datrodj; }
    public String getUsc() { return usc; }
    public void setUsc(String usc) { this.usc = usc; }
    public Date getDtc() { return dtc; }
    public void setDtc(Date dtc) { this.dtc = dtc; }
    public String getUsm() { return usm; }
    public void setUsm(String usm) { this.usm = usm; }
    public Date getDate() { return dtm; }
    public void setDate(Date date) { this.dtm = date; }

    @Override
    public String toString() {
        return id+". "+ime+" "+prezime+" "+email+" "+telefon+", datRodj: "+datrodj;
    }

//    @Override
//    public String getColumnNames() {
//        return "id, ime, prezime, email, jmbg, telefon, datrodj, usc, dtc, usm, dtm";
//    }
//    
//    @Override
//    public String getColumnNamesInsert() {
//        return "id, ime, prezime, email, jmbg, telefon, datrodj, usc, dtc";
//    }
//    
//    @Override
//    public String getColumnValuesInsert() {
//        return "(select coalesce(max(k.id), 0)+1 from "+getClassName()+" k), "+
//                "'"+ime+"', '"+prezime+"',"+email+"', '"+jmbg+"', '"+telefon+"', "+
//                datrodj+", '"+usc+"', '"+dtc+"'";
//    }
//
//    @Override
//    public String getColumnValues() {
//        return id+", "+ime+", "+prezime+", "+email+", "+jmbg+", "+telefon+", "+datrodj
//                +", "+usc+", "+dtc+", "+usm+", "+dtm;
//    }
//
//    @Override
//    public String getClassName() {
//        return "korisnik";
//    }
//
//    @Override
//    public String makeWherePrimKey() {
//        return "and id = "+id;
//    }
//
//    @Override
//    public String getPrimaryKey() {
//        return "id";
//    }
//
//    @Override
//    public String makeSpecificWhere() {
//        String where_cond = "";
//        if(id != -1) 
//            return makeWherePrimKey();
//        if(ime != null) 
//            where_cond += " and lower(ime) like lower('%"+ime+"%')";
//        if(prezime != null )
//            where_cond += " and lower(prezime) like '%"+prezime+"%'";
//        if(email != null)
//            where_cond += " and lower(email) like '%"+email+"%'";
//        if(jmbg != null)
//            where_cond += " and lower(jmbg) like '%"+jmbg+"%'";
//        if(datrodj != null)
//            where_cond += " and datrodj = '"+datrodj+"'";
//        if(usc != null)
//            where_cond += " and usc = '"+usc+"'";
//        if(dtc != null)
//            where_cond += " and dtc = '"+dtc+"'";
//        if(usm != null)
//            where_cond += " and usm = '"+usm+"'";
//        if(dtm != null)
//            where_cond += " and dtm = '"+dtm+"'";
//        
//        return where_cond;
//    }
//    @Override
//    public String getColumnsForUpdate() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

    @Override
    public GenericObject getRecord(ResultSet resultSet) {
        try {
            return new Korisnik(
                    resultSet.getInt("id"), 
                    resultSet.getString("ime"), resultSet.getString("prezime"),
                    resultSet.getString("email"), resultSet.getString("jmbg"),
                    resultSet.getString("telefon"), resultSet.getDate("datrodj"),
                    resultSet.getString("usc"), resultSet.getDate("dtc"), 
                    resultSet.getString("usm"), resultSet.getDate("dtm")
            );
        } catch (SQLException ex) {
            Logger.getLogger(Korisnik.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    
}
