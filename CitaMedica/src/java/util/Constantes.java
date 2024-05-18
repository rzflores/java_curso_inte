/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author Renzo
 */
public class Constantes {
    public static final int ADMIN = 1;
    public static final int MEDICO = 2;
    public static final int PACIENTE = 3;
    public static final int ENFERMERA = 4;
    
    public static String obtenerCodigoUsuario(int rol) {
        String codigoUsuario = "";
        
        switch(rol) {
            case ADMIN:
                codigoUsuario = "CODAD";                
                break;
            case MEDICO:
                codigoUsuario = "CODME";                
                break;
            case PACIENTE:
                codigoUsuario = "CODPA";                
                break;
            case ENFERMERA:
                codigoUsuario = "CODEM";                
                break;
            default:
                codigoUsuario = "CODPA"; 
                break;
        }
        return codigoUsuario;
    };
    
    
    
    
}
