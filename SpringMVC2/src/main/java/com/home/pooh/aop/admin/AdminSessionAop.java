package com.home.pooh.aop.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;

import com.home.pooh.exception.LoginFailException;

public class AdminSessionAop {

	
	
	public void sessionCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		
		
		System.out.println(joinPoint.getSignature().getName()+"!!!");
		HttpSession session = null;
		Object[] args= joinPoint.getArgs();
		for(Object obj:args) {
			if(obj instanceof HttpSession) {
				session = (HttpSession)obj;
			}
		}
		
		if(session.getAttribute("admin")==null) {
			throw new LoginFailException("로그인 필요해");
		}else {
			joinPoint.proceed();
		}
		
		
		
	}
}
