package com.gestion.vols.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gestion.vols.entities.Reservation;

@Repository
public interface ReservationDAO extends JpaRepository<Reservation, Integer>{

	public List<Reservation> findByEtat(String etat);
	
	
	
}
