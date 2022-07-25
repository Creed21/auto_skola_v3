package test.reflection;


import java.sql.Date;
import model.Instruktor;
import model.X;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Filip
 */
public class TestReflection_InsertQuery {
    public static void main(String[] args) {
        Instruktor instr = new Instruktor(1, "aca", "janko", "emaiil", "123", "mobilni", new Date(2022-1900,02,02), 
                                            "aca", "aca", 0.0, new Date(2022-1900,02,02), "admin", new Date(2022-1900,02,02), "admin", new Date(2022-1900,02,02)
                            );
//        instr.x = "novo polje";
        Instruktor instr2 = new Instruktor("instr2", "2");
        System.out.println("======================INSTRUKTOR 1=========================");
        System.out.println("\n=====================INSERT=============================="); 
        System.out.println(instr.makeInsertRelf());
        System.out.println("============================================================");
        System.out.println("\n=====================SELECT=============================="); 
        System.out.println(instr.makeSelectRefl());
        System.out.println("\n============================================================\n");
        
        System.out.println("======================INSTRUKTOR 2=========================");
        System.out.println("\n=====================INSERT=============================="); 
        System.out.println(instr2.makeInsertRelf());
        System.out.println("============================================================");
        System.out.println("\n=====================SELECT=============================="); 
        System.out.println(instr2.makeSelectRefl());
        System.out.println("\n============================================================\n");
        
        X x_test = new X("Rade", 1, 10.2, "novo_polje", "xyz");
        
        System.out.println(x_test.makeInsertRelf());
        
    }
    
}
