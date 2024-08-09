/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import javax.ejb.Stateless;

/**
 *
 * @author Admin
 */
@Stateless
public class Ccbean {

   public void Ccbean(){
}
   public double ruppes_dollar(double a){
       return a/83.96;
   }
   public double ruppes_Euro(double a){
       return a/91;
   }
   public double ruppes_Dinar(double a){
       return a/247;
   }
           
           
           
}
