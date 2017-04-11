package gov.mads.invent.comun.servicio.jwt;

public class JWTUsuario {

    private String codigo;
    private String username;
    private String nombre;
    private String perfil;
    private String car;
    private String primeravez;
    private Integer tiemposesion = 10;
    private Integer minexpiracion =240;

    public String getCodigo() {

        return codigo;
    }

    public void setCodigo(String codigo) {

        this.codigo = codigo;
    }

    public String getUserName() {

        return username;
    }

    public void setUserName(String username) {

        this.username = username;
    }

    public String getNombre() {

        return nombre;
    }

    public void setNombre(String nombre) {

        this.nombre = nombre;
    }

    public String getPerfil() {

        return perfil;
    }

    public void setPerfil(String perfil) {

        this.perfil = perfil;
    }

    public String getCar() {

        return car;
    }

    public void setCar(String car) {

        this.car = car;
    }

    public String getPrimeraVez() {

        return primeravez;
    }

    public void setPrimeraVez(String primeravez) {

        this.primeravez = primeravez;
    }

    public Integer getMinExpiracion() {

        return minexpiracion;
    }

    public void setMinExpiracion(Integer minexpiracion) {

        this.minexpiracion = minexpiracion;
    }

    public Integer getTiempoSesion() {
        return tiemposesion;
    }

    public void setTiempoSesion(Integer tiemposesion) {
        this.tiemposesion = tiemposesion;
    }
}
