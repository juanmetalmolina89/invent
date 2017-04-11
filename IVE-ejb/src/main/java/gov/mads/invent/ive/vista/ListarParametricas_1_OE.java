package gov.mads.invent.ive.vista;
import gov.mads.invent.comun.vista.ObjetoEntrada;


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ivan Chacon
*/
@XmlRootElement
public class ListarParametricas_1_OE extends ObjetoEntrada {

	@XmlElement
	private String Categoria;
	@XmlElement
	private Integer idUsuario;

	public String getCategoria(){
		return this.Categoria;
	}

	public void setCategoria(String in){
		this.Categoria = in;
	}
	public Integer getidUsuario(){
		return this.idUsuario;
	}

	public void setidUsuario(Integer in){
		this.idUsuario = in;
	}

}
