package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ootd.project.dao.OotdMemberDao;

// 회원 가입시 아이디 중복검사 요청을 처리하는 모델 클래스
public class OverlapIdCheckService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		String m_id = request.getParameter("id");
		
		OotdMemberDao dao = new OotdMemberDao();		
		boolean overlap = dao.overlapIdCheck(m_id);
		
		request.setAttribute("m_id", m_id);
		request.setAttribute("overlap", overlap);	
	
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/overlapIdCheck.jsp");
		return forward;
	}
}
