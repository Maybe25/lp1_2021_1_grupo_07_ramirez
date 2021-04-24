package com.cibertec.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//LIBRERIAS NESESARIAS
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cibertec.entidad.Marca;
import com.cibertec.entidad.Pais;
import com.cibertec.entidad.Producto;
import com.cibertec.servicio.MarcaServicio;
import com.cibertec.servicio.PaisServicio;
import com.cibertec.servicio.ProductoServicio;

/**
 * 
 * @author RICARDO JESUS CLAROS PAREDES
 *
 */
public class RegistroProductoController {
	
	@Autowired
	private ProductoServicio productoServicio;
	
	//PARA LLAVES FORANEAS
	@Autowired
	private MarcaServicio marcaServicio;
	@Autowired
	private PaisServicio paisServicio;
	
	//METODO PARA PAIS SERVICIO
	@ResponseBody
	@RequestMapping("/listaPais")
	public List<Pais> listaPais(){
		return	paisServicio.listaPais();
	}
	
	
	//METODO PARA MARCA SERVICIO
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
	
	//METODO PARA PRODUCTO SERVICIO
	@ResponseBody
	@RequestMapping("/insertaProducto")
	public Map<String,Object> insertaProducto(Producto obj){
		Map<String,Object> salida= new HashMap<>();
		
		Producto objSalida = productoServicio.insertaProducto(obj);
		if(objSalida == null) {
			salida.put("MENSAJE","REGISTRO INCORRECTO");
		}else {
			salida.put("MENSAJE","REGISTRO EXITOSO");
		}
		return salida;
	}
 
}
