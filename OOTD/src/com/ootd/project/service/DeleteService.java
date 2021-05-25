package com.ootd.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.BoardDao;

// 게시 글 삭제하기기 요청을 처리하는 서비스 클래스
public class DeleteService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		String sNo = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");
		
		if(sNo == null || sNo.equals("") || pageNum == null || pageNum.equals("")) {
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('정상적인 접근이 아닙니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}
		
		BoardDao dao = new BoardDao();
		int writer_access = dao.updateUserCheck(id, Integer.valueOf(sNo));
		
		if(writer_access==0) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println(" alert('삭제할 수 있는 권한이 없습니다.');");
				out.println(" history.back();");
				out.println("</script>");
				return null;
		}
		
		int no = Integer.parseInt(sNo);
		dao.deleteBoard(no);
		boolean searchOption = ( keyword == null || keyword.equals("")) ? false : true; 	
		String url = "boardList.mvc?pageNum=" + pageNum;
	
		if(searchOption) {
			keyword = URLEncoder.encode(keyword, "utf-8");
			url += "&keyword=" + keyword; 
		}

		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath(url);
		return forward;
	}
}
