package com.yoo.controller;


import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yoo.service.BoardService;
import com.yoo.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BoardService service;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Principal principal,Model model) {
		
		model.addAttribute("list", service.getMainList());
		model.addAttribute("Mlist", service.getMainMList());
		
		return "index";
	}

	
}
