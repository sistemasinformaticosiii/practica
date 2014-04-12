package com.practica.si3.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.practica.si3.dao.OfertaDao;
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
	public void updateData(Oferta oferta) {
		ofertaDao.updateData(oferta);
		
	}
	
	@Override
	public void deleteData(String id) {
		ofertaDao.deleteData(id);
		
	}
}
