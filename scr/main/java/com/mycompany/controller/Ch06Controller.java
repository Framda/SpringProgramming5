package com.mycompany.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.dto.Ch06Board;

@Controller
@RequestMapping("/ch06")
public class Ch06Controller {
	private static final Logger log = (Logger) LoggerFactory.getLogger(Ch06Controller.class);
	
	@RequestMapping("/content")
	public String content() {
		return "ch06/content";
	}
	@PostMapping("/login")
	public String login(String mid, String mpassword, HttpSession session) {
		String loginResult = "";
		if(mid.equals("admin")) {
			if(mpassword.equals("iot12345")) {
				loginResult = "success";
			} else {
				loginResult = "wrongMpassword";
			}
		} else {
			loginResult = "wrongMid";
		}
		
		session.setAttribute("loginResult", loginResult);
		
		//jsp가아니라 위request의 /content를 다시 요청하라는 의미
		return "redirect:/ch06/content";
		//로그인페이지를 링크에 걸면
		//return "ch06/login";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginResult");
		return "redirect:/ch06/content";
	}
	
	
	//FileDownload Response 만들기
	@RequestMapping("/fileDownload")
	public void fileDownroad(String fname,HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.debug(fname);		
		//응답 헤더에 데이터 추가
		ServletContext application = request.getServletContext();
		String mimeType = application.getMimeType(fname);
		response.setHeader("Content-Type", mimeType);
		
		String userAgent = request.getHeader("User-Agent");
		String downloadName;
		if(userAgent.contains("Trident/7.0")||userAgent.contains("MSIE")) {
			//IE 11 이하버전에서 한글 파일 복원하기.
			downloadName = URLEncoder.encode(fname, "UTF-8");
		} else {
			//webKit 기반 브라우저에(Chrome, Safari, FireFox, Opera, Edge)서 한글 파일을 복원하기. 
			downloadName = new String(fname.getBytes("UTF-8"), "ISO-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment; filename=\""+ downloadName +"\"");
		String realPath = request.getServletContext().getRealPath("resources/image/" + fname);
		File file = new File(realPath);
		response.setHeader("Content-Length", String.valueOf(file.length()));
		
		
		//응답 본문에 데이터 추가
		ServletOutputStream so = response.getOutputStream();
		//String realPath = request.getServletContext().getRealPath("resources/image/" + fname);
		InputStream is = new FileInputStream(realPath);
		
		byte[] buffer = new byte[1024];
		while(true) {
			int readByte = is.read(buffer);
			if(readByte == -1) break;
			so.write(buffer, 0, readByte);
		}
		so.flush();
		so.close();
		is.close();
	}
	
	
	@RequestMapping("/jsonDownload1")
	public String jsonDownload1(Model model) {
		Ch06Board board = new Ch06Board();
		board.setBno(100);
		board.setBtitle("way");
		board.setBcontent("back");
		board.setWriter("home");
		board.setDate(new Date());
		board.setHitcount(1);
		model.addAttribute("board", board);
		
		return "ch06/jsonDownload1";
	}
	@RequestMapping("/jsonDownload2")
	public void jsonDownload2(HttpServletResponse response) throws Exception {
		Ch06Board board = new Ch06Board();
		board.setBno(100);
		board.setBtitle("alone");
		board.setBcontent("solo");
		board.setWriter("you & me");
		board.setDate(new Date());
		board.setHitcount(1);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("bno", board.getBno());
		jsonObject.put("btitle", board.getBtitle());
		jsonObject.put("writer", board.getWriter());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		jsonObject.put("date", sdf.format(board.getDate()));
		jsonObject.put("hitcount", board.getHitcount());
		String json = jsonObject.toString();
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.write(json);
		pw.flush();
		pw.close();
	}
}














