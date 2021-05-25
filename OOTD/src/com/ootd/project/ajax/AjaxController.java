package com.ootd.project.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// ajax 요청을 처리하는 Controller 클래스 
@WebServlet(name="ajaxController", urlPatterns="*.ajax")
public class AjaxController extends HttpServlet {
	
	public void doAjax(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		AjaxProcess ajaxAction = null;
		String command = request.getRequestURI();
		
		command = command.substring(request.getContextPath().length());	
		System.out.println("command : " + command);
		
		 if(command.equals("/recommend.ajax")) {
			// 좋아요
			ajaxAction = new RecommendAction();
			ajaxAction.ajaxProcess(request, response);
		} else if(command.equals("/recommend_minus.ajax")) {
			// 좋아요 취소
			ajaxAction = new RecommendMinusAction();
			ajaxAction.ajaxProcess(request, response);
		} else if(command.equals("/replyWrite.ajax")) {
			// 댓글 쓰기 
			ajaxAction = new ReplyWriteAction();
			ajaxAction.ajaxProcess(request, response);
		} else if(command.equals("/replyUpdate.ajax")) {
			// 댓글 수정
			ajaxAction = new ReplyUpdateAction();
			ajaxAction.ajaxProcess(request, response);
		} else if(command.equals("/replyDelete.ajax")) {
			// 댓글 삭제
			ajaxAction = new ReplyDeleteAction();
			ajaxAction.ajaxProcess(request, response);
		} else if(command.equals("/state.ajax")) {
			// 북마크 등록
			ajaxAction = new StateAction();
			ajaxAction.ajaxProcess(request, response);
		} else if(command.equals("/state_minus.ajax")) {
			// 북마크 취소
			ajaxAction = new StateMinusAction();
			ajaxAction.ajaxProcess(request, response);
		}
	}
		
	@Override
	public void doGet(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		doAjax(request, response);
	}
	
	@Override
	public void doPost(
			HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		doAjax(request, response);
	}
}
