package com.mycompany.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.dao.Ch10BoardDao;
import com.mycompany.dao.Ch10MemberDao;
import com.mycompany.dto.Ch10Board;
import com.mycompany.dto.Ch10Member;

@Service
public class Ch10Service {
	private static final Logger log = LoggerFactory.getLogger(Ch10Service.class);
	@Autowired
	private Ch10BoardDao boardDao;
	@Autowired
	private Ch10MemberDao memberDao;
	
	
	public List<Ch10Board> getBoardList(int startRowNo, int endRowNo) {
		List<Ch10Board> boardList = boardDao.selectList (startRowNo, endRowNo);
		return boardList;
	}
	public void writeBoard(Ch10Board board) {
		boardDao.insert(board);
	}
	public int getTotalRowNo() {
		int totalRowNum = boardDao.selectTotalRowNo();
		return totalRowNum;
	}
	public Ch10Board getBoardList(int bno) {
		Ch10Board board = boardDao.selectBoard(bno);
		return board;
	}
	public void increaseHitcount(int bno) {
		boardDao.updateHitcount(bno);
		
	}
	public void updateBoard(Ch10Board board) {
		boardDao.updateBoard(board);
	}

	public void deleteBoard(int bno) {
		boardDao.deleteBoard(bno);
	}
	
	
	public LoginResult login(String mid, String mpassword) {
		Ch10Member member = memberDao.selectMember(mid);
		log.info(mpassword);
		log.info(mid);
		log.info(member.getMpassword());
		
		if(member == null) {
			return LoginResult.FAIL_MID;
		} else {
			if(mpassword.equals(member.getMpassword())) {
				return LoginResult.SUCCESS;
			} else {
				return LoginResult.FAIL_MPASSWORD;
			}
		}
	}
	public boolean checkMid(String mid) {
		Ch10Member member = memberDao.selectMember(mid);
		if(member == null) {
			return true;
		} else {
			return false;
		}
	}
	public void join(Ch10Member member) {
		memberDao.insert(member);
	}
}