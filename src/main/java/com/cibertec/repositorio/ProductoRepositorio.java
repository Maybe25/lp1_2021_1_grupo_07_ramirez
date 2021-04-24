package com.cibertec.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import com.cibertec.entidad.Producto;

/**
 * 
 * @author Ricardo Jesus Claros Paredes
 *
 */

public interface ProductoRepositorio extends JpaRepository<Producto, Integer> {

}
