package com.home.pooh.aop.admin;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;

import com.home.pooh.exception.LoginFailException;

public class AdminSessionAop2 {

	
	
	public Object sessionCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		
		Object[] args= joinPoint.getArgs();
		HttpServletRequest request=null;
		HttpSession session =null;
		
		for(Object obj:args) {
			if(obj instanceof HttpServletRequest) {
				request = (HttpServletRequest)obj;
			}
		}
		
		String uri = request.getRequestURI();
		Object result = null;
		
		
		if(uri.equals("/member/loginform")||uri.equals("/admin/memberLogin")||uri.equals("/admin/memberlogin2")) {
			result = joinPoint.proceed();
		}else {
			session = request.getSession();
			if(session.getAttribute("user")==null) {
				throw new LoginFailException("로그인 필요해");
			}else {
				result = joinPoint.proceed();
			}
		}
		return result;
	}
}
