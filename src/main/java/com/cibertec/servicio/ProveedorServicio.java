package com.cibertec.servicio;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.cibertec.entidad.Opcion;
import com.cibertec.entidad.Rol;
import com.cibertec.entidad.Proveedor;

public interface ProveedorServicio {
	
	
	public abstract Proveedor insertaProveedor(Proveedor obj);
	
	
	

}
