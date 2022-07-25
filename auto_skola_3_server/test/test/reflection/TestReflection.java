package test.reflection;


import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Grupa;
import model.Instruktor;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Filip
 */
public class TestReflection {
    public static void main(String[] args) throws ClassNotFoundException {
//        new Instruktor(Integer.SIZE, ime, prezime, email, jmbg, telefon, datrodj, username, pass, 0, datzap, usc, dtc, usm, dtm)
        Instruktor instr = new Instruktor(1, "aca", "janko", "emaiil", "123", "mobilni", new Date(2022-1900,02,02), 
                                            "aca", "aca", 0.0, new Date(2022-1900,02,02), "admin", new Date(2022-1900,02,02), "admin", new Date(2022-1900,02,02)
                            );
        
        
        
        Instruktor instr2 = new Instruktor("instr2", "2");
        List<Instruktor> instruktori = new ArrayList<>();
        instruktori.add(instr);
//        instruktori.add(instr2);
        
        for (Instruktor i : instruktori) {
            for( Field f : i.getClass().getDeclaredFields())
                try {
                    f.setAccessible(true);
                    String name = new String(f.getType().getName());
                    System.out.print(name+"\t");
                    name = name.substring(name.lastIndexOf(".")+1);
                    switch(name) {
                        case "Integer":
                            System.out.println(f.getName()+" = "+f.get(i));
                            break;
                        case "String":
                            System.out.println(
                                    f.getName()+" = '"+f.get(i).toString()+"'"
                            );
                            break;
                            
                    }
                    System.out.println(name+" "+f.getName()+": "+f.get(i));
                    f.setAccessible(false);
                } catch (IllegalArgumentException ex) {
                    Logger.getLogger(TestReflection.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IllegalAccessException ex) {
                    Logger.getLogger(TestReflection.class.getName()).log(Level.SEVERE, null, ex);
                }
            System.out.println("");
        }
        
        System.out.println("test reflection query");
        System.out.println(instr.makeSelectRefl());
//        Field[] fields = Class.forName("model.Instruktor").getDeclaredFields();
//        for(Field f : fields)
//            System.out.println(f.getName());
        Grupa g = new Grupa();
        System.out.println(g.makeSelectRefl());

        System.out.println(Runtime.getRuntime().availableProcessors());
        try {
            Runtime.getRuntime().exec("notepad.exe");
//        java.util.concurrent.BlockingQueue
        } catch (IOException ex) {
            Logger.getLogger(TestReflection.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
