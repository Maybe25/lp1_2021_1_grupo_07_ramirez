package com.cibertec.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cibertec.entidad.Marca;

public interface MarcaRepositorio extends JpaRepository<Marca, Integer> {

}
