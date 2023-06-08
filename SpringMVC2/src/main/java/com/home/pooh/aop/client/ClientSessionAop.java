package com.home.pooh.aop.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;

import com.home.pooh.domain.Member;
import com.home.pooh.exception.LoginFailException;

public class ClientSessionAop {

		public Object sessionCheck(ProceedingJoinPoint joinPoint) throws Throwable {
			
			Object[] args= joinPoint.getArgs();
			HttpServletRequest request=null;
			HttpSession session =null;
			
			for(Object obj:args) {
				if(obj instanceof HttpServletRequest) {
					request = (HttpServletRequest)obj;
				}
			}
			Object result = joinPoint.proceed();
			
			
			//이부분에서 세션검사가 필요한 uri만 조사 없을시 throw 에러 
			if(request!=null) {
				
				String uri = request.getRequestURI();
				session = request.getSession();
				
				System.out.println("uri 는 "+uri);
				if(uri.contains("/registform")||uri.equals("/col1/recommentRegist")||uri.contains("/commentRegist")||uri.contains("/userInfo")||uri.equals("/col2/boardRegistForm")) { 
					if(session.getAttribute("userInfo")==null) {
						throw new LoginFailException("로그인이 필요한 페이지 입니다.");
					}else {
						Member member= (Member)session.getAttribute("userInfo");
						result = joinPoint.proceed();
					}
					
				}
			}
			
			
			return result;
		}
}
