package com.cibertec.servicio;

//LIBRERIAS NESESARIAS
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cibertec.entidad.Producto;
import com.cibertec.repositorio.ProductoRepositorio;

/**
 * 
 * @author Ricardo Jesus Claros Paredes
 *
 */

@Service
public class ProductoServiciolmpl implements ProductoServicio {
	
	@Autowired
	private ProductoRepositorio repositorio;
	@Override
	public Producto insertaProducto (Producto obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

}
