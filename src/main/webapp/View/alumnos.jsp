<%@page import="Model.AlumnoDAO"%>
<%@page import="Model.Alumno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><!-- comment -->
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/5730fa423b.js" crossorigin="anonymous"></script>
   </head>
    
    <body>
        <div class="container">
            <h1 class="text-center mt-5">Listado de Alumnos</h1>
            <div class="row">
                <a class="btn btn-primary col-3 my-3" href="AlumnoController?accion=nuevo"><i class="fas fa-user-plus fa-lg"></i>&NonBreakingSpace; Agregar Alumno</a>
                <table class="table table-primary" >
                    <thead>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Email</th>
                        <th class="text-center">Modificar</th>
                        <th class="text-center">Eliminar</th>
                    </thead>                   
                <%
                List<Alumno> resultado = null;
                AlumnoDAO alumnoDao = new AlumnoDAO();
                resultado = alumnoDao.listarAlumnos();     
                for(int i=0;i<resultado.size();i++){
                    String rutaM="AlumnoController?accion=modificar&id="+resultado.get(i).getId();
                    String rutaE="AlumnoController?accion=eliminar&id="+resultado.get(i).getId();
                %> 
                    <tr>
                        <td><%=resultado.get(i).getId() %></td>
                        <td><%=resultado.get(i).getNombre() %></td>
                        <td><%=resultado.get(i).getApellido() %></td>
                        <td><%=resultado.get(i).getMail() %></td>
                        <td class="text-center"><a class="text-success" href=<%=rutaM %>><i class="fas fa-edit"></i></a></td>
                        <td class="text-center"><a class="text-danger" href=<%=rutaE %>><i class="fas fa-trash"></i></a></td>                    
                    </tr>         
                <%
                    }
                %> 
                </table>          
            </div>     
        </div>
                
    </body>
    
</html>
