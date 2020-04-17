package com.kh.jaga.employee.model.vo;

public class Attachment implements java.io.Serializable{

	private String fileCode;
	private String newFileName;
	private int type;
	private String filePath;
	private String comCode;

	public Attachment() {
	}

	public Attachment(String fileCode, String newFileName, int type, String filePath, String comCode) {
		super();
		this.fileCode = fileCode;
		this.newFileName = newFileName;
		this.type = type;
		this.filePath = filePath;
		this.comCode = comCode;
	}

	public String getFileCode() {
		return fileCode;
	}

	public void setFileCode(String fileCode) {
		this.fileCode = fileCode;
	}

	public String getNewFileName() {
		return newFileName;
	}

	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	@Override
	public String toString() {
		return "Attachment [fileCode=" + fileCode + ", newFileName=" + newFileName + ", type=" + type + ", filePath="
				+ filePath + ", comCode=" + comCode + "]";
	}

	
}