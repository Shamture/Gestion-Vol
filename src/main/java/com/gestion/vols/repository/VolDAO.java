package com.gestion.vols.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.gestion.vols.entities.Vol;

@Repository
public interface VolDAO extends JpaRepository<Vol, Integer>{

	@Query("SELECT v FROM Vol v WHERE v.depart >= :minDate and v.depart <= :maxDate")
	public List<Vol> findVolWithSearch(@Param("minDate") String minDate,@Param("maxDate") String maxDate);
	@Query("SELECT v FROM Vol v WHERE v.depart >= CURRENT_DATE")
	public List<Vol> getUpCominVols();
	
}
