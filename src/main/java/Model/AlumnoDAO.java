
package Model;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AlumnoDAO {
    Connection conexion;
    
    public AlumnoDAO(){
        Conexion con = new Conexion();
        this.conexion = con.getConnection();       
    }
        
    public List<Alumno> listarAlumnos(){
        PreparedStatement ps;
        ResultSet rs;
        List<Alumno> lista = new ArrayList<>();
        try{
            ps = conexion.prepareStatement("SELECT * FROM alumnos");
            rs = ps.executeQuery();
            
            while(rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String mail = rs.getString("mail");
                Alumno alumno = new Alumno(id,nombre,apellido,mail);
                lista.add(alumno);
            }
            
            return lista;           
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    }   
    
    
    public Alumno mostrarAlumno(int _id){
        PreparedStatement ps;
        ResultSet rs;
        Alumno alumno = null;
        try{
            ps = conexion.prepareStatement("SELECT * FROM alumnos WHERE id=?");
            ps.setInt(1, _id);
            rs = ps.executeQuery();
            
            while(rs.next()){
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String mail = rs.getString("mail");                
                alumno = new Alumno(id,nombre,apellido,mail);               
            }
            
            return alumno;           
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    } 
    
    
    public boolean insertarAlumno(Alumno alumno){
        PreparedStatement ps;
        try{
            ps = conexion.prepareStatement("INSERT INTO alumnos(nombre,apellido,mail) VALUES (?,?,?)");
            ps.setString(1, alumno.getNombre());
            ps.setString(2, alumno.getApellido());
            ps.setString(3, alumno.getMail());
            ps.execute();
            return true;            
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }       
    }
    
    public boolean actualizarAlumno(Alumno alumno){
        PreparedStatement ps;
        try{
            ps = conexion.prepareStatement("UPDATE alumnos SET nombre=?,apellido=?,mail=? WHERE id=?");
            ps.setString(1, alumno.getNombre());
            ps.setString(2,alumno.getApellido());
            ps.setString(3, alumno.getMail());
            ps.setInt(4, alumno.getId());
            ps.execute();
            return true;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }   
    }
    
    
    public boolean eliminarAlumno(int _id){
        PreparedStatement ps;
        try{
            ps = conexion.prepareStatement("DELETE FROM alumnos WHERE id=?");
            ps.setInt(1, _id);
            ps.execute();
            return true;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }
        
    }
    
}
