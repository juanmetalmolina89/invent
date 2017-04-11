package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.IvetT009Categemision;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Actualizar_7_OE extends ObjetoEntrada {

	@XmlElement
	private IvetT009Categemision ivetT009Categemision;

	@XmlElement
	private Integer idUsuario;

	public IvetT009Categemision getIvetT009Categemision(){
		return this.ivetT009Categemision;
	}

	public void setIvetT009Categemision(IvetT009Categemision in){
		this.ivetT009Categemision = in;
	}
	public Integer getidUsuario(){
		return this.idUsuario;
	}

	public void setidUsuario(Integer in){
		this.idUsuario = in;
	}

}
