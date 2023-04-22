package com.banking.beans;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;



public class PhotoDAO {
    String databaseURL = "jdbc:mysql://localhost:3306/banking";
    String user = "root";
    String password = "root";
     
    public String get(String acc_no) throws SQLException, IOException {
        PhotoDAO photo = null;
         
        String sql = "SELECT * FROM accPhoto WHERE acc_no=?";
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        try (Connection connection = DriverManager.getConnection(databaseURL, user, password)) {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, acc_no);
            ResultSet result = statement.executeQuery();
             
            if (result.next()) {
               photo=new PhotoDAO();
 
                Blob blob = result.getBlob("photo");                 
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);                
                inputStream.close();
                outputStream.close();                 
                System.out.println("Done_1");
                return base64Image;
                
            }          
             
        } catch (SQLException | IOException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         return null;
        
    }
}
