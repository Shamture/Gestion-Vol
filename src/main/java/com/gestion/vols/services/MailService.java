package com.gestion.vols.services;

import com.gestion.vols.entities.Passager;
import com.gestion.vols.entities.User;
import com.gestion.vols.entities.Vol;

public interface MailService {

	public boolean send(String mail, String sujet, String answer);
	public void sendAccountConfirmationMessage(User user);
	public void sendVolUpdateMessage(String mail,String phone ,Vol vol);
	public void sendAccountRefusalMessage(User user);
	public void sendReservationConfirmMessage(Passager pass,Vol vol);
	public void sendReservationDenialMessage(Passager pass,Vol vol);
}
