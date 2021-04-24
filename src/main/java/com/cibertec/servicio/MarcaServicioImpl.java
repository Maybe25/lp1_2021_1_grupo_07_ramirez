package com.cibertec.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Marca;
import com.cibertec.repositorio.MarcaRepositorio;
/**
 * 
 * @author JOSE JUNIOR
 *
 */
@Service
public class MarcaServicioImpl implements MarcaServicio {

	@Autowired
	private MarcaRepositorio repositorio;
	
	@Override
	public Marca insertarMarca(Marca obj) {
		return repositorio.save(obj);
	}
	
	
	

}
