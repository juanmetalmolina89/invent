package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.PartT105Divipola;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Eliminar_3_OE extends ObjetoEntrada {

	@XmlElement
	private PartT105Divipola partT105Divipola;

	@XmlElement
	private Integer idUsuario;

	public PartT105Divipola getPartT105Divipola(){
		return this.partT105Divipola;
	}

	public void setPartT105Divipola(PartT105Divipola in){
		this.partT105Divipola = in;
	}
	public Integer getidUsuario(){
		return this.idUsuario;
	}

	public void setidUsuario(Integer in){
		this.idUsuario = in;
	}

}
