/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server;

import controller.ControllerSer;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;
import transferObject.TransferObject;

/**
 *
 * @author Filip
 */
public class ClientThread extends Thread {
    private final Socket client;
    private ObjectInputStream ois;
    private ObjectOutputStream oos;
    private ControllerSer controller;
    private TransferObject request;
    private TransferObject response;
    private String message;
    
    ClientThread(Socket client) {
        this.client = client;
        getStreams();
    }

    private void getStreams() {
        try {
            ois = new ObjectInputStream(client.getInputStream());
            oos = new ObjectOutputStream(client.getOutputStream());
            controller = ControllerSer.getInstance();
        }catch (IOException ex) {
            System.out.println("");
            Logger.getLogger(ClientThread.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private void setMessage(String message) { this.message = message; }

    @Override
    public void run() {
        try {
            System.out.println("\tClientThread.run()");
            handleClient();
        } catch (IOException | ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
    }

    private void handleClient() throws IOException, ClassNotFoundException {
        while(true) {
            request = (TransferObject) ois.readObject();
            performAction(request.getAction());
        }
    }

    private void performAction(String action) throws IOException {
        System.out.println("\tperformOperation.read acction :"+action);
        switch(action) {
            case "log_in":
                System.out.println("\t\tperformOperation.logIn");
                response = controller.logIn(request);
                break;
            case "kreiraj_novog_ucenika":
                System.out.println("\t\tperformOperation.kreiraj_novog_ucenika");
//                response = controller.krairajNovogUcenika(request);                
                break;
            case "kreiraj_teorijski_cas":
                System.out.println("\t\tperformOperation.kreiraj_teorijski_cas");
//                sendObject(ControllerSer.getInstance().kreirajTeorijskiCas(request));
                break;
            case "kreiraj_prakticni_cas":
                System.out.println("\t\tperformOperation.kreiraj_prakticni_cas");
//                sendObject(ControllerSer.getInstance().kreirajPrakticniCas(request));
                break;
            case "izmeni_ucenika":
                System.out.println("\t\tperformOperation.izmeni_ucenika");
//                response = controller.izmeniUcenika(request);                
                break;
            case "zapamti_ucenika":
                System.out.println("\t\tperformOperation.zapamti_ucenika");
//                response = controller.zapamtiUcenika(request);                
                break;
            
            case "pronadji":
                System.out.println("\t\tperformOperation.pronadji");
//                response = controller.izmeniUcenika(request);                
                break;
            default:
                setMessage("Action \"" + action+"\" is not supported.");
        }
        sendResponse(response);
    }

    private void sendResponse(TransferObject response) throws IOException {
        oos.writeObject(response);
    }

    
    
}
