package com.gestion.vols.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gestion.vols.entities.Passager;

@Repository
public interface PassagerDAO extends JpaRepository<Passager, Integer>{
	
	public Passager findByCin(String cin);

}
