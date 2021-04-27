package com.cibertec.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Proveedor;
import com.cibertec.repositorio.ProveedorRepositorio;


@Service
public class ProveedorServicioImpl implements ProveedorServicio {
	
	
	@Autowired
	private ProveedorRepositorio repositorio;

	@Override
	public Proveedor insertaProveedor(Proveedor obj) {
				
		return repositorio.save(obj);
	}

}
