package com.wdelivery.member.util;

import java.util.ArrayList;

import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.vo.PaymentVO;

public class TypeSafety {
	public static ArrayList<CartVO> sessionCartCaster(Object obj){
		ArrayList<CartVO> cartVO = new ArrayList<CartVO>();
		if (obj instanceof ArrayList<?>) { 
			// Get the List
			ArrayList<?> al = (ArrayList<?>) obj;
			if (al.size() > 0) {
				for (int i = 0; i < al.size(); i++) {
					Object o = al.get(i);
					if (o instanceof CartVO ) {
						CartVO v = (CartVO) o;
						cartVO.add(v);
						System.out.println(v.toString());
					}
				}
			}
		}
		return cartVO;
	}
	
	public static ArrayList<CartVO> sessionCartCaster(Object obj,PaymentVO paymentVO){
		ArrayList<CartVO> cartVO = new ArrayList<CartVO>();
		if (obj instanceof ArrayList<?>) { 
			// Get the List
			ArrayList<?> al = (ArrayList<?>) obj;
			if (al.size() > 0) {
				for (int i = 0; i < al.size(); i++) {
					Object o = al.get(i);
					if (o instanceof CartVO) {
						CartVO v = (CartVO) o;
						v.setMerchantuid(paymentVO.getMerchantuid());
						cartVO.add(v);
						System.out.println(v.toString());
					}
				}
			}
		}
		return cartVO;
	}
}
