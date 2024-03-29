package com.mycompany.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany2.service.Ch09CommonService;


@Controller //어노테이션 annotation
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//company2의 객체를 사용하려고하는중 company2에서 객체를 관리했을때는 사용할 수 없었지만 root-context에서 관리한 이후로는 사용 가능하다.
	@Autowired
	private Ch09CommonService ch09CommonService;
	
	@RequestMapping("/")
	public String home() {
		logger.info("실행");
		ch09CommonService.method1();
		return "home";
	}
	
	@RequestMapping("/info")
	public String info() {
		logger.info("실행");
		return "info";
	}
}