package com.mycompany.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.dto.Ch03Member;

@Controller
@RequestMapping("/ch03")
public class Ch03Controller {
	private static final Logger logger = LoggerFactory.getLogger(Ch03Controller.class);
	
	@RequestMapping("content")
	public String content() {
		return "ch03/content";
	}
	@RequestMapping("/join")
	public String join(String  mid, String mname, String mpassword, @RequestParam(defaultValue="0") int mage, @DateTimeFormat(pattern="yyyy-MM-dd") Date mbirth) {
		logger.info("mid: " + mid);
		logger.info("mname: " + mname);
		logger.info("mpassword: " + mpassword);
		logger.info("mage: " + mage);
		logger.info("mbirth: " + mbirth);
		return "ch03/content";
	}
	
	@RequestMapping("/join2")
	public String join2(Ch03Member member) {
		logger.info("mid: " + member.getMid());
		logger.info("mname: " + member.getMname());
		logger.info("mpassword: " + member.getMpassword());
		logger.info("mage: " + member.getMage());
		logger.info("mbirth: " + member.getMbirth());
		return "ch03/content";
	}
}