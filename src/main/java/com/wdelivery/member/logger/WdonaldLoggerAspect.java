package com.wdelivery.member.logger;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import edu.emory.mathcs.backport.java.util.Arrays;

@Aspect
@Service
public class WdonaldLoggerAspect {
	private static final Logger logger = 
			LoggerFactory.getLogger(WdonaldLoggerAspect.class);
	private final String aroundText = "[Around]  logic Around-processing ===> ";
	
	@Around("execution(public * com.wdelivery..*Login(..))")
	public Object traceLogin(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method =>"+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery..logout(..))")
	public Object traceLogout(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery..*Join(..))")
	public Object traceMemJoin(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery..qnaInsert(..))")
	public Object traceQnaInsert(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery..paywinDelivery(..))")
	public Object tracePayment(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	@Around("execution(public * com.wdelivery..mypageUpdateConfirm(..))||execution(public * com.wdelivery..mypageDelete(..))")
	public Object tracemyPageUpdate(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	@Around("execution(public * com.wdelivery..addressUpdate(..))||execution(public * com.wdelivery..addressInsert(..))||execution(public * com.wdelivery..addressDelete(..))")
	public Object traceAddressProcess(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	@Around("execution(public * com.wdelivery..orderCancel(..))")
	public Object traceOrderCancel(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	@Around("execution(public * com.wdelivery..registerUserCoupon(..))")
	public Object traceUserCouponRegister(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
}
