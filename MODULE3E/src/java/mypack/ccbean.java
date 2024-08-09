/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.ejb.Stateful;

/**
 *
 * @author Admin
 */
@Stateful
public class ccbean {

   public  ccbean(){
 }
   public String roombooking(String Cn,String Cm,String Rt){
       String message="";
       try {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
           String query="SELECT * FROM roombook WHERE roomtype=? AND status='Not Booked'";
           PreparedStatement ps=con.prepareStatement(query);
           ps.setString(1, Rt);
           ResultSet rs=ps.executeQuery();
           if(rs.next()){
               String rno=rs.getString(1);
               PreparedStatement ps1=con.prepareStatement("UPDATE roombook SET cust=? WHERE room_id=?");
               ps1.setString(1, Cn);
               ps1.setString(2, rno);
               ps1.executeUpdate();
               ps1=con.prepareStatement("UPDATE roombook SET mob=? WHERE room_id=?");
               ps1.setString(1, Cm);
               ps1.setString(2, rno);
               ps1.executeUpdate();
                 ps1=con.prepareStatement("UPDATE roombook SET status=? WHERE room_id=?");
               ps1.setString(1, "Booked");
               ps1.setString(2, rno);
               ps1.executeUpdate();
               message="room"+rno+"Booked and Charges ="+rs.getString(3);
           }else{
               
           }
       }
       catch(Exception e){
           {message=""+e;}
       }
       return message;
   }
               
       
   }

