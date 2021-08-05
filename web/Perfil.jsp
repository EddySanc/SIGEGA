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
                                                        ArrayList<Ganado> DatosGanado = (ArrayList<Ganado>) request.getAttribute("DatosGanado");
                                                        
                                                        System.err.println("Accion: "+Acciones);
                                                            
                                                        
                                                        if(Tipo==null){
                                                            
                                                     %>
                                                    <li><a href="Inicia_Registrate.jsp">Inicia Sesion</a></li>
                                                    <%
                                                        }
                                                        if(Tipo=="Usuario"){
                                                    %>
                                                    <li><a href="PromocionarGanado.jsp">Vender</a></li>
                                                    <li><a href="Ubicacion.jsp">Ubicacion de ganado</a></li>
                                                    <li class="active"><a href="Perfil.jsp">Perfil</a></li>
                                                    <li><a href="CerrarSesion">Cerrar Sesion</a></li>
                                                    <%
                                                    }
                                                    
                                                       else if(Tipo=="Administrador"){
                                                                
                                                                
                                                     %>  
                                                    <li><a href="Perfil_Gestiones.jsp">Perfil y Gestiones</a></li>
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
                                                                    <span class="byline">Bienvenido</span>
                                                            </header>
                                                            <h2>Mi Información</h2>
                                                            <p>Nombre: <a><% out.print(Sesion.getAttribute("Nombre")); %></a></p>
                                                            <p>Apellidos: <a><% out.print(Sesion.getAttribute("Apellidos")); %></a></p>
                                                            <p>Direccion: <a><% out.print(Sesion.getAttribute("Direccion")); %></a></p>
                                                            <p>Telefono: <a><% out.print(Sesion.getAttribute("Telefono")); %></a></p>
                                                            <p>Nombre de Usuario: <a><% out.print(Sesion.getAttribute("NombreUser")); %></a></p>
                                                            
                                                                
                                                            <br>
                                                            <button class="btn btn-success" onclick="Actualizar()">Actualizar Informacion</button>
                                                            <br>
                                                            <br>
                                                            <button class="btn btn-success" onclick="RegistrarGanado()">Registrar Ganado</button>
                                                            <br>
                                                            <br>
                                                            <form action="ConsultarGanado">
                                                                    <div class="form-group">
                                                                        
                                                                        <input type="hidden"  value="<% out.print(Sesion.getAttribute("IdUsuario")); %>" name="IdDuenio" class="form-control">
                                                                    </div>
                                                            <button class="btn btn-success">Mis Ganados</button>    
                                                            </form>                       
                                                            <br>
                                                            <br>
                                                            <button class="btn btn-success" onclick="RegistrarMedicamentos()">Registrar Medicamentos</button>
                                                            <br>
                                                            <br>
                                                            <form action="GenerarReporte">
                                                                <p>Selecciona el reporte a generar</p>
                                                                <select class="form-control" name="Reporte" required>
                                                                    <optgroup>
                                                                        <option value="ReporteGanados">Ganados Registrados</option>
                                                                        <option value="ReporteVentas">Ventas Realizadas</option> 
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
                                    
                                                                <form action="ActualizarUser">
                                                                    <div class="form-group">
                                                                        <p>Nombre</p>
                                                                        <input type="text" value="<% out.print(Sesion.getAttribute("Nombre")); %>" name="Nombre" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Apellidos</p>
                                                                        <input type="text" value="<% out.print(Sesion.getAttribute("Apellidos")); %>" name="Apellidos" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Dirección</p>
                                                                        <input type="text" value="<% out.print(Sesion.getAttribute("Direccion")); %>" name="Direccion" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Telefono</p>
                                                                        <input type="text" value="<% out.print(Sesion.getAttribute("Telefono")); %>" name="Telefono" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Nombre de Usuario</p>
                                                                        <input type="text" value="<% out.print(Sesion.getAttribute("NombreUser")); %>" name="NombreUser" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Contraseña</p>
                                                                        <input type="password" value="<% out.print(Sesion.getAttribute("Contrasenia")); %>" name="Contrasenia" class="form-control">
                                                                    </div>
                                                                    
                                                                    <div class="form-group">
                                                                        
                                                                        <input type="hidden"  value="<% out.print(Sesion.getAttribute("IdUsuario")); %>" name="IdDuenio" class="form-control">
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
                                        if(Acciones.equals("RegistrarGanado")){
                                        %>
                                        <!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header>
                                                                    <center>
                                                                        <h2>Registrar Ganado</h2>
                                                                        <span class="byline">Alta</span>
                                                                    </center> 
								</header>
								<p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                                    
                                                                <form action="RegistrarGanado">
                                                                    <div class="form-group">
                                                                        <p>Número de registro</p>
                                                                        <input type="text" placeholder="Consta de cuatro dígitos" name="NumRegistro" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Nombre</p>
                                                                        <input type="text" placeholder="Nombre ganado" name="NombreGanado" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Raza</p>
                                                                        <input type="text" placeholder="Raza" name="Raza" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Sexo</p>
                                                                        <select class="form-control" name="Sexo" required>
                                                                            <optgroup>
                                                                                <option value="Macho">Macho</option>
                                                                                <option value="Hembra">Hembra</option> 
                                                                            </optgroup>
                                                                        </select>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Edad</p>
                                                                        <input type="number" placeholder="Edad aproximada" name="EdadAprox" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Peso</p>
                                                                        <input type="number" placeholder="Peso aproximado" name="PesoAprox" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Ubicación</p>
                                                                        <input type="text" placeholder="Ejem: Racho las Piedras, Rayon, Chiapas " name="UbicacionGanado" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                
                                                                        <input type="hidden"  value="<% out.print(Sesion.getAttribute("IdUsuario")); %>" name="Duenio" class="form-control">                                                                    
                                                                    </div>
                                                                    
                                                                    <div class="form-group">
                                                                        
                                                                        <button class="btn btn-success">Registrar Ganado</button>
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
                                                                        <h2>Ganado Registrado</h2>
                                                                        <span class="byline">Tabla</span>
                                                                    </center> 
								</header>
                                                            
								<p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                                    
                                                                <table class="table table-striped" >
                                                                    <thead>
                                                                    <h2 class="text-center">Lista de Ganados Registrados</h2>
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
                                                                    <th>Num Registro</th>
                                                                    <th>Nombre</th>
                                                                    <th>Raza</th>
                                                                    <th>Sexo</th>
                                                                    <th>Edad</th>
                                                                    <th>Peso</th>
                                                                    <th>Estado</th>
                                                                    <th>Ubicacion</th>
                                                                    <th>Editar</th>
                                                                    <th>Eliminar</th>
                                                                    </thead>
                                                                    <%    
                                                                    //ArrayList<Ganado> DatosGanado =(ArrayList<Ganado>) request.getAttribute("DatosGanado");


                                                                    for(int i=0; i<DatosGanado.size();i++){
                                                                        out.println("<tr>");    
                                                                        out.println("<td> "+(i+1)+"</td>");
                                                                        out.println("<td > "+DatosGanado.get(i).getNumRegistro()+"</td>");
                                                                        out.println("<td>"+DatosGanado.get(i).getNombre()+"</td>");
                                                                        out.println("<td>"+DatosGanado.get(i).getRaza()+"</td>");
                                                                        out.println("<td>"+DatosGanado.get(i).getSexo()+"</td>");
                                                                        out.println("<td>"+DatosGanado.get(i).getEdadAprox()+"</td>");
                                                                        out.println("<td>"+DatosGanado.get(i).getPesoAprox()+"</td>");
                                                                        out.println("<td>"+DatosGanado.get(i).getEstado()+"</td>");
                                                                        out.println("<td>"+DatosGanado.get(i).getUbicacionGanado()+"</td>");

                                                                        out.println("<td><a href='Perfil.jsp?IdGanado="+DatosGanado.get(i).getIdGanado()+"&NumRegistro="+
                                                                                DatosGanado.get(i).getNumRegistro()+"&Nombre="+DatosGanado.get(i).getNombre()+"&Raza="+DatosGanado.get(i).getRaza()+
                                                                                "&Sexo="+DatosGanado.get(i).getSexo()+"&EdadAprox="+DatosGanado.get(i).getEdadAprox()+"&PesoAprox="+DatosGanado.get(i).getPesoAprox()+""
                                                                                        + "&Estado="+DatosGanado.get(i).getEstado()+"&UbicacionGanado="+DatosGanado.get(i).getUbicacionGanado()+"&Duenio="+DatosGanado.get(i).getDuenio()+"&Acciones=EditarGanado'>Editar</a></td>");
                                                                        out.println("<td><a href='EliminarGanado?IdGanado="+DatosGanado.get(i).getIdGanado()+"&IdDuenio="+DatosGanado.get(0).getDuenio()+"'>Eliminar</a></td>");
                                                                        out.println("<tr>");    
                                                                           }
                                                                    %>
                                                                </table>
							</section>
						</div>
					<!-- /Content -->
                                        <%
                                        }
                                        if(Acciones.equals("EditarGanado")){
                                        %>
                                        <!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header>
                                                                    <center>
                                                                        <h2>Actualizar Ganado</h2>
                                                                        <span class="byline">Modificar</span>
                                                                    </center> 
								</header>
								<p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                                    
                                                                <form action="ActualizarGanado">
                                                                    <div class="form-group">
                                                                        <p>Número de registro</p>
                                                                        <input type="text" value="<%out.print(request.getParameter("NumRegistro")); %>" name="NumRegistro" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Nombre</p>
                                                                        <input type="text" value="<%out.print(request.getParameter("Nombre")); %>" name="NombreGanado" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Raza</p>
                                                                        <input type="text" value="<%out.print(request.getParameter("Raza")); %>" name="Raza" class="form-control">
                                                                    </div>
                                                                    <%
                                                                        if(request.getParameter("Sexo").equals("Macho")){
                                                                    %>
                                                                    <div class="form-group">
                                                                        <p>Sexo</p>
                                                                        <select class="form-control" name="Sexo" required>
                                                                            <optgroup>
                                                                                <option value="Macho">Macho</option>
                                                                                <option value="Hembra">Hembra</option> 
                                                                            </optgroup>
                                                                        </select>
                                                                    </div>
                                                                    <%
                                                                        }
                                                                        else{
                                                                    %>
                                                                    <div class="form-group">
                                                                        <p>Sexo</p>
                                                                        <select class="form-control" name="Sexo" required>
                                                                            <optgroup>
                                                                               
                                                                                <option value="Hembra">Hembra</option> 
                                                                                <option value="Macho">Macho</option>
                                                                                
                                                                            </optgroup>
                                                                        </select>
                                                                    </div>
                                                                    <%
                                                                    }
                                                                    %>
                                                                    <div class="form-group">
                                                                        <p>Edad</p>
                                                                        <input type="number"  value="<%out.print(request.getParameter("EdadAprox")); %>" name="EdadAprox" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Peso</p>
                                                                        <input type="number" value="<%out.print(request.getParameter("PesoAprox")); %>" name="PesoAprox" class="form-control">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <p>Ubicación</p>
                                                                        <input type="text" value="<%out.print(request.getParameter("UbicacionGanado")); %>" name="UbicacionGanado" class="form-control">
                                                                    </div>
                                                                    
                                                                    <div class="form-group">
                                                
                                                                        <input type="hidden"  value="<% out.print(request.getParameter("IdGanado")); %>" name="IdGanado" class="form-control">                                                                    
                                                                    </div>
                                                                    <div class="form-group">
                                                
                                                                        <input type="hidden"  value="<% out.print(request.getParameter("Duenio")); %>" name="Duenio" class="form-control">                                                                    
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

	<!-- Footer -->
		<div id="footer">
			<div class="container">
				<div class="row">
					<div class="3u">
						<section>
							<ul class="style1">
								<li><img src="images/pics05.jpg" width="78" height="78" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
									<p class="posted">August 11, 2014  |  (10 )  Comments</p>
								</li>
								<li><img src="images/pics06.jpg" width="78" height="78" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
									<p class="posted">August 11, 2014  |  (10 )  Comments</p>
								</li>
								<li><img src="images/pics07.jpg" width="78" height="78" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
									<p class="posted">August 11, 2014  |  (10 )  Comments</p>
								</li>
							</ul>
						</section>
					</div>
					<div class="3u">
						<section>
							<ul class="style1">
								<li class="first"><img src="images/pics08.jpg" width="78" height="78" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
									<p class="posted">August 11, 2014  |  (10 )  Comments</p>
								</li>
								<li><img src="images/pics09.jpg" width="78" height="78" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
									<p class="posted">August 11, 2014  |  (10 )  Comments</p>
								</li>
								<li><img src="images/pics10.jpg" width="78" height="78" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
									<p class="posted">August 11, 2014  |  (10 )  Comments</p>
								</li>
							</ul>
						</section>				
					</div>
					<div class="6u">
						<section>
							<header>
								<h2>Aenean elementum</h2>
							</header>
							<p>In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat. Pellentesque tristique ante ut risus. Quisque dictum. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus.</p>
							<ul class="default">
								<li><a href="#">Pellentesque quis lectus gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum consectetuer adipiscing elit.</a></li>
								<li><a href="#">Phasellus nec nibh pellentesque congue.</a></li>
								<li><a href="#">Cras aliquam risus pellentesque pharetra.</a></li>
								<li><a href="#">Duis non metus commodo euismod lobortis.</a></li>
								<li><a href="#">Lorem ipsum dolor adipiscing elit.</a></li>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>
	<!-- Footer -->

	<!-- Copyright -->
		<div id="copyright">
			<div class="container">
				Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
			</div>
		</div>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            function Actualizar(){
                location.href="Perfil.jsp?Acciones=Actualizar";
            }
            function RegistrarGanado(){
                location.href="Perfil.jsp?Acciones=RegistrarGanado";
            }
            
            function RegistrarMedicamentos(){
                location.href="Perfil.jsp?Acciones=RegistrarMedicamentos";
            }
            
            
        </script>
	</body>
</html>