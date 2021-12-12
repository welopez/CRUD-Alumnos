<%@page import="Model.AlumnoDAO"%>
<%@page import="Model.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><!-- comment -->
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    </head>
    
    <body>   
        
        <div class="container" >
            <%
                        int alumnoId = Integer.parseInt(request.getParameter("id"));
                        AlumnoDAO aluDao = new AlumnoDAO();
                        Alumno resultado = aluDao.mostrarAlumno(alumnoId);
                    %>
            <h1 class="text-center mt-5" >Modificar Alumno</h1>
            <div class="row" >
                <form class="p-5" method="POST" action="AlumnoController?accion=actualizar">
                    
                    <div class="mb-3">
                        <label for="id" class="form-label" ></label>
                        <input type="hidden" class="form-control" id="id" name="id" value=<%=resultado.getId()%> >                          
                    </div> 
                    <div class="mb-3">
                        <label for="nombre" class="form-label" >Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required value=<%=resultado.getNombre()%> >                          
                    </div> 
                    <div class="mb-3">
                        <label for="apellido" class="form-label" >Apellido</label>
                        <input type="text" class="form-control" id="apellido" name="apellido" required value=<%=resultado.getApellido()%> >                          
                    </div> 
                    <div class="mb-3">
                        <label for="mail" class="form-label" >E-Mail</label>
                        <input type="text" class="form-control" id="mail" name="mail" required value=<%=resultado.getMail()%> >                          
                    </div>
                    
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary col-4 m-1" >Modificar</button>
                        <a class="btn btn-danger col-4 m-1" href="AlumnoController?accion=">Cancelar</a>
                    </div>
                        
                </form>                
            </div>
       </div>
    
    </body>
    
</html>
