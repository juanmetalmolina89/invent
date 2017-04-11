package gov.mads.invent.ive.fachada.impl;

import gov.mads.invent.adm.modelo.impl.UsuarioDAO;
import gov.mads.invent.adm.vista.UsuarioOE;
import gov.mads.invent.comun.entidad.IvetT002Usuario;
import gov.mads.invent.comun.entidad.IvetT007Inventariofuente;
import gov.mads.invent.comun.entidad.IvetT016Inventcontamina;
import gov.mads.invent.comun.modelo.Correo;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.CodError;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.ive.fachada.IInventarioFAC;
import gov.mads.invent.ive.modelo.IInventarioDAO;
import gov.mads.invent.ive.modelo.impl.InventarioDAO;
import gov.mads.invent.ive.vista.InventarioOE;
import gov.mads.invent.utl.fachada.IListadosFAC;
import gov.mads.invent.utl.fachada.impl.ListadosFAC;
import org.jboss.resteasy.plugins.providers.multipart.InputPart;
import org.jboss.resteasy.plugins.providers.multipart.MultipartFormDataInput;
import org.jose4j.json.internal.json_simple.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InventarioFAC implements IInventarioFAC {

    private IInventarioDAO accesoDatos;

    @Override
    public ObjetoSalida registrarInventario(InventarioOE objetoEntrada) {

        accesoDatos = new InventarioDAO();
        ObjetoSalida objetoSalida = accesoDatos.registrarInventario(objetoEntrada);
        objetoSalida.setMsgError(objetoSalida.getMsgError());

        if (objetoSalida.esRespuestaOperacionCorrecta()) {

            Integer codigoInventario = ((BigDecimal) objetoSalida.getRespuesta().get(0).get("A003CODIGO")).intValue();

            for (IvetT016Inventcontamina item : objetoEntrada.getInventario().getIvetT016InventcontaminaList()) {
                ObjetoSalida objetoSalidaContaminante = accesoDatos.registrarInventarioContaminante(codigoInventario, item.getA016codigo(), objetoEntrada.getIdUsuario());
                if (!objetoSalidaContaminante.esRespuestaOperacionCorrecta()) {
                    objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaContaminante.getMsgError());
                }
            }

            for (IvetT007Inventariofuente item : objetoEntrada.getInventario().getIvetT007InventariofuenteList()) {
                ObjetoSalida objetoSalidaFuente = accesoDatos.registrarInventarioFuente(codigoInventario, item.getA007codigo(), objetoEntrada.getIdUsuario());
                if (!objetoSalidaFuente.esRespuestaOperacionCorrecta()) {
                    objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaFuente.getMsgError());
                }
            }

            ObjetoSalida objetoSalidaGeometria = accesoDatos.registrarGeometria(codigoInventario, new JSONObject((Map) objetoEntrada.getGeometria()), objetoEntrada.getIdUsuario());
            if (!objetoSalidaGeometria.esRespuestaOperacionCorrecta()) {
                objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaGeometria.getMsgError());
            }
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarInventario(InventarioOE objetoEntrada) {

        accesoDatos = new InventarioDAO();
        return accesoDatos.consultarInventario(objetoEntrada);
    }

    @Override
    public ObjetoSalida consultarGrilla(BusquedaOE objetoEntrada) {

        accesoDatos = new InventarioDAO();
        return accesoDatos.consultarGrilla(objetoEntrada);
    }

    @Override
    public ObjetoSalida actualizarInventario(InventarioOE objetoEntrada) {

        accesoDatos = new InventarioDAO();
        ObjetoSalida objetoSalida = accesoDatos.actualizarInventario(objetoEntrada);
        objetoSalida.setMsgError(objetoSalida.getMsgError());

        if (objetoSalida.esRespuestaOperacionCorrecta()) {

            Integer codigoInventario = ((BigDecimal) objetoSalida.getRespuesta().get(0).get("A003CODIGO")).intValue();

            ObjetoSalida objetoSalidaInventarioContaminante = accesoDatos.consultarInventarioContaminante(objetoEntrada);
            if (objetoSalidaInventarioContaminante.esRespuestaOperacionCorrecta()) {
                for (HashMap<String, Object> item : objetoSalidaInventarioContaminante.getRespuesta()) {
                    accesoDatos.eliminarInventarioContaminante(((BigDecimal) item.get("A016CODIGO")).intValue(), objetoEntrada.getIdUsuario());
                }
            }
            for (IvetT016Inventcontamina item : objetoEntrada.getInventario().getIvetT016InventcontaminaList()) {
                ObjetoSalida objetoSalidaContaminante = accesoDatos.registrarInventarioContaminante(codigoInventario, item.getA016codigo(), objetoEntrada.getIdUsuario());
                if (!objetoSalidaContaminante.esRespuestaOperacionCorrecta()) {
                    objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaContaminante.getMsgError());
                }
            }

            ObjetoSalida objetoSalidaInventarioFuente = accesoDatos.consultarInventarioFuente(objetoEntrada);
            if (objetoSalidaInventarioFuente.esRespuestaOperacionCorrecta()) {
                for (HashMap<String, Object> item : objetoSalidaInventarioFuente.getRespuesta()) {
                    accesoDatos.eliminarInventarioFuente(((BigDecimal) item.get("A007CODIGO")).intValue(), objetoEntrada.getIdUsuario());
                }
            }
            for (IvetT007Inventariofuente item : objetoEntrada.getInventario().getIvetT007InventariofuenteList()) {
                ObjetoSalida objetoSalidaFuente = accesoDatos.registrarInventarioFuente(codigoInventario, item.getA007codigo(), objetoEntrada.getIdUsuario());
                if (!objetoSalidaFuente.esRespuestaOperacionCorrecta()) {
                    objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaFuente.getMsgError());
                }
            }

            ObjetoSalida objetoSalidaInventarioGeometria = accesoDatos.consultarGeometria(objetoEntrada);
            if (objetoSalidaInventarioGeometria.esRespuestaOperacionCorrecta()) {
                Integer codigoGeometria = ((BigDecimal) objetoSalidaInventarioGeometria.getRespuesta().get(0).get("A004CODIGO")).intValue();
                ObjetoSalida objetoSalidaGeometria = accesoDatos.actualizarGeometria(codigoGeometria, codigoInventario, new JSONObject((Map) objetoEntrada.getGeometria()), objetoEntrada.getIdUsuario());
                if (!objetoSalidaGeometria.esRespuestaOperacionCorrecta()) {
                    objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaGeometria.getMsgError());
                }
            }
            else {
                ObjetoSalida objetoSalidaGeometria = accesoDatos.registrarGeometria(codigoInventario, new JSONObject((Map) objetoEntrada.getGeometria()), objetoEntrada.getIdUsuario());
                if (!objetoSalidaGeometria.esRespuestaOperacionCorrecta()) {
                    objetoSalida.setMsgError(objetoSalida.getMsgError() + "<br><br>" + objetoSalidaGeometria.getMsgError());
                }
            }
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida registrarAdjunto(MultipartFormDataInput objetoEntrada) {

        accesoDatos = new InventarioDAO();
        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            Map<String, List<InputPart>> camposInventarioAdjuntoOE = objetoEntrada.getFormDataMap();
            Integer codigoInventario = Integer.parseInt(camposInventarioAdjuntoOE.get("codigoInventario").get(0).getBodyAsString());
            Integer idUsuario = Integer.parseInt(camposInventarioAdjuntoOE.get("idUsuario").get(0).getBodyAsString());
            String rutaAdjuntoParametrica = obtenerRutaAdjuntoParametrica(idUsuario);

            File archivoAdjunto = almacenarAdjunto(camposInventarioAdjuntoOE, codigoInventario, rutaAdjuntoParametrica);

            ObjetoSalida objetoSalidaAdjunto = accesoDatos.consultarAdjunto(codigoInventario, idUsuario);
            if (objetoSalidaAdjunto.esRespuestaOperacionCorrecta()) {
                for (HashMap<String, Object> item : objetoSalidaAdjunto.getRespuesta()) {
                    objetoSalida = accesoDatos.actualizarAdjunto(((BigDecimal) item.get("A014CODIGO")).intValue(), codigoInventario, archivoAdjunto.getName(), archivoAdjunto.getParent(), idUsuario);
                }
            }
            else {
                objetoSalida = accesoDatos.registrarAdjunto(codigoInventario, archivoAdjunto.getName(), archivoAdjunto.getParent(), idUsuario);
            }

        } catch (Exception e) {

            objetoSalida.setCodError(CodError.ERROR_INTERNO);
            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    @Override
    public ObjetoSalida consultarGeometria(InventarioOE objetoEntrada) {

        accesoDatos = new InventarioDAO();
        return accesoDatos.consultarGeometria(objetoEntrada);
    }

    @Override
    public File consultarAdjunto(Integer codigoInventario, Integer idUsuario) throws Exception {

        accesoDatos = new InventarioDAO();
        File archivoAdjunto = null;

        ObjetoSalida objetoSalida = accesoDatos.consultarAdjunto(codigoInventario, idUsuario);
        if (objetoSalida.esRespuestaOperacionCorrecta()) {

            String nombreAdjunto = "";
            String rutaAdjunto = "";
            for (HashMap<String, Object> item : objetoSalida.getRespuesta()) {
                nombreAdjunto = item.get("A014NOMBREADJUNTO").toString();
                rutaAdjunto = item.get("A014RUTAADJUNTO").toString();
            }
            archivoAdjunto = new File(rutaAdjunto + "\\" + nombreAdjunto);
        }

        return archivoAdjunto;
    }

    @Override
    public ObjetoSalida consultarInventarioFuente(InventarioOE objetoEntrada) {

        accesoDatos = new InventarioDAO();
        return accesoDatos.consultarInventarioFuente(objetoEntrada);
    }

    @Override
    public ObjetoSalida consultarInventarioContaminante(InventarioOE objetoEntrada) {

        accesoDatos = new InventarioDAO();
        return accesoDatos.consultarInventarioContaminante(objetoEntrada);
    }

    @Override
    public ObjetoSalida cambiarEstadoInventario(InventarioOE objetoEntrada) {

        ObjetoSalida objetoSalida = new ObjetoSalida();

        try {

            accesoDatos = new InventarioDAO();
            objetoSalida = accesoDatos.cambiarEstadoInventario(objetoEntrada);

            if (objetoSalida.esRespuestaOperacionCorrecta()) {

                ObjetoSalida objetoSalidaInventario = accesoDatos.consultarInventario(objetoEntrada);

                if (objetoSalidaInventario.esRespuestaOperacionCorrecta()) {

                    UsuarioDAO accesoDatosUsuario = new UsuarioDAO();

                    UsuarioOE objetoEntradaCreacion = new UsuarioOE();
                    objetoEntradaCreacion.setIdUsuario(objetoEntrada.getIdUsuario());
                    IvetT002Usuario usuarioCreacion = new IvetT002Usuario();
                    usuarioCreacion.setA002codigo(Integer.parseInt(objetoSalidaInventario.getRespuesta().get(0).get("A003IDUSUARIOREGISTRO").toString()));
                    objetoEntradaCreacion.setUsuario(usuarioCreacion);
                    ObjetoSalida objetoSalidaCreacion = accesoDatosUsuario.consultarUsuario(objetoEntradaCreacion);

                    UsuarioOE objetoEntradaModificacion = new UsuarioOE();
                    objetoEntradaModificacion.setIdUsuario(objetoEntrada.getIdUsuario());
                    IvetT002Usuario usuarioModificacion = new IvetT002Usuario();
                    usuarioModificacion.setA002codigo(objetoEntrada.getIdUsuario());
                    objetoEntradaModificacion.setUsuario(usuarioModificacion);
                    ObjetoSalida objetoSalidaModificacion = accesoDatosUsuario.consultarUsuario(objetoEntradaModificacion);

                    if (objetoSalidaModificacion.esRespuestaOperacionCorrecta() && objetoSalidaCreacion.esRespuestaOperacionCorrecta()) {

                        String paraUsuarioCreacion = objetoSalidaCreacion.getRespuesta().get(0).get("A002CORREOELECTRONICO").toString();
                        String paraUsuarioModificacion = objetoSalidaModificacion.getRespuesta().get(0).get("A002CORREOELECTRONICO").toString();
                        String estado = objetoSalidaInventario.getRespuesta().get(0).get("DESC_ESTADO_INVENTARIO").toString();
                        String objeto = objetoSalidaInventario.getRespuesta().get(0).get("A003OBJETO").toString();
                        String asunto = "Inventario " + estado;

                        IListadosFAC fachadaListados = new ListadosFAC();
                        String contenido = fachadaListados.obtenerParametro(objetoEntrada.getIdUsuario(), "MAIL_MSG");
                        contenido = contenido.replace("@FECHA", new Date().toString());
                        contenido = contenido.replace("@ASUNTO", asunto);
                        contenido = contenido.replace("@ESTADO", estado);
                        contenido = contenido.replace("@INVENTARIO", objeto);
                        contenido = contenido.replace("@ID", objetoSalidaInventario.getRespuesta().get(0).get("A003CODIGO").toString());

                        Correo correo = Correo.obtenerInstancia(objetoEntrada.getIdUsuario());
                        correo.NotificarCambioEstado(paraUsuarioCreacion, asunto, contenido.replace("@NOMBRE", objetoSalidaCreacion.getRespuesta().get(0).get("A002NOMBRE").toString() + " " + objetoSalidaCreacion.getRespuesta().get(0).get("A002APELLIDO").toString()));
                        correo.NotificarCambioEstado(paraUsuarioModificacion, asunto, contenido.replace("@NOMBRE", objetoSalidaModificacion.getRespuesta().get(0).get("A002NOMBRE").toString() + " " + objetoSalidaModificacion.getRespuesta().get(0).get("A002APELLIDO").toString()));
                    }
                }
            }
        } catch (Exception e) {

            objetoSalida.setMsgError(e.getMessage());
        }

        return objetoSalida;
    }

    private String obtenerRutaAdjuntoParametrica(Integer idUsuario) throws Exception {

        IListadosFAC fachadaListados = new ListadosFAC();
        return fachadaListados.obtenerParametro(idUsuario, "RUTAADJUNTO");
    }

    private File almacenarAdjunto(Map<String, List<InputPart>> camposInventarioAdjuntoOE, Integer codigoInventario, String rutaAdjuntoParametrica) throws Exception {

        File archivoAdjunto = null;
        try (InputStream lecturaAdjunto = camposInventarioAdjuntoOE.get("file").get(0).getBody(InputStream.class, null)) {

            File carpetaAdjunto = new File(rutaAdjuntoParametrica + "\\" + codigoInventario);

            if (!carpetaAdjunto.exists())
                carpetaAdjunto.mkdirs();
            else if (carpetaAdjunto.isDirectory())
                for (File antiguo : carpetaAdjunto.listFiles())
                    antiguo.delete();

            archivoAdjunto = new File(rutaAdjuntoParametrica + "\\" + codigoInventario + "\\" + "ive.pdf");

            try (OutputStream escrituraAdjunto = new FileOutputStream(archivoAdjunto)) {

                int read = 0;
                byte[] bytes = new byte[2048];
                while ((read = lecturaAdjunto.read(bytes)) != -1)
                    escrituraAdjunto.write(bytes, 0, read);

                lecturaAdjunto.close();
                escrituraAdjunto.flush();
                escrituraAdjunto.close();

            } catch (Exception e) {
                throw new Exception(e);
            }

        } catch (Exception e) {
            throw new Exception(e);
        }
        return archivoAdjunto;
    }
}
