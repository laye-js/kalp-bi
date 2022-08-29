package com.kalpébi;

public class compte {
String nom;
String prenom;
String mdp;
int solde;
int id;

public compte(String nom, String prenom, String mdp, int solde, int id) {
	super();
	this.nom = nom;
	this.prenom = prenom;
	this.mdp = mdp;
	this.solde = solde;
	this.id = id;
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
public String getMdp() {
	return mdp;
}
public void setMdp(String mdp) {
	this.mdp = mdp;
}
public int getSolde() {
	return solde;
}
public void setSolde(int solde) {
	this.solde = solde;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}

}
