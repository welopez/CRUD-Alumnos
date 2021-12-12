<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo</title>
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"><!-- comment -->
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   
    </head>
    
    <body>
        
        <div class="container" >
            <h1 class="text-center mt-5" >Añadir Alumno</h1>
            <div class="row" >
                <form class="p-5" method="POST" action="AlumnoController?accion=insert">
                    <div class="mb-3">
                        <label for="nombre" class="form-label" >Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>                          
                    </div> 
                    <div class="mb-3">
                        <label for="apellido" class="form-label" >Apellido</label>
                        <input type="text" class="form-control" id="apellido" name="apellido" required>                          
                    </div> 
                    <div class="mb-3">
                        <label for="mail" class="form-label" >E-Mail</label>
                        <input type="email" class="form-control" id="mail" name="mail" required>                       
                    </div>                         
                    
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary col-4 m-1" >Añadir</button>
                        <a class="btn btn-danger col-4 m-1" href="AlumnoController?accion=">Cancelar</a>
                    </div>
                        
                </form>                
            </div>     
        </div>
        
    </body>
    
</html>
