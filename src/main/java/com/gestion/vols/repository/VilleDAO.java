package com.gestion.vols.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gestion.vols.entities.Ville;

@Repository
public interface VilleDAO extends JpaRepository<Ville, Integer>{

}
