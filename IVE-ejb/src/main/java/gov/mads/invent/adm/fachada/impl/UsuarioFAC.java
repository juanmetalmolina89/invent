package gov.mads.invent.adm.fachada.impl;

import gov.mads.invent.adm.fachada.IUsuarioFAC;
import gov.mads.invent.adm.modelo.IUsuarioDAO;
import gov.mads.invent.adm.modelo.impl.UsuarioDAO;
import gov.mads.invent.adm.vista.ConsultarUsuarioEntidadOE;
import gov.mads.invent.adm.vista.Funcionario;
import gov.mads.invent.adm.vista.OE_Autenticar;
import gov.mads.invent.adm.vista.OE_ConsultarFuncionarios;
import gov.mads.invent.adm.vista.OS_ConsultarFuncionarios;
import gov.mads.invent.adm.vista.UsuarioOE;
import gov.mads.invent.adm.vista.ValidarUsuarioOE;
import gov.mads.invent.comun.entidad.IvetT002Usuario;
import gov.mads.invent.comun.modelo.ParametroAdaptador;
import gov.mads.invent.comun.modelo.SeguridadAdaptador;
import gov.mads.invent.comun.vista.BusquedaOE;
import gov.mads.invent.comun.vista.ObjetoSalida;
import gov.mads.invent.comun.vista.UsuarioVitalOE;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class UsuarioFAC implements IUsuarioFAC {

    private IUsuarioDAO accesoDatos;

    public ObjetoSalida validarUsuario(UsuarioOE objetoEntrada) {

        accesoDatos = new UsuarioDAO();
        return accesoDatos.validarUsuario(objetoEntrada);
    }

    public ObjetoSalida registrarUsuario(UsuarioOE objetoEntrada) {

        accesoDatos = new UsuarioDAO();
        return accesoDatos.registrarUsuario(objetoEntrada);
    }

    public ObjetoSalida consultarUsuario(UsuarioOE objetoEntrada) {

        accesoDatos = new UsuarioDAO();
        return accesoDatos.consultarUsuario(objetoEntrada);
    }

    public ObjetoSalida consultarGrilla(BusquedaOE objetoEntrada) {

        accesoDatos = new UsuarioDAO();
        return accesoDatos.consultarGrilla(objetoEntrada);
    }

    public ObjetoSalida actualizarUsuario(UsuarioOE objetoEntrada) {

        accesoDatos = new UsuarioDAO();
        return accesoDatos.actualizarUsuario(objetoEntrada);
    }

    public ObjetoSalida eliminarUsuario(UsuarioOE objetoEntrada) {

        accesoDatos = new UsuarioDAO();
        return accesoDatos.eliminarUsuario(objetoEntrada);
    }
    
    public ObjetoSalida validar(String xml) throws JAXBException{
        accesoDatos = new UsuarioDAO();
        JAXBContext jc = JAXBContext.newInstance(UsuarioVitalOE.class);

        StringReader reader = new StringReader(xml.replaceAll("&", ""));
        
        Unmarshaller unmarshaller = jc.createUnmarshaller();
        Object result = unmarshaller.unmarshal(reader);
        UsuarioVitalOE user = null;
        if(result instanceof UsuarioVitalOE) {
            user = (UsuarioVitalOE) result;
        }
        String tokenRecibido = user.datosSeguridad.token;
        int resul = SeguridadAdaptador.ValidarToken(tokenRecibido, ParametroAdaptador.GetParametro("LLAVEENC_SIAC"));
        ObjetoSalida objetoSalida = new ObjetoSalida();
        if ( resul != 0 ) {
            System.out.println("VALIDACION DE TOKEN INCORRECTA (" + resul + ")");
            
        }
        UsuarioOE OE = new UsuarioOE();
        IvetT002Usuario usuario = new IvetT002Usuario();
        usuario.setA002usuario(user.datosConexion.aliasUsuarioDestino);
        OE.setUsuario(usuario);
        OE.setIdUsuario(0);
        
        
        //OE.setUsername(user.datosConexion.aliasUsuarioDestino);
        //OE.setClave(user.datosConexion.aliasUsuarioDestino);
        return accesoDatos.validarUsuarioVital(OE);
    }
    
    public ObjetoSalida registrarUsuarioVital(OE_Autenticar OE){
        accesoDatos = new UsuarioDAO();
        UsuarioOE OEE = new UsuarioOE();
        IvetT002Usuario usuario = new IvetT002Usuario();
        usuario.setA002usuario(OE.aliasUsuario);
        usuario.setA002contrasena(OE.clave);
        OEE.setUsuario(usuario);
        OEE.setIdUsuario(0);
        
        ObjetoSalida objetoSalida = accesoDatos.validarUsuario(OEE); 
        
        return objetoSalida;
    }
    
    public OS_ConsultarFuncionarios listarUsuarioVital(OE_ConsultarFuncionarios OE){
        accesoDatos = new UsuarioDAO();
        OS_ConsultarFuncionarios OS = new OS_ConsultarFuncionarios();
        BusquedaOE OEE = new BusquedaOE();
        OEE.setPalabraClave(OE.codAutoridadAmbiental);
        OEE.setIdUsuario(1);
        ObjetoSalida objetoSalida = accesoDatos.consultarGrilla(OEE); 
        List<Funcionario> lista =  new ArrayList<Funcionario>();       
        for (HashMap<String, Object> item : objetoSalida.getRespuesta()) {
            Funcionario func = new Funcionario();
            func.setAliasUsuario(item.get("A002USUARIO").toString());
            func.setCodigoTipoIdentificacion(Integer.parseInt(item.get("A002IDTIPODOCUMENTO").toString()));
            func.setDireccionCorreoElectronico(item.get("A002CORREOELECTRONICO").toString());
            func.setIdentificacionPersona(item.get("A002DOCUMENTO").toString());
            func.setNombreFuncionario(item.get("A002NOMBRE").toString() + " " + item.get("A002APELLIDO").toString() );
            lista.add(func);
        }
        OS.setFuncionarios(lista);
        OS.setCodigoError(objetoSalida.getCodError().getValor());
        OS.setMensajeError(objetoSalida.getMsgError());
        return OS;
    }
}
