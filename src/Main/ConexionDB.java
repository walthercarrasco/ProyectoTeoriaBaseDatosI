
package Main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
        
/**
 *
 * @author WALTHERANTONIOCARRAS
 */
public class ConexionDB {
    
    private static final String nombre = "ProyectoLocal";
    private static final String usuario = "walther";
    private static final String password = "holamundo";
    private static final String port = "5432";
    private static final String ip = "localhost";
    private static final String driver = "postgresql";
    private Connection conexion = null;
    
    public ConexionDB(){
    }
    
    public Connection getConexion(){
        return conexion;
    }
    
    public ResultSet consulta(String query){
        ResultSet rs = null;
        try{
            Statement stmt = conexion.createStatement();
            rs = stmt.executeQuery(query);
        }catch(SQLException e){
            e.printStackTrace();
        }
        return rs;
    }
    
    public void desconectar(){
        if(conexion != null){
            try{
                conexion.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
    }
    
    public boolean conectar(){
        boolean rs = true;
        try{
            String url = "jdbc:"+driver+"://"+ip+":"+port+"/"+nombre;
            conexion = DriverManager.getConnection(url,usuario,password);
        }catch(SQLException e){
            e.printStackTrace();
            return false;
        }        
        return rs;
    }
}
