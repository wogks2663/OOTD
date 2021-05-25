package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ootd.project.dao.OotdMemberDao;
import com.ootd.project.vo.OotdMember;

// 회원정보 수정 폼 요청을 처리하는 모델 클래스
public class RegisterUpdateFormService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_id");
		OotdMemberDao dao = new OotdMemberDao();
		OotdMember ootdmember = dao.getOotdMember(id);
		session.setAttribute("ootdmember", ootdmember);
	
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/index.jsp?body=board/registerUpdate.jsp");		
		return forward;
	}
}
