package test.reflection;


import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Parameter;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Instruktor;
import java.sql.Date;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Stream;
import model.GenericObject;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Filip
 */
public class TestReflection_Constructor {
    public static void main(String[] args) throws ClassNotFoundException, NoSuchMethodException, 
                                                    InstantiationException, IllegalAccessException, 
                                                    IllegalArgumentException, InvocationTargetException {
        
        
        TestReflection_Constructor tr_constr = new TestReflection_Constructor();
        System.out.println("123");
        tr_constr.nonStaticMethod();
        
//        Class<?> cl = Class.forName("model.Instruktor");
//        Constructor<?> cons = cl.getConstructor();
//        System.out.println(cons.newInstance()+"\n");

        
//        
//        System.out.println("======================================");
//        try {
//            Thread.currentThread().sleep(1000);
//        } catch (InterruptedException ex) {
//            Logger.getLogger(TestReflection_Constructor.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        Class[] parameters_for_const = new Class[]{java.lang.Integer.class, java.lang.String.class,java.lang.String.class,double.class,java.sql.Date.class};
//        Constructor call_constr = Instruktor.class.getConstructor(parameters_for_const);
//        
//        Instruktor i = (Instruktor) call_constr.newInstance(new Object[]{1, "aca", "test", 1.2, new Date(2022-1900, 1, 1)});
//        
//        System.out.println("\nafter calling constructor: "+i);
//        
//        System.out.println("======================================");
//        
//        for(Constructor c : cl.getDeclaredConstructors())
//            System.out.println(c);
    }
    
    
    public void nonStaticMethod() {
        
//        Class<?> cl = Class.forName("model.Instruktor");
//        Constructor<?> cons = cl.getConstructor();
//        System.out.println(cons.newInstance()+"\n");
        
//        Instruktor instr_za_refl = new Instruktor(1, "aca", "janko", 123, null);
        Instruktor instr_za_refl = new Instruktor("aca", "janko");
        Class<?> cl = instr_za_refl.getClass();

        Constructor full_const = null;
        List<Object> values = new LinkedList<>(); // new Object[parametri.length];        
        for(Constructor c : cl.getConstructors()) {
//            System.out.println(c);
            for(var a : c.getDeclaredAnnotations()) {
                System.out.println(c);
                System.out.println("anotacija:\t"+a);
                
                if(a.toString().contains("forGetRecord")) {
                    System.out.println("\t"+"ovo ce ici u getRecordRefl metodu");
//                    System.out.println("\t"+c.getParameters());

                    Parameter[] parametri = c.getParameters();
//                    List<Object> values = new LinkedList<>(); // new Object[parametri.length];
                    System.out.println("duzinaa niza parametara za konstruktor "+parametri.length);
                    Class[] const_p = new Class[parametri.length];
                    for(int i = 0; i < parametri.length; i++ ) {
                        System.out.println((i+1)+".\tname: "+parametri[i].getName());
                        const_p[i] = parametri[i].getType();
                        String param_type = const_p[i].toGenericString();
                        param_type = param_type.contains(" ") ? param_type.substring(param_type.lastIndexOf(" ")+1) : param_type;
                        System.out.println("\tconstr_param type: "+ param_type);
                        
//                        Object field_value =
                        for(Field f : cl.getDeclaredFields()) {
                            f.setAccessible(true);
                            
                            if(f.getName().equals(parametri[i].getName())) {
                                System.out.println("\tfield_name: " + f.getName()+" | param_name: "+parametri[i].getName());
                                Object field_value = null;
                                if(param_type.equals("java.lang.Integer"))
                                    System.out.println("\t\t\tInteger tip, zovem rs.getInt("+parametri[i].getName()+")");
                                
                                try {
                                    field_value = f.get(instr_za_refl);
                                } catch (IllegalArgumentException | IllegalAccessException ex) {
                                    Logger.getLogger(GenericObject.class.getName()).log(Level.SEVERE, null, ex); 
                                    System.out.println("Doslo je do greske prilikom izvlacenja vrednosti");
                                }            
                                
//                                values[i] = field_value;
                                values.add(field_value);
                                System.out.println("\tfetched field_value "+f.getName()+": "+field_value);
                            }
                        }
                    }
                    
                    full_const = c;
                    // TODO 
                    //      1. izvuci vrednosti iz objekta
//                    try {
//                        //      2. pozovi konstruktor
//                        Instruktor instr_result = (Instruktor) full_const.newInstance(values);
//                        System.out.println("instr_result: " + instr_result);
//                    } catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException ex) {
//                        Logger.getLogger(TestReflection_Constructor.class.getName()).log(Level.SEVERE, null, ex);
//                    }
                    
//                    Instruktor obj_refl = (Instruktor) c.newInstance(const_p);
//                    System.out.println(obj_refl);
                    System.out.println("");
                }
            }
            
        }
        Object[] values_of_object = values.toArray();
        try {
            Instruktor instr_result = (Instruktor) full_const.newInstance(values_of_object);
            System.out.println("instr_result: " + instr_result);
        } catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException ex) {
            Logger.getLogger(TestReflection_Constructor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void funcgtionalWay() {
        Instruktor instr_za_refl = new Instruktor("aca", "janko");
        Class<?> cl = instr_za_refl.getClass();

        Constructor[] constructors = cl.getDeclaredConstructors();
        Stream<Constructor> stream = Arrays.stream(constructors);
        stream.forEach((c) -> {
            System.out.println("Do something . . .");
        });
//        Stream stream = ()
    }
}
