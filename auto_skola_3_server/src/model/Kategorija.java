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
public class Kategorija extends GenericObject {
    @PrimaryKeyAnnotation(PrimaryKey = "Y")
    private Integer id;
    private String naziv;
    private Integer min_god; 
    private String usc;
    private Date dtc;
    private String usm;
    private Date dtm;

    public Kategorija() {}
    public Kategorija(String naziv, Integer min_god, String usc, Date dtc, String usm, Date dtm) {
        this.naziv = naziv;
        this.min_god = min_god;
        this.usc = usc;
        this.dtc = dtc;
        this.usm = usm;
        this.dtm = dtm;
    }
    @ConstuctorAnnotation(forGetRecord = "Y")
    public Kategorija(Integer id, String naziv, Integer min_god, String usc, Date dtc, String usm, Date dtm) {
        this.id = id;
        this.naziv = naziv;
        this.min_god = min_god;
        this.usc = usc;
        this.dtc = dtc;
        this.usm = usm;
        this.dtm = dtm;
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Kategorija) {
            Kategorija k = (Kategorija) obj;
            if(this.id == k.id) 
                return true;
        }
        return false;
    }
    
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getNaziv() { return naziv; }
    public void setNaziv(String naziv) { this.naziv = naziv; }
    public Integer getMin_god() { return min_god; }
    public void setMin_god(Integer min_god) { this.min_god = min_god; }
    public String getUsc() { return usc; }
    public void setUsc(String usc) { this.usc = usc; }
    public Date getDtc() { return dtc; }
    public void setDtc(Date dtc) { this.dtc = dtc; }
    public String getUsm() { return usm; }
    public void setUsm(String usm) { this.usm = usm; }
    public Date getDtm() { return dtm; }
    public void setDtm(Date dtm) { this.dtm = dtm; }

    @Override
    public String toString() {
        return id+". "+naziv+", minimalan broj godina za upis kategorje: "+min_god+"\n"
                +"kreirao: "+usc+" "+dtc+"; modifikovao: "+usm+" "+dtm;
    }
    
    @Override
    public GenericObject getRecord(ResultSet resultSet) {
        try {
            return new Kategorija(
                    resultSet.getInt("id"),
                    resultSet.getString("naziv"),
                    resultSet.getInt("min_god"),
                    resultSet.getString("usc"),
                    resultSet.getDate("dtc"),
                    resultSet.getString("usm"),
                    resultSet.getDate("dtm")
            );
        } catch (SQLException ex) {
            Logger.getLogger(Kategorija.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
