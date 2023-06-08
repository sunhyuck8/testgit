package com.home.pooh.aop.admin;

import org.aspectj.lang.ProceedingJoinPoint;

public class Bell {
	public void sound(ProceedingJoinPoint joinPoint) throws Throwable{
		 
		System.out.println("딩동");
		
		Object target = joinPoint.getTarget();
//		System.out.println(target+": 원래 호출될 객체");
		
		String methodName = joinPoint.getSignature().getName();
//		System.out.println(methodName+": 메서드명");
		
		Object[] args = joinPoint.getArgs();
		for(Object obj : args) {
			System.out.println(obj+": 매개변수");
		}
		
		joinPoint.proceed();
		System.out.println("호출후 딩동댕");
	}
}
