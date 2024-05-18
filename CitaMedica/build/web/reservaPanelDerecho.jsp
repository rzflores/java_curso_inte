<%-- 
    Document   : reservaPanelDerecho
    Created on : 24/11/2022, 02:57:49 PM
    Author     : Jonathan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--INICIA Panel principal derecho-->
        <div class="col-md-10 bg-gris">
            <div class="row">
                <p class="mt-3 fw-bold fs-5">Atención de citas medicas</p>
                <p>Bienvenido ${user.getNombre()}, desde esta área podras registrar tus atenciones medicas</p>
            </div>
            <div class="container-fluid">
                <div class="row mt-2 pt-3 bg-light shadow">
                    <div class="container ">
                        <table class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Fecha</th>
                                    <th scope="col">Hora</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Apellido</th>
                                    <th scope="col">DNI</th>
                                    <th scope="col">Estado</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>26/11/2022</td>
                                    <td>11:00 am</td>
                                    <td>Jonathan</td>
                                    <td>Paniagua Ccahuana</td>
                                    <td>70030602</td>
                                    <td>Pendiente</td>
                                    <td>
                                        <a class="btn btn-warning text-light btn-editar" href=""><i class="fas fa-pen"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>26/11/2022</td>
                                    <td>11:00 am</td>
                                    <td>Jonathan</td>
                                    <td>Paniagua Ccahuana</td>
                                    <td>70030602</td>
                                    <td>Pendiente</td>
                                    <td>
                                        <a class="btn btn-warning text-light btn-editar" href=""><i class="fas fa-pen"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>26/11/2022</td>
                                    <td>11:00 am</td>
                                    <td>Jonathan</td>
                                    <td>Paniagua Ccahuana</td>
                                    <td>70030602</td>
                                    <td>Pendiente</td>
                                    <td>
                                        <a class="btn btn-warning text-light btn-editar" href=""><i class="fas fa-pen"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>26/11/2022</td>
                                    <td>11:00 am</td>
                                    <td>Jonathan</td>
                                    <td>Paniagua Ccahuana</td>
                                    <td>70030602</td>
                                    <td>Pendiente</td>
                                    <td>
                                        <a class="btn btn-warning text-light btn-editar" href=""><i class="fas fa-pen"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>26/11/2022</td>
                                    <td>11:00 am</td>
                                    <td>Jonathan</td>
                                    <td>Paniagua Ccahuana</td>
                                    <td>70030602</td>
                                    <td>Pendiente</td>
                                    <td>
                                        <a class="btn btn-warning text-light btn-editar" href=""><i class="fas fa-pen"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--FIN Panel principal derecho-->
        <!--MODAL-->
        <div  class="modal" id="modalEditar" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <p style="color: #5AC5C3;font-weight: bold;font-size: 30px;" class="modal-title">Atender Paciente</p>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p style="color:#ffb300; font-weight: bold;font-size: 30px;text-align: center;">Actualiza los datos del Paciente</p>
                        <div class="col-12  py-3 px-3">
                            <div class="row">
                                <!-- Grupo: Numero de Tarjeta -->
                                <div class="form-group">
                                    <label for="diagnostico">Diagnotico</label>
                                    <input type="text" class="form-control tarjeta" name="diagnostico" 
                                           placeholder="" value="Fiebre alta" >   
                                </div>
                                <div class="form-group">
                                    <label>Medicamento</label>
                                    <div class="row">
                                        <table class="table table-bordered text-center">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Medicamento / Dosis / Dias/ UM-FF / Cant</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><textarea style="height: 200px;" class="form-control" placeholder="Ingrese Medicamento / Dosis / Dias/ UM-FF / Cant"></textarea></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div>
                    <div class="modal-footer">
                        <a style="width: auto;padding: 10px;background: #44469D;color: #ffff;border-radius: 10px;display: flex;justify-content: center;font-size: 20px;font-weight: bold;"
                           class="text-decoration-none btn-pagar" href="#" >Guardar atención</a>
                    </div>
                </div>
            </div>
        </div>
        <!--FIN MODAL-->
    </body>
</html>
