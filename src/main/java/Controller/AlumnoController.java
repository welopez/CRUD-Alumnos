
package Controller;

import Model.Alumno;
import Model.AlumnoDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AlumnoController", urlPatterns = {"/AlumnoController"})
public class AlumnoController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AlumnoDAO alumnoDao = new AlumnoDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        
        if(accion == null || accion.isEmpty()){
            dispatcher = request.getRequestDispatcher("View/alumnos.jsp");            
        }
        else if("nuevo".equals(accion)){
            dispatcher = request.getRequestDispatcher("View/nuevo.jsp");
        }
        else if("modificar".equals(accion)){
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("id", id);
            dispatcher = request.getRequestDispatcher("View/modificar.jsp");
        }
        else if("eliminar".equals(accion)){
            int id = Integer.parseInt(request.getParameter("id"));
            alumnoDao.eliminarAlumno(id);
            dispatcher = request.getRequestDispatcher("View/alumnos.jsp");
        }
        else if("insert".equals(accion)){
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String mail = request.getParameter("mail");
            if(nombre != null || apellido != null || mail != null){ //Esta comprobacion no anda
                Alumno alumno = new Alumno(nombre, apellido, mail);
                alumnoDao.insertarAlumno(alumno);
            }
            dispatcher = request.getRequestDispatcher("View/alumnos.jsp");
        }
        else if("actualizar".equals(accion)){
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String mail = request.getParameter("mail");
            if(nombre != null || apellido != null || mail != null){ //Esta comprobacion no anda
                Alumno alumno = new Alumno(id, nombre, apellido, mail);
                alumnoDao.actualizarAlumno(alumno);
            }
            dispatcher = request.getRequestDispatcher("View/alumnos.jsp");
        }
        
        else{
            dispatcher = request.getRequestDispatcher("View/error.jsp");
        }
    
        dispatcher.forward(request, response);       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        
        doGet(request,response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
