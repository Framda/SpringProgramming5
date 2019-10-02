package com.mycompany.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller //어노테이션 annotation
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String home() {
		logger.info("실행");
		return "home";
	}
	
	@RequestMapping("/info")
	public String info() {
		logger.info("실행");
		return "info";
	}
}