package com.home.pooh.aop.admin;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.home.pooh.exception.LoginFailException;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(LoginFailException.class)
	public String handle(LoginFailException e, Model model) {
		System.out.println("글로발 에러 발생");

		model.addAttribute("e", e);
		return "error/result";
	}
}
