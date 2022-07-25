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
//@Target(ElementType.FIELD)
//@Retention(RetentionPolicy.RUNTIME)
//@interface MyAnnotation {
//    String primaryKey();
//}

public class Instruktor extends GenericObject {
    @PrimaryKeyAnnotation(PrimaryKey = "Y")
    private Integer id;
    private String ime;
    private String prezime;
    private String email;
    private String jmbg;
    private String telefon;
    private Date datrodj;
    private String usc;
    private Date dtc;
    private String usm;
    private Date dtm;
    private String username;
    private String pass;
    private Double plata;
    private Date datzap;

    public Instruktor() {}
    public Instruktor(String username, String pass) {
        this.username = username;
        this.pass = pass;
    }
    @ConstuctorAnnotation(forGetRecord="Y")
    public Instruktor(Integer id, String username, String pass, Double plata, Date datzap) {
        this.id = id;
        this.username = username;
        this.pass = pass;
        this.plata = plata;
        this.datzap = datzap;
    }    
    public Instruktor(String username, String pass, Double plata, Date datzap) {
        this.username = username;
        this.pass = pass;
        this.plata = plata;
        this.datzap = datzap;
    }
    public Instruktor(Integer id, String ime, String prezime, String email, String jmbg, String telefon, Date datrodj,
            String username, String pass, Double plata, Date datzap, String usc, Date dtc, String usm, Date dtm) {
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
        this.dtm = dtm;
        this.username = username;
        this.pass = pass;
        this.plata = plata;
        this.datzap = datzap;
    }
    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Instruktor) {
            Instruktor i = (Instruktor) obj;
            if((int)this.id == (int)i.id)
                return true;
        }
        return false;
    }
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
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
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPass() { return pass; }
    public void setPass(String pass) { this.pass = pass; }
    public Double getPlata() { return plata; }
    public void setPlata(Double plata) { this.plata = plata; }
    public Date getDatzap() { return datzap; }
    public Date getDatrodj() { return datrodj; }
    public void setDatrodj(Date datrodj) { this.datrodj = datrodj; }
    public void setDatzap(Date datzap) { this.datzap = datzap; }
    public String getUsc() { return usc; }
    public void setUsc(String usc) { this.usc = usc; }
    public Date getDtc() { return dtc; }
    public void setDtc(Date dtc) { this.dtc = dtc; }
    public String getUsm() { return usm; }
    public void setUsm(String usm) { this.usm = usm; }
    public Date getDtm() { return dtm; }
    public void setDtm(Date date) { this.dtm = date; }
    @Override
    public String toString() {
        return id+". Instruktor: "
                +"username: "+username+", pass: "+pass
                +", plata: " + plata + "; datum zaposenja: "+(datzap != null ? datzap.toString() : "");
    }

    @Override
    public GenericObject getRecord(ResultSet resultSet) {
        try {
            return new Instruktor(
                    resultSet.getInt("id"), 
                    resultSet.getString("ime"), resultSet.getString("prezime"),
                    resultSet.getString("email"), resultSet.getString("jmbg"),
                    resultSet.getString("telefon"), resultSet.getDate("datrodj"),
                    resultSet.getString("username"), resultSet.getString("pass"),
                    resultSet.getDouble("plata"), resultSet.getDate("datzap"),
                    resultSet.getString("usc"), resultSet.getDate("dtc"), 
                    resultSet.getString("usm"), resultSet.getDate("dtm")
            );
        } catch (SQLException ex) {
            Logger.getLogger(Instruktor.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
