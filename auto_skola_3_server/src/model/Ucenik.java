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
public class Ucenik extends GenericObject {
    private Integer id;
    private String ime;
    private String prezime;
    private String email;
    private String jmbg;
    private String telefon;
    private Date datrodj;
    private Integer zavrsio_teor;
    private Integer zavrsio_prvu_pomoc;
    private Integer zavrsio_prakticni;
    private Integer polozio_prakticni;
    private Integer polozio_teor;
    private Date dt_polozio;
    private String usc;
    private Date dtc;
    private String usm;
    private Date dtm;

    public Ucenik() {}
    public Ucenik(Integer id, Integer zavrsio_teor, Integer zavrsio_prvu_pomoc, Integer zavrsio_prakticni, Integer polozio_prakticni, Integer polozio_teor, Date dt_polozio) {
        this.id = id;
        this.zavrsio_teor = zavrsio_teor;
        this.zavrsio_prvu_pomoc = zavrsio_prvu_pomoc;
        this.zavrsio_prakticni = zavrsio_prakticni;
        this.polozio_prakticni = polozio_prakticni;
        this.polozio_teor = polozio_teor;
        this.dt_polozio = dt_polozio;
    }
    public Ucenik(String ime, String prezime, String email, String jmbg, String telefon, Date datrodj, String usc, Date dtc, String usm, Date dtm, Date dt_polozio) {
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
        this.dt_polozio = dt_polozio;
    }
    public Ucenik(Integer id, String ime, String prezime, String email, String jmbg, String telefon, Date datrodj, 
            Integer zavrsio_teor, Integer zavrsio_prvu_pomoc, Integer zavrsio_prakticni, Integer polozio_prakticni,
            Integer polozio_teor, Date dt_polozio, String usc, Date dtc, String usm, Date dtm) {
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
        this.zavrsio_teor = zavrsio_teor;
        this.zavrsio_prvu_pomoc = zavrsio_prvu_pomoc;
        this.zavrsio_prakticni = zavrsio_prakticni;
        this.polozio_prakticni = polozio_prakticni;
        this.polozio_teor = polozio_teor;
        this.dt_polozio = dt_polozio;
    }
    public Integer getId() {return id;}
    public void setId(Integer id) {this.id = id;}
    public String getIme() {return ime;}
    public void setIme(String ime) {this.ime = ime;}
    public String getPrezime() {return prezime;}
    public void setPrezime(String prezime) {this.prezime = prezime;}
    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}
    public String getJmbg() {return jmbg;}
    public void setJmbg(String jmbg) {this.jmbg = jmbg;}
    public String getTelefon() {return telefon;}
    public void setTelefon(String telefon) {this.telefon = telefon;}
    public Date getDatrodj() {return datrodj;}
    public void setDatrodj(Date datrodj) {this.datrodj = datrodj;}
    public String getUsc() {return usc;}
    public void setUsc(String usc) {this.usc = usc;}
    public Date getDtc() {return dtc;}
    public void setDtc(Date dtc) {this.dtc = dtc;}
    public String getUsm() {return usm;}
    public void setUsm(String usm) {this.usm = usm;}
    public Date getDtm() {return dtm;}
    public void setDtm(Date dtm) {this.dtm = dtm;}
    public Integer getZavrsio_teor() {return zavrsio_teor;}
    public void setZavrsio_teor(Integer zavrsio_teor) {this.zavrsio_teor = zavrsio_teor;}
    public Integer getZavrsio_prvu_pomoc() {return zavrsio_prvu_pomoc; }
    public void setZavrsio_prvu_pomoc(Integer zavrsio_prvu_pomoc) {this.zavrsio_prvu_pomoc = zavrsio_prvu_pomoc;}
    public Integer getZavrsio_prakticni() {return zavrsio_prakticni;}
    public void setZavrsio_prakticni(Integer zavrsio_prakticni) {this.zavrsio_prakticni = zavrsio_prakticni;}
    public Integer getPolozio_prakticni() {return polozio_prakticni;}
    public void setPolozio_prakticni(Integer polozio_prakticni) {this.polozio_prakticni = polozio_prakticni;}
    public Integer getPolozio_teor() {return polozio_teor;}
    public void setPolozio_teor(Integer polozio_teor) {this.polozio_teor = polozio_teor;}
    public Date getDt_polozio() {return dt_polozio;}
    public void setDt_polozio(Date dt_polozio) {this.dt_polozio = dt_polozio;}

    @Override
    public String toString() {
        return super.toString() + "\n"+"zavrsio_teor: "+zavrsio_teor+", zavrsio_prvu_pomoc: "+zavrsio_prvu_pomoc
                +", zavrsio_prakticni: "+zavrsio_prakticni+", polozio_prakticni: "+polozio_prakticni
                +", polozio_teor: "+polozio_teor+"; datum kada je ucenik polozio voznju: "+ dt_polozio;
    }

    @Override
    public GenericObject getRecord(ResultSet resultSet) {
        try {
//        if(resultSet.next())
            return new Ucenik(
                    resultSet.getInt("id"),
                    resultSet.getString("ime"), resultSet.getString("prezime"),
                    resultSet.getString("email"), resultSet.getString("jmbg"),
                    resultSet.getString("telefon"), resultSet.getDate("datrodj"),
                    resultSet.getInt("zavrsio_teor"),
                    resultSet.getInt("zavrsio_prvu_pomoc"),
                    resultSet.getInt("zavrsio_prakticni"),
                    resultSet.getInt("polozio_prakticni"),
                    resultSet.getInt("polozio_teor"),
                    resultSet.getDate("dt_polozio"),
                    resultSet.getString("usc"), resultSet.getDate("dtc"), 
                    resultSet.getString("usm"), resultSet.getDate("dtm")
            );
        } catch (SQLException ex) {
            Logger.getLogger(Ucenik.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
