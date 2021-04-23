package com.cibertec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Proveedor;
import com.cibertec.entidad.Ubigeo;
import com.cibertec.repositorio.ProveedorRepositorio;
import com.cibertec.servicio.ProveedorServicio;
import com.cibertec.servicio.UbigeoServicio;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * 
 * @author Renato
 *
 */


@Controller
public class RegistroProvedorController {
	
	@Autowired
	private ProveedorServicio  proveedorServicio;
	
	@Autowired
	private UbigeoServicio  ubigeoServicio ;

	@RequestMapping("/listaUbigeo")
	@ResponseBody
	public List<Ubigeo> listaubigeo(){
		return ubigeoServicio.listaUbigeo();
		
	}
	
	
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
