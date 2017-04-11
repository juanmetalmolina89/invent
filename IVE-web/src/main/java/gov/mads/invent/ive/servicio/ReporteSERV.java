package gov.mads.invent.ive.servicio;

import gov.mads.invent.ive.fachada.IReporteFAC;
import gov.mads.invent.ive.fachada.impl.ReporteFAC;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;
import java.io.File;
import java.util.List;

@Path("/reporte")
public class ReporteSERV {

    private IReporteFAC fachada;

    @GET
    @Path("/generarreporteinventario")
    @Produces("application/vnd.ms-excel")
    public Response generarReporteInventario(@QueryParam("idReporte") Integer idReporte, @QueryParam("ci") List<Long> codigosInventario, @QueryParam("idUsuario") Integer idUsuario) {

        try {
            fachada = new ReporteFAC();
            File adjunto = fachada.generarReporteInventario(idReporte, codigosInventario, idUsuario);
            if (adjunto != null && adjunto.exists()) {
                Response.ResponseBuilder response = Response.ok(adjunto);
                response.header("Content-Disposition", "attachment; filename=" + adjunto.getName());
                return response.build();
            }
            else {
                return Response.status(Response.Status.FORBIDDEN).build();
            }
        } catch (Exception e) {
            return Response.status(Response.Status.FORBIDDEN).build();
        }
    }
}
