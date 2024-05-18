<%-- 
    Document   : reservaPanelDerecho
    Created on : 24/11/2022, 02:57:49 PM
    Author     : Jonathan
--%>
<%@page import="dao.impl.DaoUsuarioImpl"%>
<%@page import="dto.Usuario"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            DaoUsuarioImpl daoUsuario = new DaoUsuarioImpl();
            List<Usuario> listaUsuarios = daoUsuario.listar();
            pageContext.setAttribute("listaUsuarios", listaUsuarios);
        %>
        
        <!--INICIA Panel principal derecho-->
        <div class="col-md-10 bg-gris">
            <div class="row">
                <p class="mt-3 fw-bold fs-5">Registro de Usuarios</p>
                <p>Bienvenido ${user.getNombre()}, desde esta área podrás registrar, actualiza y eliminar los datos de tus usuarios</p>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3"> 
                        <a class="btn btn-success btn-crear" href="">Nuevo Usuario</a>
                    </div> 
                </div>
                <div class="row mt-2 pt-3 bg-light shadow">
                    <div class="container ">
                        <table class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th scope="col">Id Usuario</th>
                                    <th scope="col">Id Paciente</th>
                                    <th scope="col">Rol</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Correo</th>
                                    <th scope="col">Telefono</th>
                                    <th scope="col">Estado</th>
                                    <th scope="col" colspan="2">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                  <c:forEach var="usuario" items="${listaUsuarios}">
                                     <tr>
                                        <td>${usuario.getIdusuario()}</td>
                                        <td>${usuario.getId_paciente()}</td>
                                        <td>${usuario.getNombrerol()}</td>
                                        <td>${usuario.getNombre()}</td>
                                        <td>${usuario.getEmail()}</td>
                                        <td>${usuario.getTelefono()}</td>
                                        <td>${usuario.getEstado()}</td>
                                        <td>
                                            <a class="btn btn-warning text-light btn-editar" 
                                               data-id="${usuario.getIdusuario()}" 
                                               data-codigo="${usuario.getId_paciente()}"
                                               data-rol="${usuario.getIdrol()}"
                                               data-nombre="${usuario.getNombre()}"
                                               data-apepaterno="${usuario.getApellido().split(" ")[0]}"
                                               data-apematerno="${usuario.getApellido().split(" ")[1]}"
                                               data-correo="${usuario.getEmail()}"
                                               data-tipodoc="${usuario.getTipo_documento()}"
                                               data-telefono="${usuario.getTelefono()}"
                                               data-activo="${usuario.getEstado()}"
                                               data-dni="${usuario.getDni()}"
                                               href=""
                                               ><i class="fas fa-pen"></i></a>
                                        </td>
                                        <td>
                                            <form action="UsuarioLoginServlet" id="formEliminarUsuario" method="POST" >
                                                <input type="hidden" name="idUsuario" value="${usuario.getIdusuario()}">
                                                <input type="hidden" name="codigoUsuario" value="${usuario.getId_paciente()}">
                                                <input type="hidden" name="accion" value="eliminarUsuario">
                                                
                                                <button type="submit" class="btn btn-danger mibtn-cancelar" data-id="${ob.idusuario}">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>

                                        </td>
                                     </tr>
                                 </c:forEach>
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--FIN Panel principal derecho-->
        <!--MODAL CREAR-->
        <div class="modal" id="modalCrear" tabindex="-1">
            <div class="modal-dialog">
                <div  class="modal-content">
                    <div class="modal-header">
                        <p style="color: #5AC5C3;font-weight: bold;font-size: 30px;" class="modal-title">Nuevo Usuario</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="UsuarioLoginServlet" id="formNuevoUsuario" method="POST">
                    <div class="modal-body">
                        <p style="color:#ffb300; font-weight: bold;font-size: 30px;text-align: center;"> Crea una nuevo usuario</p>
                        <div class="col-12  py-3 px-3">
                            <div class="row">
                                <!-- Grupo: Rol -->
                                <div class="form-group">
                                    <label for="cboRol">RoL</label>
                                    <select class="form-select" name="cboRol" id="cboRol">
                                        <option value="3">Administrador</option>
                                        <option value="1">Medico</option>
                                        <option value="2">Paciente</option>
                                        <option value="4">Enfermera</option>
                                    </select>
                                </div>
                                <!-- Grupo: Código de especialidad -->
                                <div class="form-group">
                                    <label for="Codespecialidad">Nombre</label>
                                    <input type="text" class="form-control" name="nombre" value="" placeholder="Jhon Doe">
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="especialidad">Apellido Paterno</label>
                                    <input type="text" class="form-control" name="apellido_paterno" value="" placeholder="Pacheco">
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="especialidad">Apellido Materno</label>
                                    <input type="text" class="form-control" name="apellido_materno" value="" placeholder="Suarez">
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="email">Correo</label>
                                    <input type="email" class="form-control" name="email" value="" placeholder="jpaniagua@gmail.com">
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" name="password" value="" placeholder="*************">
                                </div>
                                <!-- Grupo: Medico -->
                                <div class="form-group">
                                    <label for="tipoDocumento">Tipo Documento</label>
                                    <select class="form-select" name="tipoDocumento" id="tipoDocumento">
                                        <option value="Dni">DNI</option>
                                        <option value="CE">C.E.</option>
                                    </select>
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="dni">Dni</label>
                                    <input type="text" class="form-control" name="dni" value="" placeholder="70030602">
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="telefono">Telefono</label>
                                    <input type="text" class="form-control" name="telefono" value="" placeholder="983514699">
                                </div>
                                <!-- Grupo: Medico -->
                                <div class="form-group">
                                    <label for="cboEstado">Estado</label>
                                    <select class="form-select" name="cboEstado" id="cboEstado">
                                        <option value="Activo">Activo</option>
                                        <option value="Bloqueado">Bloqueado</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                       <!-- <input type="hidden" name="accion" value="nuevoUsuario">-->
                        <input class="btn btn-secondary rounded-pill text-light fw-bold " type="submit" name="accion" value="Crear Usuario">
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!--FIN MODAL CREAR-->

        <!--MODAL EDITAR-->
        <div class="modal" id="modalEditar" tabindex="-1">
            <div class="modal-dialog">
                <div  class="modal-content">
                    <div class="modal-header">
                        <p style="color: #5AC5C3;font-weight: bold;font-size: 30px;" class="modal-title">Editar</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="UsuarioLoginServlet" id="formEditarUsuario" method="POST">
                    <div class="modal-body">
                        <p style="color:#ffb300; font-weight: bold;font-size: 30px;text-align: center;"> Editemos el usuario</p>
                        <div class="col-12  py-3 px-3">
                            <div class="row">
                                
                                <input   type="hidden"  id="idUsuarioEdit"name="idUsuario">
                                
                                <div class="form-group">
                                    <label for="codUsuario">Codigo de Usuario</label>
                                    <input id="codigoUsuarioEdit" type="text" class="form-control" name="codUsuario" value="cod0120202" disabled>
                                </div>
                                <!-- Grupo: Rol -->
                                <div class="form-group">
                                    <label for="cboRol">Rol</label>
                                    <select id="cboRolEdit" class="form-select" name="cboRol" id="cboRol">
                                        <option value="3">Administrador</option>
                                        <option value="1">Medico</option>
                                        <option value="2">Paciente</option>
                                        <option value="4">Enfermera</option>
                                    </select>
                                </div>
                                <!-- Grupo: Código de especialidad -->
                                <div class="form-group">
                                    <label for="Codespecialidad">Nombre</label>
                                    <input id="nombreEdit" type="text" class="form-control" name="nombre" value="" placeholder="Jhon Doe">
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="especialidad">Apellido Paterno</label>
                                    <input id="apepaEdit" type="text" class="form-control" name="apellido_paterno" value="" placeholder="Pacheco">
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="especialidad">Apellido Materno</label>
                                    <input id="apemaEdit" type="text" class="form-control" name="apellido_materno" value="" placeholder="Suarez">
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="email">Correo</label>
                                    <input id="emailEdit" type="email" class="form-control" name="email" value="" placeholder="jpaniagua@gmail.com">
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" name="password" value="" placeholder="*************">
                                </div>
                                <!-- Grupo: Medico -->
                                <div class="form-group">
                                    <label for="tipoDocumento">Tipo Documento</label>
                                    <select id="tipoDocumentoEdit" class="form-select" name="tipoDocumento" id="tipoDocumento">
                                        <option value="Dni">DNI</option>
                                        <option value="CE">C.E.</option>
                                    </select>
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="dni">Dni</label>
                                    <input id="dniEdit" type="text" class="form-control" name="dni" value="" placeholder="70030602">
                                </div>
                                <!-- Grupo: Nombre especialidad -->
                                <div class="form-group">
                                    <label for="telefono">Telefono</label>
                                    <input id="telefonoEdit" type="text" class="form-control" name="telefono" value="" placeholder="983514699">
                                </div>
                                <!-- Grupo: Medico -->
                                <div class="form-group">
                                    <label for="cboEstado">Estado</label>
                                    <select  id="cboEstadoEdit" class="form-select" name="cboEstado" id="cboEstado">
                                        <option value="Activo">Activo</option>
                                        <option value="Bloqueado">Bloqueado</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                         <input class="btn btn-secondary rounded-pill text-light fw-bold " type="submit" name="accion" value="Editar Usuario">
<!--                        <a style="width: auto;padding: 10px;background: #44469D;color: #ffff;border-radius: 10px;display: flex;justify-content: center;font-size: 20px;font-weight: bold;"
                           class="text-decoration-none btn-pagar" href="#">Actualizar</a>-->
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!--FIN MODAL EDITAR-->
    </body>
</html>
