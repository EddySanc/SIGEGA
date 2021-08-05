<!DOCTYPE HTML>
<!--
	Monochromed by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
                <link href="css/bootstrap.min.css" rel="stylesheet">
		<title>Monochromed by TEMPLATED</title>
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
                                                        
                                                        if(Tipo==null){
                                                       
                                                     %>
                                                    <li><a href="Inicia_Registrate.jsp">Inicia Sesion</a></li>
                                                    <%
                                                        }
                                                        if(Tipo=="Usuario"){
                                                    %>
                                                    <li><a href="PromocionarGanado.jsp">Vender</a></li>
                                                    <li class="active"><a href="Ubicacion.jsp">Ubicacion de ganado</a></li>
                                                    <li><a href="Perfil.jsp">Perfil</a></li>
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
									<h2>Inicia Sesion</h2>
									<span class="byline">Con tu cuenta</span>
								</header>
                                                            <form action="ServletLogin">
                                                               
                                                                <div class="group-form" >
                                                                    <label>Usuario</label> 
                                                                    <input type="text" placeholder="Usuario" name="NombreUsuario" class="form-control">
                                                                </div>
                                                                <div class="group-form" >
                                                                    <label>Contraseña</label>
                                                                    <input type="password" placeholder="Contraseña" name="Contrasenia"  class="form-control">
                                                                </div>
                                                                <br>
                                                                <%
                                                                    if(request.getAttribute("Respuesta")!=null){
                                                                    
                                                                %>
                                                                <a><% out.print(request.getAttribute("Respuesta"));} %></a>
                                                                <div class="group-form">
                                                                    <center>
                                                                        <button class="btn btn-primary" id="iniciarsesion">Entrar</button>
                                                                    </center>
                                                                    
                                                                </div>
                                                                
                                                            </form>
                                                            
                                                            
                                                          
							</section>
						</div>
					<!-- Sidebar -->
				
					<!-- Content -->
						<div id="content" class="8u skel-cell-important">
							<section>
								<header>
									<h2>Aun sin cuenta . . .</h2>
									<span class="byline">Sigue estos sencillos pasos para obtener una cuenta gratuitamente</span>
								</header>
								<p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                                                                <h2>Realiza una de las siguientes opciones</h2>
                                                                <p>1.- Realiza una llamada telefonica al número <a>9196863457</a>, nuestro personal con gusto le atenderá¡. Es importante tener a la mano la siguiente información: </p>
                                                                <ul>
                                                                    <li>-Correo electronico</li>
                                                                    <li>-Domicilio</li>
                                                                    <li>-Nombre completo</li>
                                                                </ul>
                                                                <p>2.- Mandanos un correo electronico al la siguiente dirección <a>sigegachiapas@sigega.com</a>, con la información mencionada anteriormente</p>
                                                                <form action="#" class="form-group">
                                                                    <p>Dejanos un mensaje con la información requerida, pronto nos comunicaremos. </p>
                                                                    <p>Ejem. <a>Carlos Roberto Castillo Rivera. Calle Tercera oriente norte, Rayón, Chiapas. carlosriv@hotmail.com</a></p>
                                                                    <input type="text" class="form-control">
                                                                </form>
							</section>
						</div>
					<!-- /Content -->
						
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
	</body>
</html>