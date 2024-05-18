package dao.impl;

import dao.DaoMedico;
import dto.Medico;
import dto.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.ConexionBD;

public class DaoMedicoImpl implements DaoMedico {

    ConexionBD cn = new ConexionBD();
    PreparedStatement ps = null;
    Connection con = null;
    ResultSet rs = null;
    ArrayList<Medico> lista = null;
    Medico medico = null;

    @Override
    public ArrayList<Medico> listarPorEspecialidad(String nombre_especialidad) {
        StringBuilder sql = new StringBuilder();
        sql.append("select * from especialidad e INNER JOIN medico m on e.id_medico = m.id_medico ")
                .append("WHERE E.nombre_especialidad= '" + nombre_especialidad + "'");

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql.toString());
            rs = ps.executeQuery();
            lista = new ArrayList<>();
            while (rs.next()) {
                medico = new Medico();
                //reserva.setNombre_usuario(rs.getString("u.NOMBRE"));
                medico.setId_medico(rs.getString("m.id_medico"));
                medico.setNombres_medico(rs.getString("m.nombres_medico"));
                medico.setApellido_paterno_medico(rs.getString("m.apellido_paterno_medico"));
                medico.setApellido_materno_medico(rs.getString("m.apellido_materno_medico"));
                lista.add(medico);

            }

        } catch (Exception e) {
            System.out.println("Error en el Script");
        }
        return lista;
    }
    
    
    public ArrayList<Medico> listar() {
        StringBuilder sql = new StringBuilder();
        sql.append("select * from medico ");                
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql.toString());
            rs = ps.executeQuery();
            lista = new ArrayList<>();
            while (rs.next()) {
                medico = new Medico();
                medico.setId_medico(rs.getString("id_medico"));
                medico.setNombres_medico(rs.getString("nombres_medico"));
                medico.setApellido_paterno_medico(rs.getString("apellido_paterno_medico"));
                medico.setApellido_materno_medico(rs.getString("apellido_materno_medico"));
                lista.add(medico);
            }

        } catch (Exception e) {
            System.out.println("Error en el Script");
        }
        return lista;
    }

    
    public boolean editar(Medico ob) {
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE MEDICO SET");
        sql.append("nombres_medico=?, apellido_paterno_medico=?, apellido_materno_medico=?");
        sql.append("WHERE id_medico= '?'");
        
        
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql.toString());
         
            ps.setString(1, ob.getNombres_medico());
            ps.setString(2, ob.getApellido_paterno_medico());
            ps.setString(3, ob.getApellido_materno_medico());
            ps.setString(4, ob.getId_medico());
        
            
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error en el Script o no recibe todos los parametros");
        }
        return false;
    }

    public boolean agregar(Medico ob) {
       StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO USUARIO ")
                .append("(id_medico, nombres_medico, apellido_paterno_medico, apellido_materno_medico)")
                .append("VALUES(?,?,?,?)");
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql.toString());
            ps.setString(1, ob.getId_medico());
            ps.setString(2, ob.getNombres_medico());
            ps.setString(3, ob.getApellido_paterno_medico());
            ps.setString(4, ob.getApellido_materno_medico());
          
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean eliminar(String id) {
        String sql = "DELETE FROM MEDICO WHERE id_medico = '" + id + "'";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error en eliminacion: " + e.getMessage());
        }

        return false;
    }
    
}
