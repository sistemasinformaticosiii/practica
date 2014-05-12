package com.practica.si3.domain;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;


/*CriterioBusqueda es un objeto para almacenar los criterios de busqueda
 * haciendo más clara su manipulación para no confundirlo con una oferta
*/

public class CriterioBusqueda {
	
	//@NotNull
	private String tipo;
//    private String titulo;
//  La fecha es un date que pasaremos a un string donde sea necesario  
	
	//@NotNull
    private Date fecha;
	
	//@NotNull
    private String localidad = "";
    
	//@Min(1) @Max(1000)
	private int precio = 0;
    
	//@Min(1) @Max(1000)
	private int plazas;
    
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	public int getPrecio() {
		return precio;
	}
	public void setPrecio(int precio) {
		this.precio = precio;
	}
	public String getLocalidad() {
		return localidad;
	}
	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}
	public int getPlazas() {
		return plazas;
	}
	public void setPlazas(int plazas) {
		this.plazas = plazas;
	}
    
}
