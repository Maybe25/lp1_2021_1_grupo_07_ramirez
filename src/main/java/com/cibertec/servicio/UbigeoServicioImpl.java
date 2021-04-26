package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Ubigeo;
import com.cibertec.repositorio.UbigeoRepositorio;


@Service
public class UbigeoServicioImpl implements UbigeoServicio{
	
	
	
	/**
	 * 
	 * @author Grupo 7
	 *
	 */
	
	
	@Autowired
	private UbigeoRepositorio repositorio;

	@Override
	public List<Ubigeo> listaUbigeo() {
		return repositorio.findAll();
	}
	
	@Override
	public List<String> listaDepartamentos() {
		return repositorio.listaDepartamentos();
	}

	@Override
	public List<String> listaProvincias(String departamento) {
		return repositorio.listaProvincias(departamento);
	}

	@Override
	public List<Ubigeo> listaDistritos(String departamento, String provincia) {
		return repositorio.listaDistritos(departamento, provincia);
	}
	
}
