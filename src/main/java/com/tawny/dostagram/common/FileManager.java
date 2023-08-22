package com.tawny.dostagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManager {

	public static final String FILE_UPLOAD_PATH = "C:\\Users\\tawny\\Desktop\\JAVA-HELLOWORLD\\SpringProject\\upload\\dostagram";
	
	private static Logger logger = LoggerFactory.getLogger(FileManager.class);
	
	// 파일 저장 -> 경로 리턴 
	public static String saveFile(int userId, MultipartFile file) {
		
		
		if(file == null) {
			logger.error("saveFile :: 파일없음");
			return null;
		}
		

		// 폴더 이름을 먼저 문자열로 만들기 parameter에 userId 전달 받기
		String directoryName = "/" + userId + "-" + System.currentTimeMillis() + "/";
		
		// 폴더 생성(디렉토리 생성) (새 폴더 만든기를 코드로 구현)
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath); // -사용법
		
		if(!directory.mkdir()) { // 디렉토리가 생성되지 않았을 떄 / 디렉토리 경로를 넣으면 단서를 찾기 쉽다.
			logger.error("saveFile :: 디렉토리 생성 에러 - 경로 : " + directoryPath);
			return null;
		}
		
		String filePath = null;
		try {
			byte[] byytes = file.getBytes();
			
			filePath = directoryPath + file.getOriginalFilename();
			
			Path path = Paths.get(filePath);
			
			Files.write(path, byytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			
			// 파일 저장 실패 
			logger.error("saveFile :: 파일 저장 실패 - 경로" + filePath);
			return null;
		}
				
		return "/images" + directoryName + file.getOriginalFilename();
	}
	
	public static boolean removeFile(String filePath) { // /images/1_1691749458813/cat-8042342_640.jpg
		
		// 파일 정보가 없는경우 
		if(filePath == null) {
			return false;
		}
		
		// 실제 파일이 저장된 파일 경로 만들기 
		// /images/1_1691749458813/cat-8042342_640.jpg
		// D:\\김인규 강사\\web\\20230412\\springProject\\upload\\memo/1_1691749458813/cat-8042342_640.jpg
		// /images 제거하고, 전체 경로에 이어 붙인다. 
		
		String fullFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		
		Path path = Paths.get(fullFilePath);
		
		// 파일이 존재하는지 
		if(Files.exists(path)) {
			
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				e.printStackTrace();
				return false;	
			}
		}
		
		Path dirPath = path.getParent();
		
		if(Files.exists(dirPath)) {
			
			try {
				Files.delete(dirPath);
			} catch (IOException e) {
				
				e.printStackTrace();
				
				return false;
			}
		}
		return true;	
	}
	
	
}
