# Inventario Emisiones

## Herramientas

- Java 1.8.0+
- NetBeans 8.1
- Apache Maven 3.3.9
- Bower 1.8.0
- JBoss EAP 7.0 (WildFly) en (C:\jboss-eap-7.0)
- Git 2.10.0
- Descargar JDBC ojdbc7 de la página oficial de Oracle

## Configuración

- Conexión al repositorio https://github.com/jbarreras/invent.git y descargar las fuentes localmente
- Importar el proyecto con NetBeans BarMenu->Team->Git->Clone
- Configurar servidor de aplicación Jboss BarMenu->Tools->Add Server->WildFly Application Server
- Registrar ojdbc7.jar en maven con el comando -> mvn install:install-file -Dfile="X:\XXX\ojdbc7.jar" -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar
- Ajustar la cadena de conexion "mads.config" ó invent.Conexion.xml
- ContextMenu->Bower Install
- ContextMenu->Clean & Build
- ContextMenu->Run