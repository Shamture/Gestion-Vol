package com.gestion.vols.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gestion.vols.entities.User;

@Repository
public interface UserDAO extends JpaRepository<User, Integer>{

	public User findByLogin(String login); 
	
	public User findByEmail(String email);
	
	public List<User> findByType(String type);
	
}
