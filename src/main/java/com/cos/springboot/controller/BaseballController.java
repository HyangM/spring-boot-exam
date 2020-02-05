package com.cos.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.springboot.dto.BaseballTPDto;
import com.cos.springboot.model.BaseballPlayer;
import com.cos.springboot.model.BaseballTeam;
import com.cos.springboot.repository.BaseballRepository;

@Controller
public class BaseballController {

	@Autowired
	private BaseballRepository baseballRepository;
	
	
	@GetMapping({"/baseball/list"})
	public String findAll(Model model) {		
		List<BaseballTeam> teams = baseballRepository.findTeamAll();
		
		model.addAttribute("teams", teams);
		
		return "baseball/list";
	}
	
	@GetMapping({"/baseball/player/{teamid}"})
	public ResponseEntity<?> findTeam(@PathVariable int teamid) {
		
		List<BaseballPlayer> players = baseballRepository.findByTeam(teamid);		

		return new ResponseEntity<List<BaseballPlayer>>(players, HttpStatus.OK);
	}
	
	@GetMapping({"/baseball/tp/{teamid}/{userid}"})
	public ResponseEntity<?> findTP(@PathVariable int teamid, @PathVariable int userid) {

		BaseballTPDto players = baseballRepository.findByTP(teamid, userid);

		return new ResponseEntity<BaseballTPDto>(players, HttpStatus.OK);
	}	
}
