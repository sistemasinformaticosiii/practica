package com.practica.si3.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.practica.si3.domain.CriterioBusqueda;
import com.practica.si3.domain.Oferta;
import com.practica.si3.jdbc.OfertaRowMapper;


public class OfertaDaoImpl implements OfertaDao {
	
	@Autowired
	DataSource dataSource;
	
	private static Logger log = Logger.getLogger(OfertaDaoImpl.class);

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
				oferta.getDireccion(), oferta.getDescripcion(), oferta.getPlazasTotal(), oferta.getPlazasDisponibles(), oferta.getPrecio(), oferta.getDescuento(), oferta.getCodOferta()});
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
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		
		String sql = "select * from oferta where fechafin >= CURRENT_DATE AND fechainicio <= CURRENT_DATE AND plazasdisponibles > 0";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}
	
	
	/**
	 *  Obtiene un listado de ofertas por tipo de perfil, en base a los criterios fecha y plazas disponibles.
	 *  @param tipo - tipo de perfil
	 *  @return lista de ofertas del tipo "tipo" y que cumplen los criterios: fecha_inicio<=fecha_actual<=fecha_fin AND plazas disponibles>0
	 */
	public List<Oferta> getOfertaByPerfil(int tipo) {
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		String sql = "select * from oferta where codusuario =" + "'" + tipo + "'" + " AND " + "fechainicio <= CURRENT_DATE" + " AND " + "fechafin >= CURRENT_DATE" + " AND " + "plazasdisponibles > 0";
		log.info("Sentencia sql: " + sql);
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}


	public List<Oferta> getOfertaByProductoVigente(String tipo) {
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		String sql = "select * from oferta where tipo =" + "'" + tipo + "'" +  " AND " + "fechafin >= CURRENT_DATE" + " AND " + "plazasdisponibles > 0";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}

	
	
	/**
	 * Obtiene un listado de ofertas que cumplen los criteros.
	 * @param criterioBusqueda - todos los parametros agrupados en un objeto
	 * @return lista de ofertas que cumplen con los criterios anteriores.
	 */
	public List<Oferta> filterOferta(CriterioBusqueda criterioBusqueda) {
		
//		Herramienta para cambiar el formato de la fecha
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		String where = "";
		if (criterioBusqueda.getTipo()!="") {
			if(!criterioBusqueda.getTipo().equals("Todas")){
				where = where + " tipo = " + "'" + criterioBusqueda.getTipo() + "'" + " AND ";	
			}
			
		}
		if (criterioBusqueda.getLocalidad()!="") {
			where = where + " UPPER(localidad) = " + "'" + criterioBusqueda.getLocalidad().toUpperCase() + "'" + " AND ";
		}
		
		if (criterioBusqueda.getPrecio()!=0) {
			where = where + " precio <= " + criterioBusqueda.getPrecio() + " AND ";
		}

// Modificaciones del código anterior para que si no se introduce fecha ninguna como criterio de búsqueda, coja la fecha de hoy.
//		Introduzco las modificaciones que sugirió Miguel Angel a la fecha df.format formatea la fecha a texto
		String mifecha="";
		if(criterioBusqueda.getFecha() != null)		{
			mifecha= df.format(criterioBusqueda.getFecha());			
		}
		else{
			Date today = new Date();
			mifecha = df.format(today);
		}
		String sql = "select * from oferta where" + where + " fechainicio <= " + "'" + mifecha + "'" + " AND " +  "'" + mifecha + "'" + "<= fechafin" + " AND " + "plazasdisponibles > " + criterioBusqueda.getPlazas();
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList;
	}

	/**
	 * Disminuye el campo plazasdisponibles del registro id  en un numero "number" de plazas de la tabla Oferta
	 * @param id - identificador de oferta
	 * @param number - numero de plazas a disminuir
	 */
	public void decreasePlazasDisponibles(int id, int number) {
		
		String sql = "UPDATE oferta set plazasdisponibles = plazasdisponibles - " + number + "where codoferta = " + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(sql);
	}
	
	/**
	 * Incrementa el campo plazasdisponibles del registro id en un numero "number" de plazas de la tabla Oferta.
	 * @param id - identificador de oferta
	 * @param number - numero de plazas a incrementar
	 */
	public void increasePlazasDisponibles(int id, int number) {
		
		String sql = "UPDATE oferta set plazasdisponibles = plazasdisponibles + " + number + "where codoferta = " + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(sql);	
	}
	
	
	public Oferta getOferta(String id) {
		
		List<Oferta> ofertaList = new ArrayList<Oferta>();
		String sql = "select * from oferta where codoferta= " + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		ofertaList = jdbcTemplate.query(sql, new OfertaRowMapper());
		return ofertaList.get(0);
	}
}
