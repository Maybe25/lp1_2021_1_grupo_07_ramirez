package com.cibertec.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Proveedor;
import com.cibertec.servicio.ProveedorServicio;
/**
 * 
 * @author Renato
 *
 */


@Controller
public class RegistroProvedorController {
	
	@Autowired
	private ProveedorServicio  proveedorServicio;
	

	
	@RequestMapping("/insertaProveedor")
	@ResponseBody
	public Map<String, Object>  insertaProveedor(Proveedor obj){
		Map<String, Object> salida = new HashMap<>();
		proveedorServicio.insertaProveedor(obj);
		
		Proveedor objSalida = proveedorServicio.insertaProveedor(obj);
		if(objSalida == null) {
			
			salida.put("MENSAJE","Registro erroneo");
		} else {
			
			salida.put("MENSAJE", "REGISTRO EXISTOSO");
		}
		
		return salida;
		
	}
}
