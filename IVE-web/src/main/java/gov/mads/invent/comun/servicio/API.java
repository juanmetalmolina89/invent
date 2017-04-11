package gov.mads.invent.comun.servicio;

import gov.mads.invent.adm.servicio.UsuarioSERV;
import gov.mads.invent.adm.vista.OS_Autenticar;
import gov.mads.invent.adm.vista.OS_ConsultarFuncionarios;
import gov.mads.invent.comun.servicio.jwt.JWTFiltro;
import gov.mads.invent.comun.vista.CodError;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.servicio.CategoriaSERV;
import gov.mads.invent.ive.servicio.InventarioSERV;
import gov.mads.invent.ive.servicio.ReporteSERV;
import gov.mads.invent.utl.servicio.ListadosSERV;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.Response;
import java.util.HashSet;
import java.util.Set;

@ApplicationPath("/api")
public class API extends Application {

    public static Response retornarRespuesta(ObjetoSalida objetoSalida) {

        if (objetoSalida.getCodError() == CodError.OPERACION_CORRECTA)
            return Response.status(Response.Status.OK).entity(objetoSalida).build();
        else
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(objetoSalida).build();
    }
    
    public static Response retornarRespuestaVital(OS_ConsultarFuncionarios objetoSalida) {

        if (objetoSalida.getCodigoError() == CodError.OPERACION_CORRECTA.getValor())
            return Response.status(Response.Status.OK).entity(objetoSalida).build();
        else
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(objetoSalida).build();
    }
    
    public static Response retornarRespuestaVital(OS_Autenticar objetoSalida) {

        if (objetoSalida.getCodigoError() == CodError.OPERACION_CORRECTA.getValor())
            return Response.status(Response.Status.OK).entity(objetoSalida).build();
        else
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity(objetoSalida).build();
    }
    @Override
    public Set<Class<?>> getClasses() {

        Set<Class<?>> clazzes = new HashSet();
        clazzes.add(JWTFiltro.class);
        clazzes.add(ListadosSERV.class);
        clazzes.add(UsuarioSERV.class);
        clazzes.add(InventarioSERV.class);
        clazzes.add(CategoriaSERV.class);
        clazzes.add(ReporteSERV.class);
        return clazzes;
    }
}
