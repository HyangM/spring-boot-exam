package com.cos.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.springboot.model.Product;
import com.cos.springboot.repository.ProdRepository;

@Controller
public class ProductController {

	@Autowired
	private ProdRepository prodRepository;
	
	@GetMapping({"/prod/list"})
	public String prods(Model model) {		
		List<Product> prods = prodRepository.findAll();
		
		model.addAttribute("prods", prods);
		
		return "product/list";
	}

	
	@GetMapping({"/prod/all/{btn}"})
	public ResponseEntity<?> prodall(@PathVariable String btn) {
		
		List<Product> prods = prodRepository.findAll();		

		return new ResponseEntity<List<Product>>(prods, HttpStatus.OK);
	}
	
	@GetMapping({"/prod/type/{type}"})
	public ResponseEntity<?> prodtype(@PathVariable String type) {
		
		List<Product> prodtypes = prodRepository.findByOneType(type);		

		return new ResponseEntity<List<Product>>(prodtypes, HttpStatus.OK);
	}
	
	@GetMapping({"/prod/price/{btn}/{type}"})
	public ResponseEntity<?> prodpricesort(@PathVariable String btn, @PathVariable String type) {
		
		List<Product> prodtypes;
		if(btn.equals("1")) {
			prodtypes = prodRepository.findTypePriceSort("%");	
		}else {
			prodtypes = prodRepository.findTypePriceSort(type);			
		}	

		return new ResponseEntity<List<Product>>(prodtypes, HttpStatus.OK);
	}
	
	@GetMapping({"/prod/orderCount/{btn}/{type}"})
	public ResponseEntity<?> prodOrdersort(@PathVariable String btn, @PathVariable String type) {
		
		List<Product> prodtypes;
		if(btn.equals("1")) {
			prodtypes = prodRepository.findTypeOrderSort("%");
		}else {
			prodtypes = prodRepository.findTypeOrderSort(type);			
		}	

		return new ResponseEntity<List<Product>>(prodtypes, HttpStatus.OK);
	}
}
