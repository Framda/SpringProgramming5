package com.mycompany.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ch04")
public class Ch04Controller {
	private static final Logger logger = LoggerFactory.getLogger(Ch04Controller.class);
	
	@RequestMapping("/content")
	public String content(@RequestHeader("User-Agent") String userAgent, HttpServletRequest request) {
		logger.info("userAgent: " + userAgent);
		
		String browserKind = null;
		if(userAgent.contains("Chrome")) {
			browserKind = "Chrome";
		} else if (userAgent.contains("Trident/7.0")) {
			browserKind = "IE 11";
		}
		
		request.setAttribute("browserKind", browserKind);
		return "ch04/content";
	}
	@RequestMapping("/setCookie")
	public String setCookie(HttpServletResponse response, String mname) {
		//mname = URLEncoder.encode(mname, "UTF-8"); 과거 브라우저가 안좋았던 시절 한글이 깨짐을 방지하기위해 인코딩을 처리해줬던것 예외처리도해야함
		Cookie cookie = new Cookie("mname", mname);
		//cookie.setMaxAge(365*24*60*60); 쿠키의 저장기간설정 0 -> 삭제효과
		response.addCookie(cookie);
		return "ch04/content";
	}
	@RequestMapping("/getCookie")
	public String getCookie(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("mname")) {
					request.setAttribute("mname", cookie.getValue());
				}
			}
		}
		return "ch04/getCookie";
	}

}