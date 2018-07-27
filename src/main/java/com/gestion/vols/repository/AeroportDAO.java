package com.gestion.vols.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gestion.vols.entities.Aeroport;

@Repository
public interface AeroportDAO  extends JpaRepository<Aeroport, Integer>{

}
