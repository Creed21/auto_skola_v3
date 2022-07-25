package test.reflection;


import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.sql.Date;
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
public class TestReflection_Annotation {
    public static void main(String[] args) throws ClassNotFoundException {
        
        Instruktor instr = new Instruktor(1, "aca", "janko", "emaiil", "123", "mobilni", new Date(2022-1900,02,02), 
                                            "aca", "aca", 0.0, new Date(2022-1900,02,02), "admin", new Date(2022-1900,02,02), "admin", new Date(2022-1900,02,02)
                            );
        
        System.out.println("===================================");
        System.out.println("=========TEST ANNOTATION=============");
        System.out.println("===================================");
        Class<?> cls = Class.forName("model.Instruktor");
//        System.out.println(cls.getDeclaredFields()[0].getAnnotations()[0].toString());

        for(Field f : instr.getClass().getDeclaredFields()) {
            
            Annotation[] a  = f.getAnnotations();
            for (Annotation ae : f.getAnnotations()) {
                System.out.println(f.getName()+", "+ae);
            }
//            System.out.println("annotation: "+a.toString());
//            for(Annotation ae : f.getAnnotations()) {
//                f.setAccessible(true);
//                Object value = null;
//                try {
//                    value = f.get(ae);
//                } catch (IllegalArgumentException ex) {
//                    Logger.getLogger(TestReflection.class.getName()).log(Level.SEVERE, null, ex);
//                } catch (IllegalAccessException ex) {
//                    Logger.getLogger(TestReflection.class.getName()).log(Level.SEVERE, null, ex);
//                }
//                System.out.println(value);
//            }
        }
    }
}
