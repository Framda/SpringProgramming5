package com.mycompany.controller;

import java.io.File;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/ch08")
public class Ch08Controller {
	private static final Logger log = LoggerFactory.getLogger(Ch08Controller.class);
	
	@RequestMapping("/content")
	public String content() {
		return "ch08/content";
	}
	
	@PostMapping("/fileUpload")
	public String fileUpload(String title, String description, MultipartFile attach1, MultipartFile attach2, HttpServletRequest request, Model model) throws Exception {
		//파일 저장할 폴더 위치 얻어오기.
		ServletContext application = request.getServletContext();
		String savePath = application.getRealPath("/resources/upload/");
		
		
		log.info(title);
		log.info(description);
		
		if(!attach1.isEmpty()) {
			log.info("----------------");
			log.info("attach1: " + attach1.getOriginalFilename());
			log.info("attach1: " + attach1.getContentType());
			log.info("attach1: " + attach1.getSize() + "kb");
			
			String saveFileName = new Date().getTime() + "_" +attach1.getOriginalFilename();
			attach1.transferTo(new File(savePath+ saveFileName));
			log.info("attach1: " + saveFileName);
		}
		
		if(!attach2.isEmpty()) {
			log.info("----------------");
			log.info("attach2: " + attach2.getOriginalFilename());
			log.info("attach2: " + attach2.getContentType());
			log.info("attach2: " + attach2.getSize() + "kb");
			
			String saveFileName = new Date().getTime() + "_" +attach2.getOriginalFilename();
			attach2.transferTo(new File(savePath+ saveFileName));
			log.info("attach2: " + saveFileName);
		}
		
		//submit이후 출력페이지(jsp)로 data전송
		model.addAttribute("title", title);
		model.addAttribute("description", description);
		if(!attach1.isEmpty()) {
			model.addAttribute("attach1_origenalFilename", attach1.getOriginalFilename());
		}
		if(!attach2.isEmpty()) {
			model.addAttribute("attach2_origenalFilename", attach2.getOriginalFilename());
		}
		
		
		return "ch08/flieUpload";
	}
}
