<%-- 
    Document   : bienvenida
    Created on : 28/10/2022, 11:24:02 PM
    Author     : Jonathan
--%>
<%@page import="dto.Productos"%>
<%@page import="dto.Usuario"%>
<%@page import="dao.impl.DaoProductosImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- bienvenida CSS -->
        <link href="css/bienvenida.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%

            HttpSession sesion = request.getSession();
            Usuario usu = (Usuario) sesion.getAttribute("user");//se guarda el login
            if (usu != null) {//si se logueo bien ingresa
                if (!usu.getNombrerol().equalsIgnoreCase("Paciente")) { //si el admin quiere ir al index no lo dejará hasta que cierre Sesión
                    request.getRequestDispatcher("administrador.jsp").forward(request, response);

                }
            }
        %>
        <div class="container-fluid">
            <!--Menu-->
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">
                    <a style="color:#44469D; font-weight: bold"  class="navbar-brand " href="principal.jsp">CitaMed Online</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a style="color:#44469D; font-weight: bold" class="nav-link textomenu" aria-current="page" href="#">SERVICIOS</a>
                            </li>
                            <li class="nav-item">
                                <a style="color:#44469D; font-weight: bold" class="nav-link textomenu" href="#">CONVENIOS</a>
                            </li>
                            <li class="nav-item">
                                <a style="color:#44469D; font-weight: bold" class="nav-link textomenu" href="#">PROMOCIONES</a>
                            </li>
                            <li class="nav-item">
                                <a style="color:#44469D; font-weight: bold" class="nav-link textomenu">SEDES</a>
                            </li>
                            <li class="nav-item">
                                <a style="color:#44469D; font-weight: bold" class="nav-link textomenu">RESULTADOS COVID 19</a>
                            </li>
                            <!--Dropdown-->
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a style="color:#44469D; font-weight: bold;border: 1px solid;border-radius: 10px" class="nav-link dropdown-toggle textomenu" href="#" id="navbarDropdownMenuLink"
                                       role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="fa fa-user"></i>   ${user.getNombre()} ${user.getApellido()}
                                    </a>
                                    <ul style="top: 32px;right: 30px;" class="dropdown-menu dropdown-menu-end text-center bg-light text-Dark"
                                        aria-labelledby="navbarDropdownMenuLink">
                                        <li><a style="color: black !important;" class="dropdown-item text-Dark" href="UsuarioLoginServlet?accion=verHistorial">Historial de Citas</a></li>
                                        <li><a style="color: black !important;" class="dropdown-item text-Dark" href="UsuarioLoginServlet?accion=salir">Salir</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </ul>
                    </div>
                </div>
            </nav>
            <!--Body-->
            <div style="text-align: center;" class="row color-gris">
                <div style="display: flex;flex-direction: column;align-items: center; justify-content: center; background: #5AC5C3" class="col-md-6">
                    <span style="font-size: 60px; color: #FFF;font-weight: bold;">Hola Jonathan!</span><br>
                    <span style="font-size: 40px; color: #FFF;font-weight: bold;">Tenemos estas opciones para ti!</span><br>
                    <div class="btnatencion" style="margin-top: 40px;background: #fff;border-radius: 50px;width: 250px;padding: 10px 0px;">
                        <a class="text-decoration-none" href="seleccionarCita.jsp">
                            <img style="width: 100px;" src="img/icon-doctor.svg" /><br>
                            <span  style="color: #5AC5C3;font-weight: bold">Atenciones precensiales</span>
                        </a>
                    </div>
                </div>
                <div class="col-md-6">
                    <img style="width: 59%" src="img/dra2.png" />

                </div>

            </div>

        </div>
                                    
    </body>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="jquery/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="jquery/popper.min.js" type="text/javascript"></script>
    <!--Fontawesome-->
    <script src="https://kit.fontawesome.com/27f204c8a9.js" crossorigin="anonymous"></script>
</html>
