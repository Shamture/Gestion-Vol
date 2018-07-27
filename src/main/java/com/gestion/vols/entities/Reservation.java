package com.gestion.vols.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Reservation {

	@Id
	@Column(name = "idReservation")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "etat", nullable = false, columnDefinition = "VARCHAR(15)")
	private String etat;
	
	private Integer place;
	@ManyToOne
	@JoinColumn(name="idPassager")
	private Passager passager;
	
	@ManyToOne
	@JoinColumn(name="idVol")
	private Vol vol;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public Passager getPassager() {
		return passager;
	}

	public void setPassager(Passager passager) {
		this.passager = passager;
	}

	public Vol getVol() {
		return vol;
	}

	public void setVol(Vol vol) {
		this.vol = vol;
	}

	public Integer getPlace() {
		return place;
	}

	public void setPlace(Integer place) {
		this.place = place;
	}
	
	

}
