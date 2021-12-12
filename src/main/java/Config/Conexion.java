
package Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion {
    public String driver="com.mysql.jdbc.Driver";
    
    
    public Connection getConnection(){
        Connection conexion=null;
        try{
            Class.forName(driver);
            conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/crud2159","root","");
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.println("No se pudo conectar a la BD => " + e);
        }
        
        return conexion;
    }   

    
    public static void main(String [] args) throws SQLException{
        Conexion con = new Conexion();
        Connection conexion;
        conexion = con.getConnection();
    
        if(conexion != null){
            PreparedStatement ps;
            ResultSet rs;
            
            try{
                ps=conexion.prepareStatement("SELECT * FROM alumnos");
                rs=ps.executeQuery();
                while(rs.next()){
                    int id=rs.getInt("id");
                    String nombre=rs.getString("nombre");
                    String apellido=rs.getString("apellido");
                    String mail=rs.getString("mail");     
                    System.out.println("id:"+id+" Nombre:"+nombre+" Apellido:"+apellido+" Mail:"+mail);
                }   
            }
            catch(SQLException e){
                System.out.println("No se pudo realizar la consulta SQL => " + e);
            }
        }
    }

}