package com.gestion.vols.controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gestion.vols.entities.Aeroport;
import com.gestion.vols.entities.Avion;
import com.gestion.vols.entities.Escale;
import com.gestion.vols.entities.Reservation;
import com.gestion.vols.entities.User;
import com.gestion.vols.entities.Vol;
import com.gestion.vols.repository.AeroportDAO;
import com.gestion.vols.repository.AvionDAO;
import com.gestion.vols.repository.EscaleDAO;
import com.gestion.vols.repository.ReservationDAO;
import com.gestion.vols.repository.UserDAO;
import com.gestion.vols.repository.VolDAO;
import com.gestion.vols.services.MailService;

@Controller
@RequestMapping("agent")
public class AgentController {

	@Autowired
	private AvionDAO avionDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private VolDAO volDAO;
	@Autowired
	private AeroportDAO aeroDAO;
	@Autowired
	private ReservationDAO reservationDAO;
	@Autowired
	private EscaleDAO escaleDAO;
	@Autowired
	private MailService mailServ;

	@RequestMapping("/")
	public String displayHomeAgent() {
		List<Vol> list = volDAO.findVolWithSearch("2000-04-28 12:10:00", "2020-04-30 14:10:00");
		System.out.println(list.size());
		for (Vol v : list) {
			System.out.println(v.getId());
		}
		return "AgentHome";
	}

	@RequestMapping("/ajouter-avion")
	public String AjouterAvion(Model model) {
		model.addAttribute("newAvion", new Avion());
		return "AjouterAvion";

	}

	@RequestMapping(value = "/ajouter-avion", method = RequestMethod.POST)
	public String processAjouterClient(@ModelAttribute("newAvion") Avion avion, HttpServletRequest request) {
		avion.setEtat("active");
		avionDAO.save(avion);
		request.setAttribute("res", true);

		return "AjouterAvion";
	}

	@RequestMapping("/list-avions")
	public String displayListAvion(HttpServletRequest request) {
		request.setAttribute("listAvions", avionDAO.findAll());
		return "ListAvions";
	}

	@RequestMapping("/modifier-avion/{idA}")
	public String displayModifierAvion(@PathVariable("idA") String idAvion, Model model) {
		Avion a = avionDAO.getOne(Integer.parseInt(idAvion));
		model.addAttribute("avion", a);
		return "ModifierAvion";
	}

	@RequestMapping(value = "/modifier-avion/{idA}", method = RequestMethod.POST)
	public String processModifierAvion(@PathVariable("idA") String idAvion, @ModelAttribute("avion") Avion avion,
			HttpServletRequest request) {
		avion.setId(Integer.parseInt(idAvion));
		avionDAO.save(avion);
		request.setAttribute("res", true);
		return "ModifierAvion";
	}

	@RequestMapping("/ajouter-client")
	public String displayAjouterClient(Model model) {
		model.addAttribute("newUser", new User());
		return "AjouterClient";
	}

	@RequestMapping(value = "/ajouter-client", method = RequestMethod.POST)
	public String processAjouterClient(@ModelAttribute("newUser") User user, HttpServletRequest request) {

		user.setPassword(user.getLogin() + "x1234");
		user.setType("client");
		userDAO.save(user);
		request.setAttribute("res", true);
		return "AjouterClient";
	}

	@RequestMapping("list-clients")
	public String displayListClient(HttpServletRequest request) {
		request.setAttribute("listClients", userDAO.findByType(UserTypes.CLIENT));
		request.setAttribute("listBlocked", userDAO.findByType(UserTypes.BLOCKED));
		return "ListeClients";
	}

	@RequestMapping("/list-demandes")
	public String displayListDemandes(HttpServletRequest request) {
		request.setAttribute("listDemandes", userDAO.findByType(UserTypes.NOT_TREATED_YET));
		return "ListDemandes";
	}

	@RequestMapping("/modifier-client/{IdC}")
	public String displayModifierClient(@PathVariable("IdC") String idClient, Model model) {
		model.addAttribute("client", userDAO.getOne(Integer.parseInt(idClient)));

		return "ModifierClient";
	}

	@RequestMapping(value = "/modifier-client/{IdC}", method = RequestMethod.POST)
	public String processModifierClient(@PathVariable("IdC") String idClient, @ModelAttribute("client") User client,
			HttpServletRequest request) {
		User oldClient = userDAO.getOne(Integer.parseInt(idClient));
		client.setId(Integer.parseInt(idClient));
		client.setPassword(oldClient.getPassword());
		client.setType(oldClient.getType());
		userDAO.save(client);

		request.setAttribute("res", true);
		return "ModifierClient";
	}

	@RequestMapping("/ajouter-vol")
	public String displayAjouterVol(Model model, HttpServletRequest request) {
		model.addAttribute("newVol", new Vol());
		request.setAttribute("avions", avionDAO.findAll());
		request.setAttribute("aeros", aeroDAO.findAll());
		return "AjouterVol";
	}

	@RequestMapping(value = "/ajouter-vol", method = RequestMethod.POST)
	public String processAjouterVol(@ModelAttribute("newVol") Vol vol, HttpServletRequest request) {
		String lesEscales = vol.getEscalesString();
		StringTokenizer stz = new StringTokenizer(lesEscales, ",");
		Set<Escale> setEscales = new HashSet<>();
		while (stz.hasMoreTokens()) {
			int nextId = Integer.parseInt(stz.nextToken());
			Aeroport ae = aeroDAO.getOne(nextId);
			Escale escale = new Escale();
			escale.setAeroport(ae);
			escale.setVol(vol);
			setEscales.add(escale);
		}

		vol.setEscales(setEscales);

		volDAO.save(vol);
		request.setAttribute("res", true);
		request.setAttribute("avions", avionDAO.findAll());
		request.setAttribute("aeros", aeroDAO.findAll());
		return "AjouterVol";
	}

