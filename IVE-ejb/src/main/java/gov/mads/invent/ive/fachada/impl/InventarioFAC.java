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
import gov.mads.invent.ive.vista.ConsultarInventariosFechaOE;
import gov.mads.invent.ive.vista.InventarioOE;
import gov.mads.invent.utl.fachada.IListadosFAC;
import gov.mads.invent.utl.fachada.impl.ListadosFAC;
import java.io.BufferedReader;
import org.jboss.resteasy.plugins.providers.multipart.InputPart;
import org.jboss.resteasy.plugins.providers.multipart.MultipartFormDataInput;
import org.jose4j.json.internal.json_simple.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.lang.Object;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.jose4j.json.internal.json_simple.JSONObject;


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

    @Override
    public ObjetoSalida consultarInventarioFecha(ConsultarInventariosFechaOE objetoEntrada) throws Exception {
        accesoDatos = new InventarioDAO();
        ObjetoSalida obj = accesoDatos.consultarInventarioFecha(objetoEntrada);
        ObjetoSalida OS =  new ObjetoSalida();
       ///* 
         if(obj.esRespuestaOperacionCorrecta()){
            List<HashMap<String, Object>> respuesta = new ArrayList<>();
            for (HashMap<String, Object> item : obj.getRespuesta()) {
                    Integer Object;

                    String id_ive = (item.get("A003CODIGO") == null) ? null : item.get("A003CODIGO").toString();
                    String objeto_ive = (item.get("A003OBJETO") == null) ? null : item.get("A003OBJETO").toString();
                    java.sql.Timestamp fechainiive = (item.get("A003FECHA_INICIAL") == null) ? null : (java.sql.Timestamp)item.get("A003FECHA_INICIAL");
                    Long fechini = (fechainiive == null) ? null : fechainiive.getTime();
                    java.util.Date fecha_ini_ive = (fechini == null) ? null : new java.util.Date( fechini );
                    java.sql.Timestamp fechafinive = (item.get("A003FECHA_FINAL") == null) ? null : (java.sql.Timestamp)item.get("A003FECHA_FINAL");
                    Long fechfin = (fechafinive == null) ? null : fechafinive.getTime();
                    java.util.Date fecha_fin_ive = (fechfin == null) ? null : new java.util.Date( fechfin );
                    
                    String id_estado = (item.get("A003ESTADO_INVENTARIO") == null) ? null : item.get("A003ESTADO_INVENTARIO").toString();
                    String desc_est_ive = (item.get("DESC_ESTADO_INVENTARIO") == null) ? null : item.get("DESC_ESTADO_INVENTARIO").toString();
                    String geojson = (item.get("A004GEOMETRIA")== null) ? null : item.get("A004GEOMETRIA").toString();                    
                    JSONObject salida = new JSONObject();
                    String autoridadambiental = (item.get("SIGLA_AA")== null) ? null : item.get("SIGLA_AA").toString();
                    String tipocategoria = (item.get("A102VALOR")== null) ? null : item.get("A102VALOR").toString();
                    salida.put("idUsuario", objetoEntrada.getIdUsuario());
                    salida.put("idModulo", objetoEntrada.getIdModulo());
                    salida.put("idSistema", objetoEntrada.getIdSistema());
                    salida.put("geoJson", geojson);
                    System.out.println(geojson);
                    System.out.println(fecha_ini_ive.toString());
                    System.out.println(fecha_fin_ive.toString());
                    String fechinicio = new java.text.SimpleDateFormat("yyyy-MM-dd").format(fecha_ini_ive);
                    String fechfinal = new java.text.SimpleDateFormat("yyyy-MM-dd").format(fecha_fin_ive);
                    System.out.println(fechinicio);
                    System.out.println(fechfinal);
                    
                    
                    String objt = "{\"ID_IVE\":\""+id_ive+"\",\"ESTADO\":\""+(id_estado + ":" + desc_est_ive)+"\","
                    + "\"AUTORIDAD_AMBIENTAL\":\""+autoridadambiental+"\",\"FECHA_INICIO\":\""+fechinicio+"\","
                    + "\"FECHA_FIN\":\""+fechfinal+"\",\"TIPO_CATEGORIA\":\""+tipocategoria+"\",\"MP\":null,"
                    + "\"SOx\":null,\"NOx\":null,\"CO\":null,"
                    + "\"OBJETO\":\""+objeto_ive+"\"}";
                    System.out.println(objt); 

                    salida.put("Campos", objt);
                    salida.put("operacion", objetoEntrada.getOperacionComponente());
                    salida.put("tipoGeometria",objetoEntrada.getTipoGeometria());
                    System.out.println(salida.toJSONString());//*/
             ///*
                    StringEntity params =new StringEntity(salida.toJSONString(),"UTF-8");
                    HttpClient client = new DefaultHttpClient();
                    System.out.println("request");
                    HttpPost request = new HttpPost(objetoEntrada.getUrl());                
                    System.out.println(objetoEntrada.getUrl());
        //Set Headers
                    System.out.println("Set Headers");  
                    request.setHeader("Accept", "application/json");
                    request.setHeader("Content-Type","application/json;charset=UTF-8" );
                    request.setEntity(params);
                    HttpResponse response = client.execute(request);
                    StringBuilder result = new StringBuilder();
                    BufferedReader reader;
                    InputStream inputStream = response.getEntity().getContent();
                    reader = new BufferedReader(new InputStreamReader(inputStream));
                    String inputLine;
                    while ((inputLine = reader.readLine()) != null) {
                        result.append(inputLine);
                    }
                    //se crea la nueva respuesta y se retorna
                    System.out.println(result);

                    HashMap<String, Object> a = new HashMap<>();
                    a.put("respuesta", result);
                    respuesta.add(a);    

            
            }
            OS.setRespuesta(respuesta);
            OS.setCodError(obj.getCodError());

            return OS;
        }
        else
            return obj; 
    }
}
