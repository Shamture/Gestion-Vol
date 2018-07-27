package com.gestion.vols.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Escale {

	@Id
	@Column(name = "idEscale")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	@ManyToOne
	@JoinColumn(name="idVol")
	private Vol vol;
	
	@ManyToOne
	@JoinColumn(name="aeroport")
	private Aeroport aeroport;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Vol getVol() {
		return vol;
	}

	public void setVol(Vol vol) {
		this.vol = vol;
	}

	public Aeroport getAeroport() {
		return aeroport;
	}

	public void setAeroport(Aeroport aeroport) {
		this.aeroport = aeroport;
	}
	
	
	
	
	
}
