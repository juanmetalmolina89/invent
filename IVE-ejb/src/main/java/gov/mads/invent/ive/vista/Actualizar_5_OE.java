package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.IvetT014Adjunto;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Actualizar_5_OE extends ObjetoEntrada {

	@XmlElement
	private IvetT014Adjunto ivetT014Adjunto;

	@XmlElement
	private Integer idUsuario;

	public IvetT014Adjunto getIvetT014Adjunto(){
		return this.ivetT014Adjunto;
	}

	public void setIvetT014Adjunto(IvetT014Adjunto in){
		this.ivetT014Adjunto = in;
	}
	public Integer getidUsuario(){
		return this.idUsuario;
	}

	public void setidUsuario(Integer in){
		this.idUsuario = in;
	}

}
