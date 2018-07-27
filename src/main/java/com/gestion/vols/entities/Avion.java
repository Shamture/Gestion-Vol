package com.gestion.vols.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity

public class Avion {

	@Id
	@Column(name = "idAvion")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "code",unique=true, nullable = false, columnDefinition = "VARCHAR(50)")
	private String code;
	@Column(name = "nb_places", nullable = false)
	private Integer nbPlaces;
	private String type;
	private String etat;
	
	@OneToMany(mappedBy="avion",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	private Set<Vol> vols;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getNbPlaces() {
		return nbPlaces;
	}
	public void setNbPlaces(Integer nbPlaces) {
		this.nbPlaces = nbPlaces;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}
	@Override
	public String toString() {
		return "Avion [id=" + id + ", code=" + code + ", nbPlaces=" + nbPlaces + ", type=" + type + ", etat=" + etat
				+ ", vols=" + vols + "]";
	}
	
	
	
	
	
}
