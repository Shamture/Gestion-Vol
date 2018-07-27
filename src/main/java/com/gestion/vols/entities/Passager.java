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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Passager {

	@Id
	@Column(name = "idPassager")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "cin", unique = true, nullable = false, columnDefinition = "VARCHAR(20)")
	private String cin;
	
	@Column(name = "type_carte", nullable = false, columnDefinition = "VARCHAR(20)")
	private String typeCarte;
	
	@Column(name = "nom", nullable = false, columnDefinition = "VARCHAR(30)")
	private String nom;
	
	@Column(name = "prenom", nullable = false, columnDefinition = "VARCHAR(30)")
	private String prenom;
	
	@Column(name = "bidth_date", nullable = false, columnDefinition = "DATE")
	private String birthDate;
	
	@Column(name = "sexe", nullable = false, columnDefinition = "VARCHAR(10)")
	private String sexe;
	@Column(name = "email", unique = true, nullable = false, columnDefinition = "VARCHAR(50)")
	private String email;
	@Column(name = "tel", unique = true, nullable = false, columnDefinition = "VARCHAR(20)")
	private String tel;
	
	@JsonIgnore
	@OneToMany(mappedBy="passager",fetch = FetchType.EAGER,cascade = CascadeType.ALL)
	private Set<Reservation> reservations;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public String getTypeCarte() {
		return typeCarte;
	}

	public void setTypeCarte(String typeCarte) {
		this.typeCarte = typeCarte;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Set<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(Set<Reservation> reservations) {
		this.reservations = reservations;
	}

	@Override
	public String toString() {
		return "Passager [id=" + id + ", cin=" + cin + ", typeCarte=" + typeCarte + ", nom=" + nom + ", prenom="
				+ prenom + ", birthDate=" + birthDate + ", sexe=" + sexe + ", email=" + email + ", tel=" + tel + "]";
	}
	
	

}
