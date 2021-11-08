package com.wdelivery.admin.util;

import java.io.File;


/**
 * @author nes0510@gmail.com
 * 	 awsS3 업로드 테스트용 메인
 */
public class Main {
	
	public AwsS3 awsS3 = AwsS3.getInstance();
	
	public static void main(String[] args) {
		Main main = new Main();
		//나일성 로컬 파일경로이므로, 테스트시 각자 로컬에 맞게 변경 
		File file = new File("C:\\Users\\nes05\\OneDrive\\바탕 화면\\mcdonald\\testAwsImgFile\\test.jpg");
		String key = "img/test.jpg";
		//복사할시 저장될 파일명
		//String copyKey = "img/copy-test.jpg";
		main.upload(file, key);
		
	}
	public void upload(File file, String key) {
		awsS3.upload(file, key);
	}
	public void copy(String orgKey,String copyKey) {
		awsS3.copy(orgKey, copyKey);
	}
	public void delete(String key) {
		awsS3.delete(key);
	}

}
