/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.lang.annotation.Annotation;
import java.sql.ResultSet;
import java.lang.reflect.*;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Filip
 */
public abstract class GenericObject {

    private final Field[] fields;
    private final String className;

    public GenericObject() {
        this.fields = getClass().getDeclaredFields();
        className = getClass().getSimpleName().toUpperCase();
    }
    public String getClassName() {
        return className;
    }
    
    public abstract GenericObject getRecord(ResultSet resultSet);
    
    public String getGenericWhere() {
        return "WHERE 1=1 ";
    }        
    public String makeSelectRefl() {
        return "SELECT "+getColumNamesRefl()
                +"\nFROM " + className
                +"\n"+getGenericWhere()+makeWhereRefl();
    }
    
    public String makeInsertRelf() {
         return "INSERT INTO "+className+"\n"
                 +"("+getColumNamesRefl()+")\n"+
                 "VAULES("+getColumnValuesRefl()+")";
    }
    
    public String makeUpdateRefl() {
        return "UPATE "+className+" SET\n"+
                getColumnValuesRefl()+"\n"
                +getGenericWhere();
    }
    
    public String makeWherePrimKeyRefl() {
        throw new UnsupportedOperationException("Izvuci vrednosti za pkey uz pomoc anotacija");
    }
    public GenericObject getRecordRelf(ResultSet resultSet) {
        GenericObject result = null;        
        Class<?> cl = this.getClass();
        Constructor annotated_constructor = null;
        List<Object> values = new LinkedList<>();
        
        for(Constructor c : cl.getConstructors()) {
            for(var annotation : c.getDeclaredAnnotations()) {
                if(annotation.toString().contains("forGetRecord")) {
                    annotated_constructor = c;
                    Parameter[] parametri = c.getParameters();
                    Class[] param_type_to_trim = new Class[parametri.length];
                    for(int i = 0; i < parametri.length; i++ ) {
                        param_type_to_trim[i] = parametri[i].getType();
                        String param_type = param_type_to_trim[i].toGenericString();
                        param_type = param_type.contains(" ") ? param_type.substring(param_type.lastIndexOf(" ")+1) : param_type;
                        
                        for(Field f : cl.getDeclaredFields()) {
                            f.setAccessible(true);
                            String fieldName= f.getName();
                            if(fieldName.equals(parametri[i].getName())) {
                                Object field_value = null;
                                try {
                                    field_value = fetchFieldValue(resultSet, param_type, fieldName);
                                } catch (SQLException ex) {
                                    Logger.getLogger(GenericObject.class.getName()).log(Level.SEVERE, null, ex);
                                }
                                values.add(field_value);
                            }
                            f.setAccessible(false);
                        }
                    }
                }
            }            
        }
        try {
            Object[] values_array = values.toArray();
            result = (GenericObject) annotated_constructor.newInstance(values_array);
        
        } catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException ex) {
            Logger.getLogger(GenericObject.class.getName()).log(Level.SEVERE, null, ex);}
        
        return result;
    }
    private Object fetchFieldValue(ResultSet resultSet, String param_type, String fieldName) throws SQLException {
        Object field_value = null;
        switch(param_type) {
            case "java.lang.Integer":
                    field_value = resultSet.getInt(fieldName);
                break;
//            case "double":
            case "java.lang.Double":
                    field_value = resultSet.getDouble(fieldName);
                break;
            case "java.lang.String":
                    field_value = resultSet.getString(fieldName);
                break;
            case "java.sql.Date":
                    field_value = resultSet.getDate(fieldName);
                break;
        }
        return field_value;
    }

    public String getColumNamesRefl() {
        StringBuilder columns = new StringBuilder("");
        for(Field f : fields) {
            if(f.equals(fields[0])) // ako je prvi clan
                columns.append(f.getName());
            else
                columns.append(", ".concat(f.getName()));
        }
        return columns.toString();
    }
    
    public String getColumnValuesRefl() {
        String values = "";
        for(Field f : fields) {
            f.setAccessible(true);
            String type = f.getType().getName();
            type = type.substring(type.lastIndexOf(".")+1);
            
            Object value = null;
            try {
                value = f.get(this);
            } catch (IllegalArgumentException | IllegalAccessException ex) {Logger.getLogger(GenericObject.class.getName()).log(Level.SEVERE, null, ex); }            
            
            if(value == null) {
                values += "null, ";
                continue;
            }
            
            switch(type) {
                case "Integer":
                    values += value;
                    break;
                case "Double":
                    values += value;
                    break;
                case "String":
                    values += "'"+value.toString()+"'";
                    break;
                case "Date":
                    values += "'"+value.toString()+"'";
                    break;
            }
            values += ", ";
            f.setAccessible(false);
        }
        
        values = values.substring(0, values.lastIndexOf(","));
        return values;
    }
    
    public String makeWhereRefl() {
        String values = "";
        for(Field f : fields) {
            f.setAccessible(true);
            String field_name = f.getName();
            String attr_type = f.getType().getName();
            attr_type = attr_type.substring(attr_type.lastIndexOf(".")+1);
            
            Object field_value = null;
            try {
                field_value = f.get(this);
            } catch (IllegalArgumentException | IllegalAccessException ex) {Logger.getLogger(GenericObject.class.getName()).log(Level.SEVERE, null, ex); }            

            if(field_value == null)  continue;

            values += "\n and "+field_name+" = ";
            
            switch(attr_type) {
                case "Integer":
                    values += field_value;
                    break;
                case "Double":
                    values += field_value;
                    break;
                case "String":
                    values += "'"+field_value.toString()+"'";
                    break;
                case "Date":
                    values += "'"+field_value.toString()+"'";
                    break;
            }
            f.setAccessible(false);
        }
        
        return values;
    }
    
}
