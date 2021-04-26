package com.cibertec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Ubigeo;
import com.cibertec.servicio.UbigeoServicio;

@Controller
public class UbigeoController {
	
	@Autowired
	private UbigeoServicio ubigeoService;

	@RequestMapping("/verUbigeo")
	public String verUbigeo() {
		return "ubigeoJquery";
	}
	
	@RequestMapping("/listaDepartamentos")
	@ResponseBody
	public List<String> verDepartamentos() {
		return ubigeoService.listaDepartamentos();
	}
	
	@RequestMapping("/listaProvincias")
	@ResponseBody
	public List<String> verProvincias(String departamento) {
		return ubigeoService.listaProvincias(departamento);
	}
	
	@RequestMapping("/listaDistritos")
	@ResponseBody
	public List<Ubigeo> verDistritos(String departamento, String provincia) {
		return ubigeoService.listaDistritos(departamento, provincia);
	}
}

