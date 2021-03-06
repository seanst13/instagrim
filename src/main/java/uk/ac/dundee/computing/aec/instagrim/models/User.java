/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

/**
 *
 * @author Administrator
 */
public class User {
    Cluster cluster;
    public User(){
        
    }
    
    public boolean RegisterUser(String username, String Password, String first_name, String last_name, String email){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }

        
        
            Session session = cluster.connect("instagrim");
            PreparedStatement ps = session.prepare("insert into userprofiles (login,password,first_name,last_name,email) Values(?,?,?,?,?)");

            BoundStatement boundStatement = new BoundStatement(ps);
            session.execute( // this is where the query is executed
                    boundStatement.bind( // here you are binding the 'boundStatement'
                            username,EncodedPassword, first_name, last_name,email));
            //We are assuming this always works.  Also a transaction would be good here !
            return true;  
        
        }
        
        
    
    
    public boolean IsValidUser(String username, String Password){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            return false;
        } else {
            for (Row row : rs) {
               
                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0)
                    return true;
            }
        }
   
    
    return false;  
    }
       public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

    public String[] getUserInformation(String username){
        cluster = CassandraHosts.getCluster(); 
        //This retrieves the user information(forename, surname and email address)
        // And returns them in a string array. 
        String[] userInfo = new String[3];
        
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("SELECT first_name, last_name, email FROM userprofiles WHERE login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        
        if (rs.isExhausted()){
            System.out.println("No user information retieved from the database");
            
        } else {
            for(Row row: rs){
            userInfo[0] = row.getString(0);
            userInfo[1] = row.getString(1);
            userInfo[2] = row.getString(2);
            System.out.println(userInfo[0] + userInfo[1] + userInfo[2]);
            }
        }
                  
        return userInfo;
    }
    
    public void updateUser(String username, String first_name, String last_name, String email){
        
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("UPDATE userprofiles SET first_name =?, last_name = ?, email = ? WHERE login =?");
        
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        first_name, last_name, email, username));
//        
//        if (rs.isExhausted()){
//            System.out.println("No user information retieved from the database");
//            
//        } 
            
        }
    
    public boolean IsUsernameTaken(String username){
        
        //Returns a true if the username hasn't been taken and false if it has. 
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("SELECT login FROM userprofiles WHERE login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        
        if (rs.isExhausted()){
            System.out.println("No user information retieved from the database");
            return true;
            
        } else {
            return false;
            }
        }
       
    public java.util.UUID getProfilePicUUID (String username){
    
     //Retrieves the profile picture UUID from the Database
    java.util.UUID picid = null;
    Session session = cluster.connect("instagrim");
    PreparedStatement ps = session.prepare("select picid from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));

            for (Row row : rs) {
               
                picid = row.getUUID("picid");
                      
            }
        
            return picid;
       
    }
    
    public boolean passwordCheck(String firstpassword, String secondPassword){
    
        //Method literally just compares whether the two passwords are equal to eachother and returns true if they do
        if(firstpassword.contentEquals(secondPassword))
        {
            return true;
        } 
        else 
        {
            return false;
        }
    }


} //End of Class
        
        


