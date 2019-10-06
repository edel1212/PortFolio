package com.yoo.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommomController {

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth,Model model) {
		
		log.info("access Denied: " + auth);
		
		model.addAttribute("msg", "Access Denied");
		
	}
	
	@GetMapping("/member/customLogin")
	public void loginInput(String error,String logout,Model model) {
		
		log.info("error: " + error);
		log.info("logout:" + logout);
		
		if(error != null) {
			model.addAttribute("error", "아이디 및 비밀번호를 확인해 주세요. :D");
		} 
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!!!!!!!");
		}
	}
	
	
	@PostMapping("/customLogout")
	public void logoutPost() {
		log.info("post custom logout");
	}
	
}
