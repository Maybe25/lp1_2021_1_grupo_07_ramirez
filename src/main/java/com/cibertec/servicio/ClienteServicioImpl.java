package com.cibertec.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Cliente;
import com.cibertec.repositorio.ClienteRepositorio;

/**
 * 
 * @author Wilmer Negron
 *
 */
@Service
public class ClienteServicioImpl implements ClienteServicio {
   
	@Autowired
	private ClienteRepositorio repositorio;
	
	@Override
	public Cliente insertaCliente(Cliente obj) {
 		return repositorio.save(obj);
	}

}
