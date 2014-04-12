package com.practica.si3.dao;

import javax.sql.DataSource;

import java.util.List;
import java.util.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.practica.si3.domain.Oferta;
import com.practica.si3.domain.User;
import com.practica.si3.jdbc.OfertaRowMapper;


public class OfertaDaoImpl implements OfertaDao {
	
	@Autowired
	DataSource dataSource;

	public void insertData(Oferta oferta) {
		
		String sql = "INSERT INTO oferta " 
			+ "(codUsuario,tipo,categoria, titulo,fechaInicio,fechaFin,localidad,direccion,descripcion,plazasTotal, plazasDisponibles,precio,descuento) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		jdbcTemplate.update(sql, new Object[] { oferta.getCodUsuario(), oferta.getTipo(), oferta.getCategoria(), oferta.getTitulo(), oferta.getFechaInicio(),		
			oferta.getFechaFin(), oferta.getLocalidad(), oferta.getDireccion(), oferta.getDescripcion(), oferta.getPlazasTotal(), oferta.getPlazasDisponibles(),
			oferta.getPrecio(), oferta.getDescuento() });
	}
	
	@Override
	public void updateData(Oferta oferta) {

		String sql = "UPDATE oferta set codusuario = ?, tipo = ?, categoria = ?, titulo = ?, fechainicio = ?, fechafin = ?, localidad = ?, direccion = ?, descripcion = ?,"
				+ "plazastotal = ?, plazasdisponibles = ?, precio = ?, descuento = ? where codoferta = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(sql, new Object[] { oferta.getCodUsuario(), oferta.getTipo(), oferta.getCategoria(), oferta.getTitulo(), oferta.getFechaInicio(), oferta.getFechaFin(), oferta.getLocalidad(),
				oferta.getDireccion(), oferta.getDescripcion(), oferta.getPlazasTotal(), oferta.getPlazasDisponibles(), oferta.getPrecio(), oferta.getDescuento(), oferta.getCodOferta() });
	}
	
	@Override
	public void deleteData(String id) {
		
		String sql = "delete from oferta where codoferta =" + id;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);

	}

	public List<Oferta> getOfertasList() {
		
		List ofertaList = new ArrayList();
		
		String sql = "select * from oferta";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}
	
	
	public List<Oferta> getOfertaByProducto(String tipo) {
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		String sql = "select * from oferta where tipo= " + tipo;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}
	
	public List<Oferta> getOfertaByLocalidad(String localidad) {
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		String sql = "select * from oferta where localidad= " + localidad;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;	
	}
	
	public List<Oferta> getOfertaByFecha(Date fecha) {
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		//afinar la consulta para devolver valores entre dos fechas
		String sql = "select * from oferta where fechainicio= " + fecha;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}
	
	public List<Oferta> getOfertaByPrecio(double precio) {
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		String sql = "select * from oferta where precio<= " + precio;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}
	
	public List<Oferta> getOfertaByPlazasDisponibles(int plazas) {
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		String sql = "select * from oferta where plazasdisponibles>= " + plazas;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}
	
	public Oferta getOferta(String id) {
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		String sql = "select * from oferta where codoferta= " + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList.get(0);
	}
	
}
