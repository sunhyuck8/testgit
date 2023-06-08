package com.home.pooh.model.repository.common.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.home.pooh.exception.FileHandlerException;
import com.home.pooh.exception.UploadException;

@Component
public class FileManager{
	String savePath = "/resources/data/";
	
	//multipartformdata를 filename 만들어 넣어주는 작업 
	
	
	
	//파일의 확장자가져오기
	public String getExt(String path) {
		int lastIndex = path.lastIndexOf(".");
		return path.substring(lastIndex+1, path.length());
	}

	//파일 저장하기
	public void saveFile (ServletContext context, String fileName, MultipartFile multi) throws UploadException{
		System.out.println(context.getRealPath(savePath));
		
		try {
			multi.transferTo(new File(context.getRealPath(savePath)+fileName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
			throw new UploadException("업로드 실패", e);
		} catch (IOException e) {
			e.printStackTrace();
			throw new UploadException("업로드 실패", e);
		}
	}
	
	//파일 삭제하기
	public void deleteFile(ServletContext context, String fileName) throws FileHandlerException{
		File file = new File(context.getRealPath(savePath+fileName));
		boolean result =file.delete();
		if(!result) {
			throw new FileHandlerException(fileName+"삭제하지 못했습니다.");
		}
	}
	
}
