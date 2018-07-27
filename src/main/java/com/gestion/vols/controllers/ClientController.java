package com.gestion.vols.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gestion.vols.entities.Passager;
import com.gestion.vols.entities.Reservation;
import com.gestion.vols.entities.Vol;
import com.gestion.vols.repository.PassagerDAO;
import com.gestion.vols.repository.ReservationDAO;
import com.gestion.vols.repository.VolDAO;

@Controller
@RequestMapping("/client")
public class ClientController {
	
	@Autowired
	private VolDAO volDAO;
	@Autowired
	private PassagerDAO passagerDAO;
	@Autowired
	private ReservationDAO reservationDAO;

	@RequestMapping("/")
	public String displayHome(){
		return "redirect:/vols-disponible";
	}
	
	
	
	@RequestMapping("/faire-reservation/{idV}")
	public String faireReservation(@PathVariable("idV") String idV,Model model,HttpServletRequest request){
		int idVol = Integer.parseInt(idV);
		Vol vol = volDAO.getOne(idVol);
		request.setAttribute("vol", vol);
		model.addAttribute("newReservation", new Reservation());
		return "FaireReservation";
	}
	
	@RequestMapping(value="/faire-reservation/{idV}",method=RequestMethod.POST)
	public String processFaireReservation(@PathVariable("idV") String idV,@ModelAttribute("newReservation") Reservation reservation,
			HttpServletRequest request){
		reservation.setEtat("new");
		int idVol = Integer.parseInt(idV);
		Vol vol = volDAO.getOne(idVol);
		reservation.setVol(vol);
		request.setAttribute("vol", vol);
		Passager passager = passagerDAO.findByCin(reservation.getPassager().getCin());
		if(passager == null){
			passager = passagerDAO.save(reservation.getPassager());
			
		}
		reservation.setPassager(passager);
		reservationDAO.save(reservation);
		request.setAttribute("res", true);
		
		return "FaireReservation";
	}
	
	@RequestMapping("/find-passager")
	@ResponseBody
	public Passager findPassagerByCin(HttpServletRequest request){
		Passager pass = passagerDAO.findByCin(request.getParameter("cin"));
		System.out.println(pass);
		return pass;
	}
	
	@RequestMapping("/check-place")
	@ResponseBody
	public String findIfPlaceIsReserved(HttpServletRequest request){
		System.err.println(request.getParameter("idVol"));
		System.err.println(request.getParameter("place"));
		int idVol = Integer.parseInt(request.getParameter("idVol").trim());
		int place = Integer.parseInt(request.getParameter("place").trim());
		List<Reservation> list = this.reservationDAO.findAll();
		for(Reservation res : list){
		   if(res.getPlace() == place && res.getVol().getId() == idVol){
			   return "YES";
		   }
		}
		return "NO";
	}
	
	
	
}
