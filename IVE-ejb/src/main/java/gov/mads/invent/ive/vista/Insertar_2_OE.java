package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;

import gov.mads.invent.comun.entidad.SistT998Excepcion;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class Insertar_2_OE extends ObjetoEntrada {

	@XmlElement
	private SistT998Excepcion sistT998Excepcion;


	public SistT998Excepcion getSistT998Excepcion(){
		return this.sistT998Excepcion;
	}

	public void setSistT998Excepcion(SistT998Excepcion in){
		this.sistT998Excepcion = in;
	}

}
