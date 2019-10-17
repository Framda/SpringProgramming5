package com.mycompany2.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany2.service.Ch09CommonService;


@Controller //������̼� annotation
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//�ٸ� WebApplication���� ������ ��ü�� ����Ϸ� �õ���
	@Autowired
	private Ch09CommonService ch09CommonService;
	
	@RequestMapping("/dispatcher2")
	public String home() {
		logger.info("dispatcher2 Start");
		ch09CommonService.method1();
		return "home";
	}
}