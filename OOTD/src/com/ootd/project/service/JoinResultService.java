package com.ootd.project.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ootd.project.dao.OotdMemberDao;
import com.ootd.project.vo.OotdMember;
public class JoinResultService implements CommandProcess {
	
	public ForwardService requestProcess(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {		
		
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("m_name");
		String id = request.getParameter("m_id");
		String pass = request.getParameter("m_pass");
		int phone = Integer.parseInt(request.getParameter("m_phone"));
		int age = Integer.parseInt(request.getParameter("m_age"));
		String gender = request.getParameter("m_gender");
		
		OotdMember ootdmember = new OotdMember();
		ootdmember.setM_name(name);
		ootdmember.setM_id(id);
		ootdmember.setM_pass(pass);
		ootdmember.setM_phone(phone);
		ootdmember.setM_age(age);
		ootdmember.setM_gender(gender);
		
		OotdMemberDao dao = new OotdMemberDao();
		dao.joinMember(ootdmember);		
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(false);
		forward.setPath("boardList.mvc");
		return forward;
	}
}
