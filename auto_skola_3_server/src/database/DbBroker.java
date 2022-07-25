/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.GenericObject;
import model.Instruktor;
/**
 *
 * @author Filip
 */
public class DbBroker {
    private static DbBroker instance;
    private Connection connection;
    private ResultSet resultSet;
    private Statement statement;
    
    private DbBroker() {}
    public static DbBroker getInstance() {
        if(instance == null)
            instance = new DbBroker();
        return instance;
    }

    public boolean openConnection() {
        try {    
            String url = "jdbc:mysql://localhost:3306/auto_skola_3";
            String user = "root";
            String pass = "";

            connection = DriverManager.getConnection(url, user, pass);
            connection.setAutoCommit(false);
            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DbBroker.class.getName()).log(Level.SEVERE, "Cannot open the connection", ex);
        }
        return false;
    }
    
    public boolean closeConnection() {
        try {
            if(connection != null) connection.close();
            if(resultSet != null) resultSet.close();
            if(statement != null) statement.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DbBroker.class.getName()).log(Level.SEVERE, "Could not close the transaction", ex);
        }
        return false;
    }

    public synchronized boolean commitTrans() {
        try {
            connection.commit();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DbBroker.class.getName()).log(Level.SEVERE, "Could not commit the transaction", ex);
        }
        return false;
    }

    public synchronized boolean rollbackTrans() {
        try {
            connection.rollback();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DbBroker.class.getName()).log(Level.SEVERE, "Could not rollback the transaction", ex);
        }
        return false;
    }

    public synchronized GenericObject logIn(GenericObject in_instruktor) {
        throw new UnsupportedOperationException("Rodjace treba da proveris login");
//        if(in_instruktor == null) {
//            return null;
//        }
//        resultSet = null;
//        Instruktor out_instruktor;
//        
//        String query = ((Instruktor)in_instruktor).makeLoginQuery();
//        System.out.println("Sklopnjen query: \n"+query);
//        try {
//            if(connection == null) {
//                System.out.println("DB.logIN() connection is null!!!!");
//            }
//            statement = connection.createStatement();
//            resultSet = statement.executeQuery(query);
//            if(resultSet.next()) {
//                out_instruktor = (Instruktor) in_instruktor.getRecord(resultSet);
//                System.out.println("DBBroker.login returned instruktor " + out_instruktor);
//                return out_instruktor;
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DbBroker.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
    }

    public synchronized boolean find(GenericObject input, List<GenericObject> result) {
        boolean signal = false;
        if(input == null)
            return false;
            
        String query = input.makeSelectRefl();
        System.out.println("\tSkolpljen query: \t"+query);
        
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            while(resultSet.next()) {
                result.add(input.getRecordRelf(resultSet));
            }
        } catch (SQLException ex) {Logger.getLogger(DbBroker.class.getName()).log(Level.SEVERE, null, ex);}
        
        return signal;
    }
}
