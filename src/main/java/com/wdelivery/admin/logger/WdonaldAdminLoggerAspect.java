package com.wdelivery.admin.logger;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import edu.emory.mathcs.backport.java.util.Arrays;

@Aspect
@Service
public class WdonaldAdminLoggerAspect {
	private static final Logger logger = 
			LoggerFactory.getLogger(WdonaldAdminLoggerAspect.class);
	private final String aroundText = "[Around]  logic Around-processing ===> ";
	
	@Around("execution(public * com.wdelivery.admin..*Faq(..))")
	public Object traceFaq(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery.admin..*News(..))")
	public Object traceNews(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery.admin..*User(..))")
	public Object traceUserManage(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery.admin..*Banner(..))")
	public Object traceBanner(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery.admin..*Board(..))")
	public Object traceBoard(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery.admin..*Coupon(..))")
	public Object traceCoupon(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery.admin..*Promotion(..))")
	public Object tracePromotion(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery.admin..*HappyPromotion(..))")
	public Object traceHappyPromotion(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
}
