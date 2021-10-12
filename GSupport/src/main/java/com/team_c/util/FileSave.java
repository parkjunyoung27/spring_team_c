package com.team_c.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSave {
	//메소드 = (경로, 파일명)
	public String save(String realPath, MultipartFile files) throws IOException {
		File file = new File(realPath);//경로
		
		//경로가 존재하지 않으면 경로지정
		if(!file.exists()) { 
			file.mkdirs();//경로가 존재하지 않으면 경로를 만들어주는녀석
		}
		
		//파일 네임
		String fileName = UUID.randomUUID().toString();
		fileName = fileName + "_" + files.getOriginalFilename();
		
		file = new File(file, fileName);//경로 + UUID파일명
		FileCopyUtils.copy(files.getBytes(), file);
		
		return fileName;//데이터베이스에 저장할 이름
	}
	
}
