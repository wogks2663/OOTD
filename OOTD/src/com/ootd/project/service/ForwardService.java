package com.ootd.project.service;

// Redirect 정보와 View 페이지의 경로 정보를 저장하는 클래스
public class ForwardService {
	
	private boolean redirect;
	
	private String path;
	
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