	@RequestMapping("/list-reservations")
	public String displayListReservations(HttpServletRequest request) {
		request.setAttribute("listReservations", reservationDAO.findByEtat("new"));
		return "ListeReservation";
	}

	@RequestMapping("/list-vols")
	public String displayListVols(HttpServletRequest request) {
		request.setAttribute("listVols", volDAO.getUpCominVols());
		return "ListVols";
	}

	/************
	 * **********
	 ******/

	@RequestMapping("/modifier-vol/{idV}")
	public String displayModifierVol(@PathVariable("idV") Integer idV, Model model, HttpServletRequest request) {
		model.addAttribute("vol", volDAO.getOne(idV));
		request.setAttribute("avions", avionDAO.findAll());
		request.setAttribute("vol", volDAO.getOne(idV));
		request.setAttribute("aeros", aeroDAO.findAll());

		return "ModifierVol";
	}

	@RequestMapping(value = "/modifier-vol/{idV}", method = RequestMethod.POST)
	public String processModifierVol(@PathVariable("idV") Integer idV, @ModelAttribute("vol") Vol vol,
			HttpServletRequest request) {
		vol.setId(idV);
		Vol oldVol = volDAO.getOne(idV);
		vol.setEscales(oldVol.getEscales());

		if (vol.getEscalesString() != null) {
			if ((vol.getEscales() == null))
				vol.setEscales(new HashSet<>());
			

			StringTokenizer stz = new StringTokenizer(vol.getEscalesString(), ",");
			while (stz.hasMoreTokens()) {
				int nextId = Integer.parseInt(stz.nextToken());
				Aeroport ae = aeroDAO.getOne(nextId);
				Escale escale = new Escale();
				escale.setAeroport(ae);
				escale.setVol(vol);
				vol.getEscales().add(escale);
			}
		}

		volDAO.save(vol);
		if(oldVol.getReservations() != null){
			System.err.println("nb Vol "+oldVol.getReservations().size());
			for(Reservation reserv : oldVol.getReservations()){
				mailServ.sendVolUpdateMessage(reserv.getPassager().getEmail(),reserv.getPassager().getTel() ,vol);
				System.err.println("mail sent to "+reserv.getPassager().getEmail());
			}
		}else{
			List<Reservation> listRes = reservationDAO.findAll();
			System.err.println("toul lista "+listRes.size());
			oldVol = volDAO.getOne(idV);
			for(Reservation reserv : listRes){
				if(reserv.getVol().getId() == oldVol.getId()){
					mailServ.sendVolUpdateMessage(reserv.getPassager().getEmail(),reserv.getPassager().getTel(), oldVol);
					System.err.println("mail sent to "+reserv.getPassager().getEmail());
				}
			}
		}
		
		
		request.setAttribute("res", true);
		request.setAttribute("avions", avionDAO.findAll());
		request.setAttribute("vol", volDAO.getOne(idV));
		request.setAttribute("aeros", aeroDAO.findAll());
		return "ModifierVol";
	}

	@RequestMapping("/supprimer-client")
	@ResponseBody
	public String supprimerClient(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = userDAO.getOne(id);
		if (user != null) {
			userDAO.delete(user);
			this.mailServ.sendAccountRefusalMessage(user);
			return "OK";
		} else {
			return "ERR";
		}

	}

	@RequestMapping("/bloquer-client")
	@ResponseBody
	public String bloquerClient(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));

		User user = userDAO.getOne(id);
		if (user != null) {
			user.setType(UserTypes.BLOCKED);
			userDAO.save(user);
			return "OK";
		} else {
			return "ERR";
		}

	}

	@RequestMapping("/debloquer-client")
	@ResponseBody
	public String debloquerClient(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));

		User user = userDAO.getOne(id);
		if (user != null && user.getType().equals(UserTypes.NOT_TREATED_YET)) {
			mailServ.sendAccountConfirmationMessage(user);
		}
		if (user != null) {
			user.setType(UserTypes.CLIENT);
			userDAO.save(user);
			return "OK";
		} else {
			return "ERR";
		}

	}

	@RequestMapping("/accepter-reservation")
	@ResponseBody
	public String accepterReservation(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Reservation res = reservationDAO.getOne(id);
		res.setEtat("accepted");
		if (res != null) {
			reservationDAO.save(res);
			this.mailServ.sendReservationConfirmMessage(res.getPassager(), res.getVol());
			return "OK";
		}
		return "ERR";
	}

	@RequestMapping("/refuser-reservation")
	@ResponseBody
	public String refuserReservation(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Reservation res = reservationDAO.getOne(id);
		res.setEtat("refused");
		if (res != null) {
			reservationDAO.save(res);
			this.mailServ.sendReservationDenialMessage(res.getPassager(), res.getVol());
			return "OK";
		}
		return "ERR";
	}

	@RequestMapping("/supprimer-escale")
	@ResponseBody
	public String supprimerEscale(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Escale esc = escaleDAO.getOne(id);
		System.out.println(esc);
		if (esc != null) {
			System.out.println(esc.getAeroport().getNom());
			escaleDAO.delete(esc);
			return "OK";
		}
		return "ERR";
	}
}
