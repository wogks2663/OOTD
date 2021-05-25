package com.ootd.project.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.ootd.project.dao.BoardDao;
import com.ootd.project.vo.Reply;

// 댓글 삭제하기 요청을 처리할 모델 클래스
public class ReplyDeleteAction implements AjaxProcess {

	@Override
	public void ajaxProcess(
			HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		// 댓글 수정 요청에서 클라이언트가 보내온 데이터를 request 객체롤 부터 받는다.
		HttpSession session = request.getSession();
		String list_no = request.getParameter("list_no");
		String replyNo = request.getParameter("replyNo");
		System.out.println("list_no" + list_no + "," + "replyNo" + replyNo); 
		Reply reply = new Reply(Integer.parseInt(replyNo), 
				Integer.parseInt(list_no), null, null, null);
		BoardDao dao = new BoardDao();
		
		dao.deleteReply(reply);

		ArrayList<Reply> replyList = dao.getReplyList(Integer.parseInt(list_no));
		
		Gson gson = new Gson();
		
		String result = gson.toJson(replyList);							
		System.out.println("ReplyDeleteAction - result : " + result);
		
		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();
		out.println(result);
	}
}
