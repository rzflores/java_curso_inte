/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web.servlet;

import dao.impl.DaoDetalle_VentasImpl;
import dao.impl.DaoPacienteImpl;
import dao.impl.DaoProductosImpl;
import dao.impl.DaoUsuarioImpl;
import dao.impl.DaoUsuarioRegistroImpl;
import dao.impl.DaoVentaImpl;
import dto.Carrito;
import dto.Paciente;
import dto.Productos;
import dto.Reserva;
import dto.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.Constantes;
import web.validator.UsuarioValidator;
import web.validator.pagoValidator;

/**
 *
 * @author Renzo
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    
     //Usuario
    Usuario userlogin = null;
    DaoUsuarioRegistroImpl dao = new DaoUsuarioRegistroImpl();
    UsuarioValidator val = new UsuarioValidator();
   
    //Paciente
    DaoPacienteImpl daopa = new DaoPacienteImpl();
    
    //usuario
    DaoUsuarioImpl daoUsuario = new DaoUsuarioImpl();
    //Venta
    pagoValidator valp = null;
    DaoProductosImpl daoprod = new DaoProductosImpl();
    DaoDetalle_VentasImpl dvdao = new DaoDetalle_VentasImpl();
    DaoVentaImpl ventadao = new DaoVentaImpl();
    Productos ob = null;
    ArrayList<Productos> lista = new ArrayList<>();
    ArrayList<Carrito> listaCarrito = new ArrayList<>();
    int item;
    double totalPagar = 0.0;
    int cantidad = 1;
    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesion = request.getSession();
        String action = "";

        action = request.getParameter("accion").toLowerCase().trim().replaceAll("\\s", "");
        
        
        switch (action) {
            case "crearusuario":
                    //crear nuevo usuario desde panel administrativo
                    //obtener los datos
                    String rol = request.getParameter("cboRol");
                    String nombre = request.getParameter("nombre");
                    String apellido_paterno = request.getParameter("apellido_paterno");
                    String apellido_materno = request.getParameter("apellido_materno");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String tipoDocumento = request.getParameter("tipoDocumento");
                    String dni = request.getParameter("dni");
                    String telefono = request.getParameter("telefono");
                    String estado = request.getParameter("cboEstado");
                    
                    
                    //llenamos un objeto Cliente
                    String codigo =  Constantes.obtenerCodigoUsuario(Integer.parseInt(rol));
                    Usuario usuarioNuevo = new Usuario();
                    usuarioNuevo.setIdrol(Integer.parseInt(rol));
                    usuarioNuevo.setId_paciente(codigo + dni);
                    usuarioNuevo.setNombre(nombre);
                    usuarioNuevo.setApellido( apellido_paterno + " " + apellido_materno );
                    usuarioNuevo.setTipo_documento(tipoDocumento);
                    usuarioNuevo.setDni(dni);
                    usuarioNuevo.setPassword(password);
                    usuarioNuevo.setEmail(email);
                    usuarioNuevo.setTelefono(telefono);
                    usuarioNuevo.setEstado(estado);
                    
                    //Pacietne fake
                    Paciente pacienteFake = new Paciente();
                    pacienteFake.setId_paciente(codigo + dni);
                    pacienteFake.setNombre(nombre);
                    pacienteFake.setApe_paterno(apellido_paterno + " " + apellido_materno);
                    pacienteFake.setDni(dni);
                    pacienteFake.setEmail(email);
                    pacienteFake.setTelefono(telefono);
                     //VALIDAR
                    String rdni = val.validarDni(dni);
                    String rnombre = val.validarnombre(nombre);
                    String rapellido = val.validarapellido(apellido_paterno + " " + apellido_materno);
                    String rtipo = val.validarTipo(tipoDocumento);
                    String rtelefono = val.validartelefono(telefono);
                    String rcorreo = val.validarEmail(email);
                    String rpassword = val.validarPass(password);
                    boolean correorep = dao.buscarCorreo(email);
                    boolean dnirep = dao.buscardni(dni);
                    
                    if (    rnombre.equalsIgnoreCase("") && 
                            rapellido.equalsIgnoreCase("") && 
                            rtipo.equalsIgnoreCase("") && 
                            rtelefono.equalsIgnoreCase("") && 
                            rcorreo.equalsIgnoreCase("") && 
                            rdni.equalsIgnoreCase("") && 
                            rpassword.equalsIgnoreCase("") && 
                            correorep && 
                            dnirep) {
                        daopa.agregar(pacienteFake);
                        dao.agregarUsuarioRegistro(usuarioNuevo);
                    }else{
                        //request.setAttribute("user", user);
                        request.setAttribute("rdni", rdni);
                        request.setAttribute("rnombre", rnombre);
                        request.setAttribute("rapellido", rapellido);
                        request.setAttribute("rtipo", rtipo);
                        request.setAttribute("rtelefono", rtelefono);
                        request.setAttribute("rcorreo", rcorreo);
                        request.setAttribute("rpass", rpassword);
                        request.setAttribute("correorep", correorep);
                        request.setAttribute("dnirep", dnirep);
                    
                    }
                    request.getRequestDispatcher("usuario.jsp").forward(request, response);
                    
               break; 
             case "editarusuario":
                    //crear nuevo usuario desde panel administrativo
                    //obtener los datos
                    String idUsuarioEdit = request.getParameter("idUsuario");
                    String rolEdit = request.getParameter("cboRol");
                    String nombreEdit = request.getParameter("nombre");
                    String apellido_paternoEdit = request.getParameter("apellido_paterno");
                    String apellido_maternoEdit = request.getParameter("apellido_materno");
                    String emailEdit = request.getParameter("email");
                    String passwordEdit = request.getParameter("password");
                    String tipoDocumentoEdit = request.getParameter("tipoDocumento");
                    String dniEdit = request.getParameter("dni");
                    String telefonoEdit = request.getParameter("telefono");
                    String estadoEdit = request.getParameter("cboEstado");
                    
                    
                    //llenamos un objeto Cliente
                    String codigoEdit =  Constantes.obtenerCodigoUsuario(Integer.parseInt(rolEdit));
                    Usuario usuarioEditar = new Usuario();
                    usuarioEditar.setIdusuario(Integer.parseInt(idUsuarioEdit));
                    usuarioEditar.setIdrol(Integer.parseInt(rolEdit));
                    usuarioEditar.setId_paciente(codigoEdit + dniEdit);
                    usuarioEditar.setNombre(nombreEdit);
                    usuarioEditar.setApellido( apellido_paternoEdit + " " + apellido_maternoEdit );
                    usuarioEditar.setTipo_documento(tipoDocumentoEdit);
                    usuarioEditar.setDni(dniEdit);
                    usuarioEditar.setPassword(passwordEdit);
                    usuarioEditar.setEmail(emailEdit);
                    usuarioEditar.setTelefono(telefonoEdit);
                    usuarioEditar.setEstado(estadoEdit);
                    
                    //Pacietne fake
                    Paciente pacienteFakeEdit = new Paciente();
                    pacienteFakeEdit.setId_paciente(codigoEdit + dniEdit);
                    pacienteFakeEdit.setNombre(nombreEdit);
                    pacienteFakeEdit.setApe_paterno(apellido_paternoEdit + " " + apellido_maternoEdit);
                    pacienteFakeEdit.setDni(dniEdit);
                    pacienteFakeEdit.setEmail(emailEdit);
                    pacienteFakeEdit.setTelefono(telefonoEdit);
                     //VALIDAR
                    String rdniEdit = val.validarDni(dniEdit);
                    String rnombreEdit = val.validarnombre(nombreEdit);
                    String rapellidoEdit = val.validarapellido(apellido_paternoEdit + " " + apellido_maternoEdit);
                    String rtipoEdit = val.validarTipo(tipoDocumentoEdit);
                    String rtelefonoEdit = val.validartelefono(telefonoEdit);
                    String rcorreoEdit = val.validarEmail(emailEdit);
                    String rpasswordEdit = "";
                    if(passwordEdit!= ""){
                        rpasswordEdit = val.validarPass(passwordEdit);
                    }
                    
                    boolean correorepEdit = dao.buscarCorreoEdit(emailEdit ,Integer.parseInt( idUsuarioEdit));
                    boolean dnirepEdit = dao.buscardniEdit(dniEdit,Integer.parseInt(idUsuarioEdit));
                    
                    if (    rnombreEdit.equalsIgnoreCase("") && 
                            rapellidoEdit.equalsIgnoreCase("") && 
                            rtipoEdit.equalsIgnoreCase("") && 
                            rtelefonoEdit.equalsIgnoreCase("") && 
                            rcorreoEdit.equalsIgnoreCase("") && 
                            rpasswordEdit.equalsIgnoreCase("") && 
                            correorepEdit && 
                            dnirepEdit) {
                        daopa.editar(pacienteFakeEdit);
                        daoUsuario.editar(usuarioEditar);
                    }
                    request.getRequestDispatcher("usuario.jsp").forward(request, response);
                    
               break;    
            case "eliminarusuario":
                String idUsuario = request.getParameter("idUsuario");
                String codigoUsuario = request.getParameter("codigoUsuario");
                daopa.eliminar( codigoUsuario);
                daoUsuario.eliminar( Integer.parseInt(idUsuario));
                request.getRequestDispatcher("usuario.jsp").forward(request, response);
               break;
            case "salir":
                sesion.invalidate();
                request.getRequestDispatcher("usuario.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("usuario.jsp").forward(request, response);
                break;

        }
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
