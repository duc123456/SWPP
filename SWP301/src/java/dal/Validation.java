/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.Scanner;

/**
 *
 * @author ADMIN
 */
public class Validation {
    
    public class InputValue {
    private final  Scanner sc = new Scanner(System.in);
    public  String inputString(String text,String regex){
        
        while(true){
            try {
                System.out.print(text+":");
                String n = sc.nextLine();
                if(n.matches(regex)){
                    return n.trim();
                }
                
            } catch (Exception e) {
                System.out.println("invalid value");
            }
            
        }
        
    }

    } 
    
}
