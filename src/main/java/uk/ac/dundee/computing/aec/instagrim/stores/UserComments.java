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
public class UserComments {
    
    
    private String comment;
    private String user;
    
    public UserComments() {}
    
    public void setComment(String comment){
        this.comment = comment;
    }
    
    public String getComment(){
        return comment;
    }
    
    public void setUser(String username){
        this.user = username;
    }
    
    public String getUser(){
        return user; 
    }       
    
}
