package com.cibertec.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;
import com.cibertec.servicio.ClienteServicio;

 
/**
 * 
 * @author Wilmer Negron
 *
 */
@Controller
public class RegistroClienteController {
	
	@Autowired
	private ClienteServicio clienteServicio;

	

	 
	@ResponseBody
	@RequestMapping("/insertaCliente")
	public Map<String, Object> insertaCliente(Cliente obj){
		Map<String, Object> salida = new HashMap<>();
		
		Cliente objSalida = clienteServicio.insertaCliente(obj);
		if (objSalida== null) {
			salida.put("MENSAJE", "Registro erróneo");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
			
		}
		return salida;
	}
}
