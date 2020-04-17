package com.kh.jaga.employee.model.vo;

public class Attachment implements java.io.Serializable{

	private String fileCode;
	private String newFileName;
	private int type;
	private String filePath;
	private String comCode;

	private String fileCode2;
	private String newFileName2;
	private int type2;
	private String filePath2;
	private String comCode2;
	
	public Attachment() {
	}

	public Attachment(String fileCode, String newFileName, int type, String filePath, String comCode, String fileCode2,
			String newFileName2, int type2, String filePath2, String comCode2) {
		super();
		this.fileCode = fileCode;
		this.newFileName = newFileName;
		this.type = type;
		this.filePath = filePath;
		this.comCode = comCode;
		this.fileCode2 = fileCode2;
		this.newFileName2 = newFileName2;
		this.type2 = type2;
		this.filePath2 = filePath2;
		this.comCode2 = comCode2;
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

	public String getFileCode2() {
		return fileCode2;
	}

	public void setFileCode2(String fileCode2) {
		this.fileCode2 = fileCode2;
	}

	public String getNewFileName2() {
		return newFileName2;
	}

	public void setNewFileName2(String newFileName2) {
		this.newFileName2 = newFileName2;
	}

	public int getType2() {
		return type2;
	}

	public void setType2(int type2) {
		this.type2 = type2;
	}

	public String getFilePath2() {
		return filePath2;
	}

	public void setFilePath2(String filePath2) {
		this.filePath2 = filePath2;
	}

	public String getComCode2() {
		return comCode2;
	}

	public void setComCode2(String comCode2) {
		this.comCode2 = comCode2;
	}

	@Override
	public String toString() {
		return "Attachment [fileCode=" + fileCode + ", newFileName=" + newFileName + ", type=" + type + ", filePath="
				+ filePath + ", comCode=" + comCode + ", fileCode2=" + fileCode2 + ", newFileName2=" + newFileName2
				+ ", type2=" + type2 + ", filePath2=" + filePath2 + ", comCode2=" + comCode2 + "]";
	}

	
	
}