package com.yoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yoo.service.GameService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/games/*")
@AllArgsConstructor
@Log4j
public class GameController {

	private GameService service;
	
	@GetMapping("{gameNum}")
	public String getGames(@PathVariable Long gameNum,Model model) {
		log.info("List");
		model.addAttribute("list", service.read(gameNum));
		return"/games/getGames";
	}
	
}
