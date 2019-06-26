<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.naming.InitialContext"%>
<%@page import="cl.aduana.controller.Controller"%>
<%@page import="cl.aduana.model.ServicioLocal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%! ServicioLocal servicio; %>
	<%
		InitialContext ctx = new InitialContext();
		servicio = (ServicioLocal) ctx.lookup("java:global/proyectoJPA_EJB/Servicio!cl.aduana.model.ServicioLocal");
	%>
	<c:set var="servicio" scope="page" value="<%=servicio%>"/>

  <!DOCTYPE html>
  <html>
    <head>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body class="blue">
    
      <div class="row">
      	<div class="col s6 offest-s3">
      		<div class="card-panel z-depth-5">
				<p class="center-align">Categorias</p>
				<form action="control.do" method="post">
					<div class="row">
						<div class="input-field">
							<i class="material-icons prefix">account_circle</i> <input
								id="nombre" name="nombre" type="text"> <label
								for="nombre">Nombre</label>
						</div>
						<div class="input-field">
							<i class="material-icons prefix">group</i> <input
								id="apellido" name="apellido" type="text"> <label
								for="apellido">Descripción</label>
						</div>
						<div class="input-field">
							<i class="material-icons prefix">account_circle</i> <input
								id="rut" name="rut" type="text"> <label
								for="rut">Estado</label>
						</div>
						<button name="boton" value="insertar" type="submit" class="btn right">
							Insertar
						</button>
					</div>
					<br><br>
				</form>

				<table class="bordered highlight">
      				<tr>
      					<th>Nombre</th>
      					<th>Descripción</th>
      					<th>Estado</th>
      					<th></th>
      					<th></th>
      				</tr>
      				<c:forEach items="${servicio.categorias}" var="c">
      					<tr>
	      					<td>${c.nombre}</td>
	      					<td>${c.descripcion}</td>
	      					<td>${c.estado}</td>
	      					<td>
	      						<a href="" class="btn-floating blue">
	      							<i class="material-icons">mode_edit</i>
	      						</a>
	      					</td>
	      					<td>
	      						<a href="" class="btn-floating red">
	      							<i class="material-icons">delete</i>
	      						</a>
	      					</td>
      					</tr>
      				</c:forEach>
      			</table>
      		</div>
      	</div>
      </div>
    
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
  </html>
        