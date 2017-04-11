package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class ConsultarPorFiltro_7_OE extends ObjetoEntrada {

	@XmlElement
	private String Filtro;
	@XmlElement
	private Integer idUsuario;

	public String getFiltro(){
		return this.Filtro;
	}

	public void setFiltro(String in){
		this.Filtro = in;
	}
	public Integer getidUsuario(){
		return this.idUsuario;
	}

	public void setidUsuario(Integer in){
		this.idUsuario = in;
	}

}
