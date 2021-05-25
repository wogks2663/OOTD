package com.ootd.project.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.BoardDao;
import com.ootd.project.vo.Board;
import com.ootd.project.vo.Reply;

// 게시 글 상세보기 요청을 처리하는 서비스 클래스
public class BoardDetailService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		HttpSession session = request.getSession(); 
		boolean isLogin = session.getAttribute("isLogin") != null ? 
				(Boolean) session.getAttribute("isLogin") : false;
		String id = (String)session.getAttribute("m_id");
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");	
		String keyword = request.getParameter("keyword");	
		int favchk=0;
		int favnum=0;
		int bbmk=0;
		
		boolean searchOption = (
				keyword == null || keyword.equals("")) ? false : true; 		
		
		BoardDao dao = new BoardDao();
		
		Board board = dao.getBoard(Integer.valueOf(no));
		favnum = dao.getFavor(Integer.valueOf(no));
		
		ArrayList<Reply> replyList = dao.getReplyList(Integer.valueOf(no));
		if(isLogin) {
			favchk = dao.boardFavorchk(id,Integer.valueOf(no));
			bbmk=dao.boardBookmark(id,Integer.valueOf(no));
		}
		
		System.out.println("bbmk:"+bbmk);
		request.setAttribute("board", board);
		request.setAttribute("replyList", replyList);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("searchOption", searchOption);
		request.setAttribute("favchk", favchk);
		request.setAttribute("favnum", favnum);
		request.setAttribute("bbmk", bbmk);
		// 검색 요청이면 type과 keyword를 request 영역에 저장한다.
		if(searchOption) {
			request.setAttribute("word", keyword);
			try {
				keyword = URLEncoder.encode(keyword, "utf-8");
			} catch (UnsupportedEncodingException e) {				
				e.printStackTrace();
			}			
			request.setAttribute("keyword", keyword);
		}
		
		ForwardService forward = new ForwardService();	
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/boardDetail.jsp");
		return forward;
	}
}
