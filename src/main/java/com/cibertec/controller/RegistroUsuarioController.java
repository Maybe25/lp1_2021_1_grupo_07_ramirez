package com.cibertec.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Ubigeo;
import com.cibertec.entidad.Usuario;
import com.cibertec.servicio.UbigeoServicio;
import com.cibertec.servicio.UsuarioServicio;

/**
 * 
 * @author JULIO RAMIREZ
 *
 */

@Controller
public class RegistroUsuarioController {
	
	@Autowired
	private UsuarioServicio usuarioServicio;
	
	@Autowired
	private UbigeoServicio ubigeoServicio;
	
	
	
	
	@RequestMapping("/listaUbigeo")
	@ResponseBody
	public List<Ubigeo>listaUbigeo(){
		return ubigeoServicio.listaUbigeo();
	}
	
	
	@RequestMapping("/insertaUsuario")
	@ResponseBody
	public Map<String,Object> insertaUsuario(Usuario obj) {
		Map<String,Object> salida = new HashMap<>();
		
		obj.setFechaRegistro(new Date());
		Usuario objSalida = usuarioServicio.insertaUsuario(obj);
		if(objSalida == null) {
			salida.put("MENSAJE", "REGISTRO INVALIDO");
		}else {
			salida.put("MENSAJE", "REGISTRO EXISTOSO");
		}
		
		return salida;
	}

}
