package com.practica.si3.domain;



public class Oferta {

    private int codOferta;
    private int codUsuario;
    private String tipo;
    private String categoria;
    private String titulo;
    private String fechaInicio;
    private String fechaFin;
    private String localidad;
    private String direccion;
    private String descripcion;
    private int plazasTotal;
    private int plazasDisponibles;
    private double precio;
    private double descuento;

	public void setCodOferta(int codOferta) {
    	
    	this.codOferta = codOferta;
    }
    
    public int getCodOferta() {
    	
    	return codOferta;
    }
    
    public void setCodUsuario(int codUsuario) {
    	
    	this.codUsuario = codUsuario;
    }
    
    public int getCodUsuario() {
    	
    	return codUsuario;
    }
    
    public void setTipo(String tipo) {
    	
    	this.tipo = tipo;
    }
    
    public String getTipo() {
    	
    	return tipo;
    }
    
    public void setCategoria(String categoria) {
    	
    	this.categoria = categoria;
    }
    
    public String getCategoria() {
    	
    	return categoria;
    }
    
    public void setTitulo(String titulo) {
    	
    	this.titulo = titulo;
    }
    
    public String getTitulo() {
    	
    	return titulo;
    }
    
    public void setFechaInicio(String fechaInicio) {
    	
    	this.fechaInicio = fechaInicio;
    }
    
    public String getFechaInicio() {
    	
    	return fechaInicio;
    }
    
    public void setFechaFin(String fechaFin) {
    	
    	this.fechaFin = fechaFin;
    }
    
    public String getFechaFin() {
    	
    	return fechaFin;
    }
    
    public void setLocalidad(String localidad) {
    	
    	this.localidad = localidad;
    }
    
    public String getLocalidad() {
    	
    	return localidad;
    }
    
    public void setDireccion(String direccion) {
    	
    	this.direccion = direccion;
    }
    
    public String getDireccion() {
    	
    	return direccion;
    }
    
    public void setDescripcion(String descripcion) {
    	
    	this.descripcion = descripcion;
    }
    
    public String getDescripcion() {
    	
    	return descripcion;
    }
    
    public void setPlazasTotal(int plazasTotal) {
    	
    	this.plazasTotal = plazasTotal;
    }
    
    public int getPlazasTotal() {
    	
    	return plazasTotal;
    }
    
    public void setPlazasDisponibles(int plazasDisponibles) {
    	
    	this.plazasDisponibles = plazasDisponibles;
    }
    
    public int getPlazasDisponibles() {
    	
    	return plazasDisponibles;
    }
    
    public void setPrecio(double precio) {
    	
    	this.precio = precio;
    }
    
    public double getPrecio() {
    	
    	return precio;
    }
    
    public void setDescuento(double descuento) {
    	
    	this.descuento = descuento;
    }
    
    public double getDescuento() {
    	
    	return descuento;
    }
}
