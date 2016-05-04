/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

/**
 *
 * @author Ruth
 */
public class HashString {
    
     public static String Encrypt(String pass)
    {
        String saltEnd = "162300JBKYSCOTT"; // 128 bit key;
        String saltStart = "7hegdChickenu2ys90";
        pass = saltStart + pass +  saltEnd;
        Integer hashedValue = pass.hashCode();
        return Integer.toString(hashedValue);
    }

    
}
