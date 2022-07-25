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
public class Grupa extends GenericObject {
    @PrimaryKeyAnnotation(PrimaryKey = "Y")
    private Integer id;
    private String naziv;
    private Date dtpoc;
    private String usc;
    private Date dtc;
    private String usm;
    private Date dtm;
    private Integer id_instruktor;
    private Integer id_kategorija;
    
    public Grupa() {}
    @ConstuctorAnnotation(forGetRecord="Y")
    public Grupa(Integer id, String naziv, Date dtpoc, String usc, Date dtc, String usm, Date dtm, Integer id_instruktor, Integer id_kategorija) {
        this.id = id;
        this.naziv = naziv;
        this.dtpoc = dtpoc;
        this.usc = usc;
        this.dtc = dtc;
        this.usm = usm;
        this.dtm = dtm;
        this.id_instruktor = id_instruktor;
        this.id_kategorija = id_kategorija;
    }
    public Grupa(String naziv, Date dtpoc, String usc, Date dtc, String usm, Date dtm) {
        this.naziv = naziv;
        this.dtpoc = dtpoc;
        this.usc = usc;
        this.dtc = dtc;
        this.usm = usm;
        this.dtm = dtm;
    }
    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Grupa) {
            Grupa g = (Grupa) obj;
            if((int)this.id == (int)g.id)
                return true;
        }
        return false;
    }
    @Override
    public String toString() {
        return "id: "+id+". "+naziv+ ", kategorija= "+id_kategorija+", instruktor= "+id_instruktor+" "
                +", kategor: "+id_kategorija+" , "+dtpoc+"\n\t\t"
                 +"kreirao "+usc+" "+dtc+"; modifikovao "+usm+" "+dtm+"\n"
//                +" | instruktor=|"+instruktor
                ;
    }
    public Integer getId_instruktor() { return id_instruktor; }
    public void setId_instruktor(Integer id_instruktor) { this.id_instruktor = id_instruktor; }
    public Integer getId_kategorija() { return id_kategorija; }
    public void setId_kategorija(Integer id_kategorija) { this.id_kategorija = id_kategorija; }
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getNaziv() { return naziv; }
    public void setNaziv(String naziv) { this.naziv = naziv; }
    public Date getDtpoc() { return dtpoc; }
    public void setDtpoc(Date dtpoc) { this.dtpoc = dtpoc; }
    public String getUsc() { return usc; }
    public void setUsc(String usc) { this.usc = usc; }
    public Date getDtc() { return dtc; }
    public void setDtc(Date dtc) { this.dtc = dtc; }
    public String getUsm() { return usm; }
    public void setUsm(String usm) { this.usm = usm; }
    public Date getDtm() { return dtm; }
    public void setDtm(Date dtm) { this.dtm = dtm; }
    
    @Override
    public GenericObject getRecord(ResultSet resultSet) {
        try { 
            return new Grupa(resultSet.getInt("id"), resultSet.getString("naziv"), resultSet.getDate("dtpoc"),
                    resultSet.getString("usc"),resultSet.getDate("dtc"),
                    resultSet.getString("usm"),resultSet.getDate("dtm"),
                    resultSet.getInt("id_instr"), 
                    resultSet.getInt("id_kategor")
            );
        } catch (SQLException ex) {
            Logger.getLogger(Grupa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
