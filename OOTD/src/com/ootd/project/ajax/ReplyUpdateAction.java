package com.ootd.project.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ootd.project.dao.BoardDao;
import com.ootd.project.vo.Reply;

// 댓글 수정하기 요청을 처리할 모델 클래스
public class ReplyUpdateAction implements AjaxProcess {

	@Override
	public void ajaxProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {		
		
		String list_no = request.getParameter("list_no");
		String replyNo = request.getParameter("replyNo");
		String replyContent = request.getParameter("replyContent");	
		 
		Reply reply = new Reply(Integer.parseInt(replyNo), 
				Integer.parseInt(list_no), replyContent, null, null);
		
		BoardDao dao = new BoardDao();
		dao.updateReply(reply);
		
		ArrayList<Reply> replyList = dao.getReplyList(Integer.parseInt(list_no));
		
		Gson gson = new Gson();
		
		String result = gson.toJson(replyList);							
		System.out.println("ReplyUpdateAction - result : " + result);
		
		//response.setContentType("text/html; charset=utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(result);
	}
}
