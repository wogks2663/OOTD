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

// 댓글 쓰기 요청을 처리할 모델 클래스
public class ReplyWriteAction implements AjaxProcess {

	@Override
	public void ajaxProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {		
		
		String list_no = request.getParameter("list_no");
		String replyContent = request.getParameter("replyContent");
		String replyWriter = request.getParameter("replyWriter");		
		System.out.println("replyWriter" + replyContent);
		Reply reply = new Reply(
				Integer.parseInt(list_no), replyContent, replyWriter);
		
		BoardDao dao = new BoardDao();
		dao.addReply(reply);
		
		ArrayList<Reply> replyList = dao.getReplyList(Integer.parseInt(list_no));
		
		Gson gson = new Gson();
		
		String result = gson.toJson(replyList);							
		System.out.println("ReplyWriteAction - result : " + result);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(result);
	}
}
