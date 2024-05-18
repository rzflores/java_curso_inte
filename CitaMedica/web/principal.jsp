<%-- 
    Document   : principal
    Created on : 28/10/2022, 07:45:46 PM
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
        <!--css personal-->
        <link href="css/principal.css" rel="stylesheet" type="text/css"/>
        <link href="css/btnRedes.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%

            HttpSession sesion = request.getSession();
            Usuario usu = (Usuario) sesion.getAttribute("user");//se guarda el login
            if (usu != null) {//si se logueo bien ingresa
                if (!usu.getNombrerol().equalsIgnoreCase("Cliente")) { //si el admin quiere ir al index no lo dejará hasta que cierre Sesión
                    request.getRequestDispatcher("administrador.jsp").forward(request, response);

                }
            }
        %>
        <div class="container">
            <!--Banner-->
            <div  class="bgblanco">
                <div class="row justify-content-between">
                    <div class="col-md-6 justify-content-start">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="row">
                                    <div style="text-align: end;padding-right: 0;" class="col-md-3">
                                        <i style="padding: 10px;background: #5AC5C3;color: #fff; border-radius: 50%;" class="fa fa-phone"></i>
                                    </div>
                                    <div style="text-align: start;" class="col-md-9">
                                        Central de citas
                                        (+51) 987654321
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div style="text-align: end;padding-right: 0;" class="col-md-3">
                                        <i style="padding: 10px;background: #5AC5C3;color: #fff; border-radius: 50%;" class="fa fa-truck"></i>
                                    </div>
                                    <div class="col-md-9">
                                        Ambulancia<br>
                                        (+51) 987654321
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div style="text-align: end;padding-right: 0;" class="col-md-3">
                                        <i style="padding: 10px;background: #5AC5C3;color: #fff; border-radius: 50%;" class="fa fa-phone"></i>
                                    </div>
                                    <div class="col-md-9">
                                        Central telefonica
                                        (+51) 987654321
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 justify-content-end">
                        <div class="row">
                            <div class="col-md-3"><i style="padding: 10px 12px;background: #5AC5C3;color: #fff; border-radius: 50%;" class="fa fa-facebook-f"></i></div>
                            <div class="col-md-3"><i style="padding: 10px;background: #5AC5C3;color: #fff; border-radius: 50%;" class="fa fa-youtube"></i></div>
                            <div class="col-md-3"><i style="padding: 10px;background: #5AC5C3;color: #fff; border-radius: 50%;" class="fa fa-instagram"></i></div>
                            <div class="col-md-3"><i style="padding: 10px;background: #5AC5C3;color: #fff; border-radius: 50%;" class="fa fa-linkedin"></i></div>
                        </div>
                    </div>

                </div>

            </div>
            <!--Menu-->
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">
                    <a style="color:#44469D; font-weight: bold"  class="navbar-brand " href="#">CitaMed Online</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a style="color:#44469D; font-weight: bold" class="nav-link" aria-current="page" href="#">SERVICIOS</a>
                            </li>
                            <li class="nav-item">
                                <a style="color:#44469D; font-weight: bold" class="nav-link" href="#">CONVENIOS</a>
                            </li>
                            <li class="nav-item">
                                <a style="color:#44469D; font-weight: bold" class="nav-link" href="#">PROMOCIONES</a>
                            </li>
                            <li class="nav-item">
                                <a style="color:#44469D; font-weight: bold" class="nav-link">SEDES</a>
                            </li>
                            <li class="nav-item">
                                <a style="color:#44469D; font-weight: bold" class="nav-link">RESULTADOS COVID 19</a>
                            </li>
                            <c:if test="${user == null}">
                                <li class="nav-item">
                                    <a href="login.jsp" style="color:#44469D; font-weight: bold;border: 1px solid;border-radius: 10px" class="nav-link programarcita"><i class="fa fa-user"></i> Iniciar Sesión</a>
                                </li>
                            </c:if>
                            <c:if test="${user != null}">
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
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
            <!--Cuerpo-->
            <div style="margin: 25px 0px;background-color: #fff; padding:25px 0px;" class="row text-center">
                <div style="display: flex;flex-direction: column;justify-content: center;text-align: center;align-items: center;" class="col-md-6">
                    <span style="font-size: 60px;color:#5AC5C3; font-weight: bold">Somos la primera app que vende</span>
                    <span style="font-size: 40px;color:#44469D; font-weight: bold">mas que solo consultas</span>
                    <a href="login.jsp" style="font-size: 20px;color:#44469D; font-weight: bold;border: 1px solid;border-radius: 50px;padding: 10px 0px;width: 50%;margin-top: 10px" class="programarcita nav-link"><i class="fa fa-user"></i> Programar cita</a>

                </div >
                <div class="col-md-6">
                    <img src="img/iphone.png" />
                </div >

            </div>
        </div>
        <%@include file="btnRedes.jsp" %>
    </body>
    <script src="js/bootstrap.js" type="text/javascript"></script>
    <script src="jquery/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="jquery/popper.min.js" type="text/javascript"></script>
    <!--Fontawesome-->
    <script src="https://kit.fontawesome.com/27f204c8a9.js" crossorigin="anonymous"></script>
</html>
