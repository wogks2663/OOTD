package com.ootd.project.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ootd.project.dao.OotdMemberDao;

// 회원정보 수정 폼에서 회원의 비밀번호 확인을 Ajax로 처리하는 모델 클래스
public class PassCheckAction implements AjaxProcess {

	@Override
	public void ajaxProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		if(id == null || pass == null) {
			out.println("	alert('정상적인 접근이 아닙니다.');");
			return;
		}
		OotdMemberDao dao = new OotdMemberDao();
		int result = dao.checkMember(id, pass);

		String message = "({ 'result' : '" + result + "' })";
		out.println(message);
	}
}
