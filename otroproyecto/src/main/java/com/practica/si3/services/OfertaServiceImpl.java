package com.practica.si3.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import com.practica.si3.dao.OfertaDao;
import com.practica.si3.domain.Oferta;


public class OfertaServiceImpl implements OfertaService {
	
	@Autowired
	OfertaDao ofertaDao;
	
	@Autowired
	public void insertData(Oferta oferta) {
		
		ofertaDao.insertData(oferta);
	}

	@Autowired
	public List<Oferta> getOfertaList() {
		
		return ofertaDao.getOfertasList();
	}
}
