package com.mycompany.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller //������̼� annotation
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String home() {
		logger.info("����");
		return "home";
	}
	
	@RequestMapping("/info")
	public String info() {
		logger.info("����");
		return "info";
	}
}