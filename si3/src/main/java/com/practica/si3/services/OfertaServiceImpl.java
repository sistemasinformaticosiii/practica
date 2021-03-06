package com.practica.si3.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.practica.si3.dao.OfertaDao;
import com.practica.si3.domain.CriterioBusqueda;
import com.practica.si3.domain.Oferta;

public class OfertaServiceImpl implements OfertaService {
	
	@Autowired
	OfertaDao ofertaDao;
	
	@Override
	public void insertData(Oferta oferta) {
		
		ofertaDao.insertData(oferta);
	}
	
	@Override
	public Oferta getOferta(String id) {
		return ofertaDao.getOferta(id);
	}

	@Override
	public List<Oferta> getOfertaList() {
		return ofertaDao.getOfertasList();
	}
	
	@Override
	public List<Oferta> getOfertaListAll() {
		return ofertaDao.getOfertasListAll();
	}
	
	@Override
	public void updateData(Oferta oferta) {
		ofertaDao.updateData(oferta);
		
	}
	
	@Override
	public void deleteData(String id) {
		ofertaDao.deleteData(id);
		
	}
	
	@Override
	public List<Oferta> getOfertaByPerfil(int id) {
		
		return ofertaDao.getOfertaByPerfil(id);
	}
	
	@Override
	public List<Oferta> getOfertaByProductoVigente(String id) {
		
		return ofertaDao.getOfertaByProductoVigente(id);
	}
	
	@Override
	public List<Oferta> filterOferta(CriterioBusqueda criterioBusqueda){
		
		return ofertaDao.filterOferta(criterioBusqueda);
	}
	
	@Override
	public void decreasePlazasDisponibles(int id, int number) {
		ofertaDao.decreasePlazasDisponibles(id, number);
	}
	
	@Override
	public void increasePlazasDisponibles(int id, int number) {
		ofertaDao.increasePlazasDisponibles(id, number);
	}

}
