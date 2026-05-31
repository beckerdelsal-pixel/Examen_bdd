package com.krakedev.examen.vuelos.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.krakedev.examen.vuelos.entities.Vuelo;

public interface VueloRepositorio extends JpaRepository<Vuelo, Long> {
	List<Vuelo> findByAsientosDisponiblesLessThan(Integer asientos);
}
