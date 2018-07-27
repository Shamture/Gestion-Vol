package com.gestion.vols.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gestion.vols.entities.User;
import com.gestion.vols.entities.Vol;
import com.gestion.vols.repository.PaysDAO;
import com.gestion.vols.repository.UserDAO;
import com.gestion.vols.repository.VolDAO;

/**
 * 
 * @author youssef
 *
 */
@Controller
public class MainController {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private VolDAO volDAO;
	@Autowired
	private PaysDAO paysDAO;

	public String rechercherVol(@RequestParam(value = "dateDep", required = true) String dateDep,
			@RequestParam(value = "villeDep", defaultValue = "none", required = false) String villeDep,
			@RequestParam(value = "dateArr", required = true) String dateArr,
			@RequestParam(value = "villeArr", defaultValue = "none", required = false) String villeArr) {

		return "";
	}

	@RequestMapping("/inscription-client")
	public String displayAjouterClient(Model model) {
		model.addAttribute("newUser", new User());
		return "Inscription";
	}

	@RequestMapping(value = "/inscription-client", method = RequestMethod.POST)
	public String processAjouterClient(@ModelAttribute("newUser") User user, HttpServletRequest request) {

		user.setType(UserTypes.NOT_TREATED_YET);
		userDAO.save(user);
		request.setAttribute("res", true);
		return "Inscription";
	}

	@RequestMapping("/login")
	public String displayLogin() {
		return "Login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String processLogin(HttpServletRequest request) {
		String login = request.getParameter("login");
		String pass = request.getParameter("pass");
		User user = userDAO.findByLogin(login);
		if (user != null && pass.equals(user.getPassword())) {
			HttpSession session = request.getSession();
			session.setAttribute("id", user.getId());
			session.setAttribute("type", user.getType());
			if ("agent".equals(user.getType())) {
				return "redirect:/agent/";
			} else if("client".equals(user.getType())) {
				return "redirect:/client/";
			}else if("not vued".equals(user.getType())){
				request.setAttribute("notVued", true);
				return "Login";
			}
		}
		request.setAttribute("err", true);
		return "Login";
	}

	@RequestMapping("/deconnecter")
	public String deconnecter(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/verifier-login")
	@ResponseBody
	public String verifiyLogin(HttpServletRequest request) {
		String login = request.getParameter("login");
		if (userDAO.findByLogin(login) != null)
			return "ERR";
		else
			return "OK";
	}

	@RequestMapping("/vols-disponible")
	public String listVols(HttpServletRequest request) {
		String minDate = request.getParameter("minDate");
		String maxDate = request.getParameter("maxDate");
		String payDepart = request.getParameter("paysDepart");
		String payArrivee = request.getParameter("paysArrivee");

		if (minDate == null || "".equals(minDate)) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			minDate = dateFormat.format(date);
			System.err.println(minDate);
		}

		if (maxDate == null || "".equals(maxDate)) {
			maxDate = "2030-12-30";
		}

		List<Vol> listVols = volDAO.getUpCominVols();
		/*
		 * Filter Pays Depart
		 */
		List<Vol> volsToShow = new ArrayList<>();
		if (payDepart != null && payArrivee != null) {
			int pDepart = Integer.parseInt(payDepart);
			int pArr = Integer.parseInt(payArrivee);
			if (pDepart == 0 && pArr == 0) {
				volsToShow.addAll(listVols);
			} else if (pDepart == 0 && pArr > 0) {
				for (Vol v : listVols) {
					if (v.getAeroportArrivee().getVille().getPays().getId() == pArr) {
						volsToShow.add(v);
					}
				}
			} else if (pDepart > 0 && pArr == 0) {
				for (Vol v : listVols) {
					if (v.getAeroportDepart().getVille().getPays().getId() == pDepart) {
						volsToShow.add(v);
					}
				}
			} else {
				for (Vol v : listVols) {
					if (v.getAeroportDepart().getVille().getPays().getId() == pDepart
							&& v.getAeroportArrivee().getVille().getPays().getId() == pArr) {
						volsToShow.add(v);
					}
				}
			}
		} else {
			volsToShow.addAll(listVols);
		}

		request.setAttribute("listVols", volsToShow);
		request.setAttribute("pays", paysDAO.findAll());

		return "ListVols";
	}

	@RequestMapping("/verifier-email")
	@ResponseBody
	public String verifiyEmail(HttpServletRequest request) {
		String email = request.getParameter("email");
		if (userDAO.findByEmail(email) != null)
			return "ERR";
		else
			return "OK";
	}

}
