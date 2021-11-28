package com.wdelivery.store.logger;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import edu.emory.mathcs.backport.java.util.Arrays;

@Aspect
@Service
public class WdonaldStoreLoggerAspect {
	private static final Logger logger = 
			LoggerFactory.getLogger(WdonaldStoreLoggerAspect.class);
	private final String aroundText = "[Around]  logic Around-processing ===> ";
	
	@Around("execution(public * com.wdelivery.store..*QnaQa(..))")
	public Object traceQnaQa(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
	@Around("execution(public * com.wdelivery.store..*Admin(..))")
	public Object traceAdmin(ProceedingJoinPoint jp) throws Throwable {
		//before method start
		logger.warn(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		System.out.println(aroundText+jp.getSignature().toShortString()+" : "+Arrays.toString(jp.getArgs()));
		
		Object result = jp.proceed();
		//메서드가 실행된 후
		logger.warn("method => "+jp.getSignature().getName()+" finished");
		return result;
	}
	
}
