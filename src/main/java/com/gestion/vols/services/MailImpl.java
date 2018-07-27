package com.gestion.vols.services;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.gestion.vols.entities.Escale;
import com.gestion.vols.entities.Passager;
import com.gestion.vols.entities.User;
import com.gestion.vols.entities.Vol;
import com.twilio.Twilio;
import com.twilio.type.PhoneNumber;

@Service
public class MailImpl implements MailService {

	public boolean send(String mail, String sujet, String answer) {
		// Sender's email ID needs to be mentioned
		String from = "travel.agency.isi@gmail.com";// change accordingly
		final String username = "travel.agency.isi";// change accordingly
		final String password = "travel1245";// change
												// accordingly

		// on envoi l'email à travers relay.jangosmtp.net
		String host = "smtp.gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");

		// Get the Session object.
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			// Create a default MimeMessage object.
			Message message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mail));

			// Set Subject: header field
			message.setSubject(sujet);

			// Now set the actual message
			message.setContent(answer, "text/html");

			// Send message
			Transport.send(message);

			return true;

		} catch (MessagingException e) {

		}
		return false;
	}

	public void sendVolUpdateMessage(String mail, String phone, Vol vol) {
		String sujet = "S3Y Travel - Modification de votre reservation";
		String message = "<h1>Notification sur le changement des inforamtions de votre vol</h1><br/>";

		message += "<p>Bonjour, <br/> Nous souhaitons vous informer que votre vol a été modifié</p><br/>";
		message += "<p>Le vol sera le <strong>" + vol.getDepart() + "</strong> Sortant du aeroport : <strong>"
				+ vol.getAeroportDepart().getNom() + "</strong></p>";
		message += "<p>L'arrivé sera le <strong>" + vol.getArrivee() + "</strong> dans l'aeroport : <strong>"
				+ vol.getAeroportArrivee().getNom() + "</strong> de " + vol.getAeroportArrivee().getVille().getNom()
				+ " " + vol.getAeroportArrivee().getVille().getPays().getNom() + "</p>";
		if (vol.getEscales() != null && vol.getEscales().size() > 0) {
			message += "<h2>Ayant les escales suivants </h2>";
			for (Escale esc : vol.getEscales()) {
				message += "<p> Aeroport : " + esc.getAeroport().getNom() + " " + esc.getAeroport().getVille().getNom()
						+ " " + esc.getAeroport().getVille().getPays().getNom() + "</p>";
			}
		}

		this.send(mail, sujet, message);

	}

	public void sendAccountConfirmationMessage(User user) {
		String sujet = "S3Y Travel - Confirmation inscription";
		String message = "<h1>Confirmation d'inscription</h1>";
		message += "<p>Bonjour " + user.getNom() + " <br/><br/>";
		message += "Nous souhaitons vous informer que votre compte a été valider , vous pouvez connecter sur  <a href=\"http://localhost:8080/login\">ce lien </a> </p>";

		this.send(user.getEmail(), sujet, message);
	}

	public void sendAccountRefusalMessage(User user) {
		String sujet = "S3Y Travel - Refus inscription";
		String message = "<h1>Refus d'inscription</h1>";
		message += "<p>Bonjour " + user.getNom() + " <br/><br/>";
		message += "Nous somme desolé de vous informer que votre inscription a été refusé par nos agents </p>";

		this.send(user.getEmail(), sujet, message);
	}

	@Override
	public void sendReservationConfirmMessage(Passager pass, Vol vol) {
		String sujet = "Confirmation de reservation";
		String message = "<h1>" + sujet + "</h1>";
		message += "<p>Bonjour,<br/><br/>Nous souhaitons vous informer que votre reservation vers "
				+ vol.getAeroportArrivee().getVille().getPays().getNom() + " a été accepté</p>";
		this.send(pass.getEmail(), sujet, message);

	}

	@Override
	public void sendReservationDenialMessage(Passager pass, Vol vol) {
		String sujet = "Confirmation de reservation";
		String message = "<h1>" + sujet + "</h1>";
		message += "<p>Bonjour,<br/><br/>Nous desole de vous informer que votre reservation vers "
				+ vol.getAeroportArrivee().getVille().getPays().getNom() + " a été refusé par nos agents</p>";
		this.send(pass.getEmail(), sujet, message);


	}

}
