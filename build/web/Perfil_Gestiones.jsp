<%@page import="Servicios.Duenio"%>
<%@page import="Servicios.Ganado"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE HTML>
<!--
	Monochromed by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
                <link href="css/bootstrap.min.css" rel="stylesheet">
		<title>Perfil</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
		</noscript>
                
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
	</head>

	<!-- Header -->
		<div id="header">
			<div class="container">
					
				<!-- Logo -->
					<div id="logo">
                                            <h1><a >BULL HUNTER</a></h1>
						<span>Llevando a tu Ganado a la Nube</span>
					</div>
				
				<!-- Nav -->
					<nav id="nav">
						<ul>
                                                   <li><a href="index.jsp">Inicio</a></li>
                                                    <li><a href="QuienesSomos.jsp" >Quienes Somos</a></li>
                                                    <li><a href="Catalogo.jsp">Catalogo</a></li>
                                                    <%  
                                                        
                                                        HttpSession Sesion = request.getSession(false);
                                                        String Tipo =(String) Sesion.getAttribute("TipoUser");
                                                        
                                                        String Acciones =(String) request.getParameter("Acciones");
                                                        ArrayList<Duenio> DatosUsuario = (ArrayList<Duenio>) request.getAttribute("DatosDuenio");
                                                        
                                                        System.err.println("Accion: "+Acciones);
                                                            
                                                        
                                                        if(Tipo==null){
                                                            
                                                     %>
                                                    <li><a href="Inicia_Registrate.jsp">Inicia Sesion</a></li>
                                                    <%
                                                        }
                                                        if(Tipo=="Usuario"){
                                                    %>
                                                    <li><a href="PromocionarGanado.jsp">Vender</a></li>
                                                    <li><a href="Ubicacion.jsp">Ver ubicacion de ganado</a></li>
                                                    <li class="active"><a href="Perfil.jsp">Perfil</a></li>
                                                    <li><a href="CerrarSesion">Cerrar Sesion</a></li>
                                                    <%
                                                    }
                                                    
                                                       else if(Tipo=="Administrador"){
                                                                
                                                                
                                                     %>  
                                                    <li><a href="Perfil_Gestiones.jsp">Perfil y Gestiones</a></li>
                                                    <li><a href="CerrarSesion">Cerrar Seseion</a></li>
                                                    <%
                                                        }
                                                    %>

                                                    
                                                       
						</ul>
					</nav>

			</div>
		</div>
	<!-- Header -->
			
	<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row">

					<!-- Sidebar -->
						<div id="sidebar" class="4u">
							<section>
                                                            <header>
                                                                    <h2>Perfil</h2>
                                                                    <span class="byline">Aministrador</span>
                                                            </header>
                                                            <h2>Mi Información</h2>
                                                            <p>Nombre: <a><% out.print(Sesion.getAttribute("Nombre")); %></a></p>
                                                            <p>Apellidos: <a><% out.print(Sesion.getAttribute("Apellidos")); %></a></p>
                                                            <p>Usuario: <a><% out.print(Sesion.getAttribute("NombreUser")); %></a></p>
                                                            
                                                            
                                                                
                                                            <br>
                                                            <button class="btn btn-success" onclick="Actualizar()">Actualizar Informacion</button>
                                                            <br>
                                                            <br>
                                                            <button class="btn btn-success" onclick="RegistrarUsuarios()">Registrar Usuario</button>
                                                            <br>
                                                            <br>
                                                            <button class="btn btn-success" onclick="ConsultarUsuarios()">ConsultarUsuarios</button>
                                                            <br>
                                                            <br>
                                                            
                                                            <form action="GenerarReportesAdmin">
                                                                <p>Selecciona el reporte a generar</p>
                                                                <select class="form-control" name="Reporte" required>
                                                                    <optgroup>
                                                                        <option value="ReporteUsuarios">Usuarios Registrados</option>
                                                                        <option value="ReporteAdmnistradores">Administradores</option> 
                                                                    </optgroup>
                                                                </select>
                                                                <div class="form-group">
                                                                        
                                                                    <input type="hidden"  value="<% out.print(Sesion.getAttribute("IdUsuario")); %>" name="IdDuenio" class="form-control">
                                                                </div>
                                                                <br>
                                                                <button class="btn btn-success">Generar Reporte</button>
                                                            </form>
                                                            
							</section>
                                                            
						</div>
					<!-- Sidebar -->
                                       
                                        <%
                                            try{
                                                if(Acciones==null){
                                        %>
                                        <div id="content" class="8u skel-cell-important">
							<section>
								<header>
                                                                    <center>
                                                                        <h2>Acciones</h2>
                                                                        
                                                                        <%
                                                                            if(request.getAttribute("Resultado")!=null){    
                                                                        %>
                                                                        <span class="byline"><% out.print(request.getAttribute("Resultado")); %></span>
                                                                        <%
                                                                            }
                                                                        %>
                                                                    </center> 
								</header>
								<p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                                                        </section>
                                        </div>
                                                        
                                        <%
                                        }
                                        
                                            if(Acciones.equals("Actualizar")){
                                        
                                        %>                       
						
					<!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header>
                                                                    <center>
                                                                        <h2>Modificar</h2>
                                                                        <span class="byline">Información</span>
                                                                    </center> 
								</header>
								<p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                                    
                                                                <form action="ActualizarAdmin">
                                                                    <div class="form-group">
                                                                        <p>Nombre</p>
                                                                        <input type="text" value="<% out.print(Sesion.getAttribute("Nombre")); %>" name="Nombre" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Apellidos</p>
                                                                        <input type="text" value="<% out.print(Sesion.getAttribute("Apellidos")); %>" name="Apellidos" class="form-control">
                                                                    </div>
                                                                    
                                                                    <div class="form-group">
                                                                        <p>Nombre de Usuario</p>
                                                                        <input type="text" value="<% out.print(Sesion.getAttribute("NombreUser")); %>" name="Usuario" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Contraseña</p>
                                                                        <input type="password" value="<% out.print(Sesion.getAttribute("Contrasenia")); %>" name="Contrasenia" class="form-control">
                                                                    </div>
                                                                    
                                                                    <div class="form-group">
                                                                        
                                                                        <input type="hidden"  value="<% out.print(Sesion.getAttribute("IdAdmin")); %>" name="IdAdmin" class="form-control">
                                                                    </div>
                                                                     <div class="form-group">
                                                                        
                                                                         <button class="btn btn-success">Actualizar</button>
                                                                    </div>
                                                                    
                                                                </form>
							</section>
						</div>
                                                 
					<!-- /Content -->
                                        <%
                                        }
                                        if(Acciones.equals("RegistrarUsuarios")){
                                        %>
                                        <!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header>
                                                                    <center>
                                                                        <h2>Registrar Usuarios</h2>
                                                                        <span class="byline">Alta</span>
                                                                    </center> 
								</header>
								<p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                                    
                                                                <form action="RegistrarUsuarios">
                                                                    <div class="form-group">
                                                                        <p>Nombre</p>
                                                                        <input type="text" placeholder="Nombre(s)" name="Nombre" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Apellidos</p>
                                                                        <input type="text" placeholder="Apellidos" name="Apellidos" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Dirección</p>
                                                                        <input type="text" placeholder="Direccion" name="Direccion" class="form-control">
                                                                    </div>  
                                                                    
                                                                    <div class="form-group">
                                                                        <p>Telefono</p>
                                                                        <input type="text" placeholder="Telefono" name="Telefono" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Nombre de Usuario</p>
                                                                        <input type="text" placeholder="Nombre Usuario" name="NombreUser" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Contraseña</p>
                                                                        <input type="password" placeholder="Contraseña" name="Contrasenia" class="form-control">
                                                                    </div>
                                                                    
                                                                    <div class="form-group">
                                                                        
                                                                        <button class="btn btn-success">Registrar Usuario</button>
                                                                    </div>
                                                                    
                                                                </form>
							</section>
						</div>
					<!-- /Content -->
                                        <%
                                        }

                                        if(Acciones.equals("Consultar")){
                                        %>
                                        <!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header>
                                                                    <center>
                                                                        <h2>Usuarios Registrados</h2>
                                                                        <span class="byline">Tabla</span>
                                                                    </center> 
								</header>
                                                            
								<p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                                    
                                                                <table class="table table-striped" >
                                                                    <thead>
                                                                    <h2 class="text-center">Lista de Usuarios Registrados</h2>
                                                                    </thead>
                                                                    <!--<div class="col-xs-6 col-sm-6 col-md-6 col-xl-6"class="col-xs-6 col-sm-6 col-md-6 col-xl-6">
                                                                    <form role="form" action="ListaPersonas" >
                                                                        <div class="form-group">
                                                                            <label>Busqueda de Personas:</label>
                                                                            <input type="text" placeholder="Buscar por nombre o apellidos" name="nombre" id="nombre" class="form-control">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <button class="btn bg-info">Buscar</button>
                                                                        </div>

                                                                    </form>
                                                                    </div>-->
                                                                    

                                                                    <thead>
                                                                    <th>Num</th>
                                                                    <th>Nombre</th>
                                                                    <th>Apellidos</th>
                                                                    <th>Direccion</th>
                                                                    <th>Telefono</th>
                                                                    <th>Nombre de Usuario</th>
                                                                    <th>Estado</th>
                                                                    <th>Editar</th>
                                                                    <th>Eliminar</th>
                                                                    
                                                                    </thead>
                                                                    <%    
                                                                    //ArrayList<Ganado> DatosGanado =(ArrayList<Ganado>) request.getAttribute("DatosGanado");


                                                                    for(int i=0; i<DatosUsuario.size();i++){
                                                                        out.println("<tr>");    
                                                                        out.println("<td> "+(i+1)+"</td>");
                                                                        out.println("<td > "+DatosUsuario.get(i).getNombre()+"</td>");
                                                                        out.println("<td>"+DatosUsuario.get(i).getApellidos()+"</td>");
                                                                        out.println("<td>"+DatosUsuario.get(i).getDirecion()+"</td>");
                                                                        out.println("<td>"+DatosUsuario.get(i).getTelefono()+"</td>");
                                                                        out.println("<td>"+DatosUsuario.get(i).getNombreUser()+"</td>");
                                                                        out.println("<td>"+DatosUsuario.get(i).getEstado()+"</td>");
                                                                        

                                                                        out.println("<td><a href='Perfil_Gestiones.jsp?IdDuenio="+DatosUsuario.get(i).getId()+"&Nombre="+
                                                                                DatosUsuario.get(i).getNombre()+"&Apellidos="+DatosUsuario.get(i).getApellidos()+"&Direccion="+DatosUsuario.get(i).getDirecion()+
                                                                                "&Telefono="+DatosUsuario.get(i).getTelefono()+"&NombreUser="+DatosUsuario.get(i).getNombreUser()+"&Contrasenia="+DatosUsuario.get(i).getContrasenia()+"&Acciones=EditarUsuario'>Editar</a></td>");
                                                                        out.println("<td><a href='EliminarUsuario?IdDuenio="+DatosUsuario.get(i).getId()+"'>Eliminar</a></td>");
                                                                        out.println("<tr>");    
                                                                           }
                                                                    %>
                                                                </table>
							</section>
						</div>
					<!-- /Content -->
                                        <%
                                        }
                                        if(Acciones.equals("EditarUsuario")){
                                        %>
                                        <!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header>
                                                                    <center>
                                                                        <h2>Actualizar Usuario</h2>
                                                                        <span class="byline">Modificar</span>
                                                                    </center> 
								</header>
								<p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                                    
                                                                <form action="ActualizarUsuario">
                                                                    <div class="form-group">
                                                                        <p>Nombre</p>
                                                                        <input type="text" value="<%out.print(request.getParameter("Nombre")); %>" name="Nombre" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Apellidos</p>
                                                                        <input type="text" value="<%out.print(request.getParameter("Apellidos")); %>" name="Apellidos" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Dirección</p>
                                                                        <input type="text" value="<%out.print(request.getParameter("Direccion")); %>" name="Direccion" class="form-control">
                                                                    </div>
                                                                    
                                                                    <div class="form-group">
                                                                        <p>Telefono</p>
                                                                        <input type="text"  value="<%out.print(request.getParameter("Telefono")); %>" name="Telefono" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Nombre de Usuario</p>
                                                                        <input type="text" value="<%out.print(request.getParameter("NombreUser")); %>" name="NombreUser" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Contraseña</p>
                                                                        <input type="password"  value="<%out.print(request.getParameter("Contrasenia")); %>" name="Contrasenia" class="form-control">
                                                                    </div>
                                                                   
                                                                    <div class="form-group">
                                                
                                                                        <input type="hidden"  value="<% out.print(request.getParameter("IdDuenio")); %>" name="IdDuenio" class="form-control">                                                                    
                                                                    </div>
                                                                    
                                                                    <div class="form-group">
                                                                        
                                                                        <button class="btn btn-success">Actualizar</button>
                                                                    </div>
                                                                    
                                                                </form>
							</section>
						</div>
					<!-- /Content -->
                                        
                                        
					<%
                                            }
                                        }
                                        catch(Exception ex){
                                            System.err.println("Error en Perfil: "+ex.toString());
                                        }
                                        %>	
				</div>
			
			</div>
		</div>
	<!-- Main -->

        <%@include 
            file="PiePag.jsp"
            %>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            function Actualizar(){
                location.href="Perfil_Gestiones.jsp?Acciones=Actualizar";
            }
            function RegistrarUsuarios(){
                location.href="Perfil_Gestiones.jsp?Acciones=RegistrarUsuarios";
            }
            function ConsultarUsuarios(){
                location.href="ConsultarUsuarios";
            }
        
            
            
        </script>
	</body>
</html>