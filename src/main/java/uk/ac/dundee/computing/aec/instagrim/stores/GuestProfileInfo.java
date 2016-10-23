/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.stores;

/**
 *
 * @author seans
 */
public class GuestProfileInfo { 
    
    private String first_name;
    private String last_name;
    private String email;
    private java.util.UUID profilepic;
    private String username =null;
    
    public void GuestProfileInfo(){
        
    }
    
     public void setUsername(String name){
        this.username=name;
    }
    public String getUsername(){
        return username;
    }
    //Set Methods for Forename, Surname and Email Address
    public void setFirst_name(String first_name)
    {
        this.first_name = first_name; 
    }
    
    public void setLast_name(String last_name){
        this.last_name = last_name;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public void update(String first_name, String last_name, String email){
        setFirst_name(first_name);
        setLast_name(last_name);
        setEmail(email);
        
    }
    
    //Get Methods for Forename, Surname and Email Address
    public String getFirst_name()
    {
        return first_name;
    }
    
    public String getLast_name()
    {
        return last_name;
    }
        
    public String getEmail()
    {
        return email;
    }
    
    
    //Get and Set methods for the profile picture UUID 
    public void setProfilePic(java.util.UUID uuid){
    
        this.profilepic = uuid;
    }
    
    public java.util.UUID getProfilePic(){
    
    return profilepic;
    }
    
    
}
