package com.ootd.project.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ootd.project.dao.BoardDao;

// 북마크 등록 요청을 처리하는 모델 클래스
public class StateAction implements AjaxProcess {
	
	public void ajaxProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("m_id");
		String no = request.getParameter("no");
		int chknum=0;
		
		HashMap<String, Integer> map = null;
		BoardDao dao = new BoardDao();
		chknum = dao.dBbookmarkCheck(user_id, Integer.parseInt(no));
		System.out.println("StateAction-chknum"+chknum);
		if(chknum==1) {
			map = dao.getState(Integer.parseInt(no), user_id,0);
		}else {
			map = dao.getState(Integer.parseInt(no), user_id,2);
		}
		
		Gson gson = new Gson();
		
		String result = gson.toJson(map);
							
		System.out.println("StateAction - result : " + result);
		
		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();
		out.println(result);
	}
}
