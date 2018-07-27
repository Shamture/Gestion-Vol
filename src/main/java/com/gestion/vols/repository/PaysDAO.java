package com.gestion.vols.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gestion.vols.entities.Pays;

@Repository
public interface PaysDAO extends JpaRepository<Pays, Integer>{

}
