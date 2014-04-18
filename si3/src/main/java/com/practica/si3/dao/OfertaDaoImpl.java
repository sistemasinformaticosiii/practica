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
			oferta.getFechaFin(), oferta.getLocalidad().toUpperCase(), oferta.getDireccion(), oferta.getDescripcion(), oferta.getPlazasTotal(), oferta.getPlazasDisponibles(),
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

	/**
	 * Obtiene un listado de todas las ofertas existentes en la BD.
	 * @return listado de ofertas obtenido de la BD.
	 */
	public List<Oferta> getOfertasList() {
		
		List ofertaList = new ArrayList();
		
		String sql = "select * from oferta";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}
	
	
	/**
	 *  Obtiene un listado de ofertas por tipo de producto, en base a los criterios fecha y plazas disponibles.
	 *  @param tipo - tipo de oferta
	 *  @return lista de ofertas del tipo "tipo" y que cumplen los criterios: fecha_inicio<=fecha_actual<=fecha_fin AND plazas disponibles>0
	 */
	public List<Oferta> getOfertaByProducto(String tipo) {
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		String sql = "select * from oferta where tipo =" + "'" + tipo + "'" + " AND " + "fechainicio <= CURRENT_DATE" + " AND " + "fechafin >= CURRENT_DATE" + " AND " + "plazasdisponibles > 0";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}
	
	/**
	 * Obtiene un listado de ofertas que cumplen los criteros.
	 * @param tipo - tipo de la oferta. Si tipo="", se considera cualquier tipo.
	 * @param localidad - localidad donde esta publicada la oferta. Si localidad="", se considera cualquier localidad.
	 * @param fecha - fecha vigencia de la oferta
	 * @param precio - precio maximo de la oferta. Si precio=0, se considera cualquier precio.
	 * @param plazas - numero minimo de plazas disponibles de la oferta
	 * @return lista de ofertas que cumplen con los criterios anteriores.
	 */
	public List<Oferta> filterOferta(String tipo, String localidad, String fecha, int precio, int plazas) {
		
		List<Oferta> ofertaList = new ArrayList<>();
		String where = "";
		if (tipo!="") {
			where = where + " tipo = " + "'" + tipo + "'" + " AND ";
		}
		if (localidad!="") {
			where = where + " localidad = " + "'" + localidad + "'" + " AND ";
		}
		
		if (precio!=0) {
			where = where + " precio <= " + precio + " AND ";
		}
		String sql = "select * from oferta where" + where + " fechainicio <= " + "'" + fecha + "'" + " AND " +  "'" + fecha + "'" + "<= fechafin" + " AND " + "plazasdisponibles >= " + plazas;
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
