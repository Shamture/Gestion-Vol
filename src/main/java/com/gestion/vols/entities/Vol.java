package com.gestion.vols.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.springframework.web.bind.annotation.Mapping;

@Entity
public class Vol {

	@Id
	@Column(name = "idVol")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "depart", nullable = false, columnDefinition = "DATETIME")
	private String depart;
	@Column(name = "arrive", nullable = false, columnDefinition = "DATETIME")
	private String arrivee;

	@Column(name = "prix", nullable = false, columnDefinition = "DOUBLE")
	private Double prix;

	
	@ManyToOne
	@JoinColumn(name = "idAvion")
	private Avion avion;

	@OneToMany(mappedBy = "vol", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<Reservation> reservations;

	@OneToMany(mappedBy = "vol", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<Escale> escales;

	@ManyToOne
	@JoinColumn(name = "aeroport_depart")
	private Aeroport aeroportDepart;
	@ManyToOne
	@JoinColumn(name = "aeroport_arrivee")
	private Aeroport aeroportArrivee;

	@Transient
	private String escalesString;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getArrivee() {
		return arrivee;
	}

	public void setArrivee(String arrivee) {
		this.arrivee = arrivee;
	}

	public Double getPrix() {
		return prix;
	}

	public void setPrix(Double prix) {
		this.prix = prix;
	}

	public Avion getAvion() {
		return avion;
	}

	public void setAvion(Avion avion) {
		this.avion = avion;
	}

	public Set<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(Set<Reservation> reservations) {
		this.reservations = reservations;
	}

	public Set<Escale> getEscales() {
		return escales;
	}

	public void setEscales(Set<Escale> escales) {
		this.escales = escales;
	}

	public Aeroport getAeroportDepart() {
		return aeroportDepart;
	}

	public void setAeroportDepart(Aeroport aeroportDepart) {
		this.aeroportDepart = aeroportDepart;
	}

	public Aeroport getAeroportArrivee() {
		return aeroportArrivee;
	}

	public void setAeroportArrivee(Aeroport aeroportArrivee) {
		this.aeroportArrivee = aeroportArrivee;
	}

	public String getEscalesString() {
		return escalesString;
	}

	public void setEscalesString(String escalesString) {
		this.escalesString = escalesString;
	}

}
