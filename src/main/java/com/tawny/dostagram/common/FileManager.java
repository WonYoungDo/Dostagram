package com.tawny.dostagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {

	public static final String FILE_UPLOAD_PATH = "C:\\Users\\tawny\\Desktop\\JAVA-HELLOWORLD\\SpringProject\\upload\\dostagram";
	
	
	// 파일 저장 -> 경로 리턴 
	public static String saveFile(int userId, MultipartFile file) {
		
		
		if(file == null) {
			return null;
		}
		

		// 폴더 이름을 먼저 문자열로 만들기 parameter에 userId 전달 받기
		String directoryName = "/" + userId + "-" + System.currentTimeMillis() + "/";
		
		// 폴더 생성(디렉토리 생성) (새 폴더 만든기를 코드로 구현)
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath); // -사용법
		
		if(!directory.mkdir()) { // 디렉토리가 생성되지 않았을 떄
			return null;
		}
		
		try {
			byte[] byytes = file.getBytes();
			
			String filePath = directoryPath + file.getOriginalFilename();
			
			Path path = Paths.get(filePath);
			
			Files.write(path, byytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			
			// 파일 저장 실패
			return null;
		}
				
		return "/images" + directoryName + file.getOriginalFilename();
		
		
	}
}
