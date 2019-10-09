package com.mycompany.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.dto.Ch05Board;

@Controller
@RequestMapping("/ch05")
public class Ch05Controller {

	@RequestMapping("/content")
	public String content() {
		return "ch05/content";
	}
	
	@RequestMapping("/getBoardList")
	public String getBoardList(int pageNo, Model model) {
		int startNo = (pageNo-1) * 7 + 1;
		int endNo = pageNo * 7;
		
		List<Ch05Board> boardList = new ArrayList<Ch05Board>();
		for(int i=startNo; i<=endNo;i++) {
			Ch05Board board = new Ch05Board();
			board.setBno(i);
			board.setBtitle("�������ڰ� �����Ѵ�" + i);
			board.setBcontent("������ �ݺ� �ݺ� �н��ϸ� �������� ������ �ȴ�." + i);
			board.setWriter("���ڹ�");
			board.setDate(new Date());
			board.setHitcount(1);
			boardList.add(board);
		}
		
		model.addAttribute("boardList", boardList);		
		model.addAttribute("totalNo", 70);

		
		//return "ch05/getBoardList";
		return "ch05/getBoardList2";
	}
}