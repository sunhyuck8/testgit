package com.home.pooh.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.home.pooh.exception.LoginFailException;

@ControllerAdvice
public class SpecificExceptionHandler {
	
	@ExceptionHandler(LoginFailException.class)
	public String handle(LoginFailException e, HttpServletRequest request) {

		request.setAttribute("msg", e.getMessage());
		request.setAttribute("url", "/login");
		request.setAttribute("e", e);
		
		return "alert/alertPage";
	}
	
	
}
