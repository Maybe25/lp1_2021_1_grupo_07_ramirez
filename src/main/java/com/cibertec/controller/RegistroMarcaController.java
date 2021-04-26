package com.cibertec.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Marca;
import com.cibertec.entidad.Pais;
import com.cibertec.servicio.MarcaServicio;
import com.cibertec.servicio.PaisServicio;

/**
 * 
 * @author JOSE JUNIOR ALARCON CASALI
 *
 */
@Controller
public class RegistroMarcaController {
	
	@Autowired
	private MarcaServicio marcaServicio;
	
	@Autowired
	private PaisServicio paisServicio;
	
	@ResponseBody
	@RequestMapping("/listaPais")
	public List<Pais> listaPais(){
		return	paisServicio.listaPais();
	}
	
	@ResponseBody
	@RequestMapping("/insertarMarca")
	public Map<String,Object> insertarMarca(Marca obj){
	     Map<String,Object> salida= new HashMap<>();
	     
	     Marca objSalida = marcaServicio.insertarMarca(obj);
	     if (objSalida == null) {
	    	 salida.put("MENSAJE", "REGISTRO INCORRECTO ");
			
		}else {
			salida.put("MENSAJE", "REGISTRO EXITOSO");
		}
	   
	     return salida;
	}
	

}
	
