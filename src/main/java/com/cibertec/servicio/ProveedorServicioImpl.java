package com.cibertec.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cibertec.entidad.Proveedor;
import com.cibertec.repositorio.ProveedorRepositorio;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.cibertec.entidad.Opcion;
import com.cibertec.entidad.Rol;


@Service
public class ProveedorServicioImpl implements ProveedorServicio {
	
	
	@Autowired
	private ProveedorRepositorio repositorio;

	@Override
	public Proveedor insertaProveedor(Proveedor obj) {
				
		return repositorio.save(obj);
	}

}
