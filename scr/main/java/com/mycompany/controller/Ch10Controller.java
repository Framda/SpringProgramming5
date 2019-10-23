package com.mycompany.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.dto.Ch10Board;
import com.mycompany.dto.Ch10Member;
import com.mycompany.service.Ch10Service;
import com.mycompany.service.LoginResult;

@Controller
@RequestMapping("/ch10")
public class Ch10Controller {
	private static final Logger log = LoggerFactory.getLogger(Ch10Controller.class);
	
	//@Autowired
	@Resource(name="dataSource")
	private DataSource dataSource;
	@Autowired
	private Ch10Service service;
	
	@RequestMapping("/content")
	public String content() {
		return "ch10/content";
	}
	
	@RequestMapping("/connTest")
	public void connTest(HttpServletResponse response) {
		boolean result = false;
		
		try {
			//Connection Pool���� ����� Connection �뿩
			Connection conn = dataSource.getConnection();
			if(conn != null) result = true;
			
			//Connection Pool�� Connection�� �ݳ�
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			//JSON�� MimeType�� HTTPHEADER�� ����ؾ��Ԥ���.
			response.setContentType("application/json; charset=UTF-8"); 
			
			PrintWriter pw = response.getWriter();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("result", result);
			pw.print(jsonObject.toString());
			pw.flush();
			pw.close();
		} catch(IOException e) {}
	}

	@RequestMapping("/boardList")
	public String boardList(Model model, @RequestParam(defaultValue = "1")int pageNo, HttpSession session) {
		session.setAttribute("pageNo", pageNo);
		
		//page�� column��
		int rowsPerPage = 10;
		//prev, next�� ǥ���ϴ� page��
		int pagesPerGroup = 5;
		//��ü ���ù� ��
		int totalRowNum = service.getTotalRowNo();
		//��ü ������ ��
		int totalPageNum = totalRowNum / rowsPerPage;
		if(totalRowNum % rowsPerPage != 0) totalPageNum++;
		//��ü �׷� ��
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if(totalPageNum % pagesPerGroup != 0) totalGroupNum++;

		//���� �������� �׷� ��ȣ
		int groupNo = (pageNo-1)/pagesPerGroup + 1;
		//���� �׷��� ���� ������ ��ȣ
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		//���� �׷��� ������ ������ ��ȣ
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNum) endPageNo = totalPageNum; 
		//���� �������� ����/�� ���ȣ
		int startRowNo = (pageNo-1) * rowsPerPage + 1;
		int endRowNo = pageNo * rowsPerPage;
		//���� �������� �� ���ȣ
		int endRowNO = pageNo*rowsPerPage;
		if(pageNo == totalGroupNum) endRowNo = totalRowNum;
		
		
		//���� �������� �Խù� ��������
		List<Ch10Board> boardList = service.getBoardList(startRowNo, endRowNo);
		
		//JSP�� ������ ���� �ѱ��
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNum", totalPageNum);
		model.addAttribute("tatalGroupNum", totalGroupNum);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		
		model.addAttribute("boardList", boardList);

		
		return "ch10/boardList";
	}
	
	@RequestMapping("/writeBoardForm")
	public String writeBoardForm(HttpSession session) {
		String mid = (String)session.getAttribute("mid");
		if(mid == null) {
			return "redirect:/ch10/loginForm";
		}
		return "ch10/writeBoardForm";
	}
	
	
	@RequestMapping("/writeBoard")
	public String writeBoard(Ch10Board board, HttpSession session) {
		board.setBwriter((String)session.getAttribute("mid"));
		service.writeBoard(board);
		return "redirect:/ch10/boardList";
	}
	@RequestMapping("/loginForm")
	public String loginForm(String error, Model model) {
		if(error != null) {
			if(error.equals("fail_mid")) {
				model.addAttribute("midError", "Incorrect Username");
			} else if(error.equals("fail_mpassword")) {
				model.addAttribute("mpasswordError", "Incorrect password");
			}
		}
		return "ch10/loginForm";
	}
	@PostMapping("/login")
	public String login(String mid, String mpassword, HttpSession session) {
		LoginResult result = service.login(mid, mpassword);
		if (result == LoginResult.FAIL_MID) {
			//get��� ����
			return "redirect:/ch10/loginForm?error=fail_mid";
		} else if (result == LoginResult.FAIL_MPASSWORD) {
			//post��� ����
			//session.setAttribute("mpasswordError", "Incorrect password");
			//return "redirect:/ch10/loginForm";
			return "redirect:/ch10/loginForm?error=fail_mpassword";
		}
		session.setAttribute("mid", mid);
		return "redirect:/ch10/boardList";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("mid");
		return "redirect:/ch10/boardList";
	}
	
	@GetMapping("/join")
	public String joinForm() {
		return "ch10/joinForm";
	}
	
	@PostMapping("/join")
	public String join(Ch10Member member) {
		service.join(member);
		return "redirect:/ch10/loginForm";
	}
	@RequestMapping("/checkMid")
	public void checkMid(String mid, HttpServletResponse response) throws Exception {
		boolean result = service.checkMid(mid);
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		pw.print(jsonObject.toString());
		pw.flush();
		pw.close();
	}
	
	
	@RequestMapping("/boardDetail")
	public String boardDetail(int bno, Model model) {
		service.increaseHitcount(bno);
		
		Ch10Board board = service.getBoardList(bno);
		model.addAttribute("board", board);
		return "ch10/boardDetail";
	}
	@GetMapping("/updateBoard")
	public String updateBoardForm(int bno ,Model model) {
		Ch10Board board = service.getBoardList(bno);
		model.addAttribute("board", board);
		return "ch10/updateBoardForm";
	}
	@PostMapping("/updateBoard")
	public String updateBoard(Ch10Board board, HttpSession session) {
		service.updateBoard(board);
		int pageNo = (Integer)session.getAttribute("pageNo");
		return "redirect:/ch10/boardList?pageNo=" + pageNo;
	}
	
	@RequestMapping("/deleteBoard")
	public String deleteBoard(int bno, HttpSession session) {
		service.deleteBoard(bno);
		int pageNo = (Integer)session.getAttribute("pageNo");
		return "redirect:/ch10/boardList?pageNo=" + pageNo;
	}	
}