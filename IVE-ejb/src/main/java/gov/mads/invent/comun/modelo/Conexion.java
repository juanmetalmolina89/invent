package gov.mads.invent.comun.modelo;
/*
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class Conexion {

    private static Connection intancia = null;

    public synchronized static Connection obtenerInstancia() throws Exception {

        if (intancia == null) {
//            String archivoDefecto = "C:\\Users\\Jorge\\Documents\\NetBeansProjects\\IVE\\IVE-ejb\\src\\main\\java\\com\\mads\\invent\\comun\\modelo\\invent.Conexion.xml";
            String archivoDefecto = "C:\\jboss-as-7.1.1.Final\\docs\\IVE\\invent.Conexion.xml";
            String archivoConfiguracion = (System.getenv("mads.invent.config") == null || System.getenv("mads.invent.config").equals("")) ? archivoDefecto : System.getenv("mads.invent.config");
            Properties configuracion = new Properties();
            configuracion.loadFromXML(new FileInputStream(archivoConfiguracion));

            Class.forName(configuracion.getProperty("className"));
            intancia = DriverManager.getConnection(configuracion.getProperty("url"), configuracion.getProperty("user"), configuracion.getProperty("password"));
        }
        return intancia;
    }
}

*/

import javax.sql.DataSource; 
import java.sql.*; 
import java.util.ArrayList; 
import java.util.List;
import javax.naming.InitialContext;
import javax.naming.Context;
import org.apache.log4j.Logger;

public class Conexion {

    private static final Logger logger = Logger.getLogger( Conexion.class ); 
    private static Connection instancia = null;

    public synchronized static Connection obtenerInstancia() throws Exception {

        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource)ctx.lookup("java:/IVEOracleDS");
            if( ds != null ) instancia = ds.getConnection();
        } catch (Exception ex) {
            logger.fatal( "Error conectando al Datasource IVEOracleDS", ex);
        }
        return instancia;
    }

    public static void desconectar(Connection instancia) throws Exception {
        if(instancia != null && !instancia.isClosed()) {
                instancia.close();
           }
    }
 }