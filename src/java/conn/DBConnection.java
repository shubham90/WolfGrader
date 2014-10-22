/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Shubham
 */
public class DBConnection {
    public static Connection connectDB(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String conString="jdbc:oracle:thin:@ora.csc.ncsu.edu:1521:orcl";
            Connection con=DriverManager.getConnection(conString,"agillfi","200024707");
            return con;
        }catch(ClassNotFoundException | SQLException e){
            JOptionPane.showMessageDialog(null, e);
        }
        return null;
    }
}
