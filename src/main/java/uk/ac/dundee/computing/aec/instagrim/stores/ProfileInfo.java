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
public class ProfileInfo {
    String first_name;
    String last_name;
    String email;
    
    public void ProfileInfo(){
        
    }
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
    
}
