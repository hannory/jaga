package com.kh.jaga.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.kh.jaga.employee.model.vo.Attachment;

public class DownloadView extends AbstractView{
	
	public DownloadView() {
		setContentType("application/download; UTF-8");
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		System.out.println("다운로드뷰입니다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
		
		File file = (File)model.get("downloadFile");
		Attachment at = (Attachment)model.get("attachment");
		
		System.out.println("file : " + file);
		System.out.println("at : " + at);
		
		response.setContentType(getContentType());
		response.setContentLength((int)file.length());
		response.setHeader("Content-Disposition", "attachment; filename=\""+ new String(at.getNewFileName().getBytes("UTF-8"), "ISO-8859-1") + "\";");
		/* response.setHeader("Content-Transfer-Encoding", "binary"); */
		
		BufferedInputStream buf = null;
		ServletOutputStream downOut;
		
		downOut = response.getOutputStream();
		
		FileInputStream fis = null;
		fis = new FileInputStream(file);
		buf = new BufferedInputStream(fis);

		int readBytes = 0;
		
		while((readBytes=buf.read())!= -1) {
			downOut .write(readBytes);
		}
		FileCopyUtils.copy(fis, downOut);
		
		downOut.flush();
		fis.close();
		buf.close();
	}

}
