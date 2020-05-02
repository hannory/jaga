package com.kh.jaga.vat.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BizEstStmt implements Serializable{

	private String besCode;			//사업장 명세서 코드
	private  int besArea;			//사업장 대지
	private int besUnderFloor;		//사업장 건물 지하층수
	private int besFloor;			//사업장 건물 지상층수
	private int besFloorarea;		//사업장 바닥면적
	private int besGrossarea;		//사업장 연면적
	private int room;				//객실수
	private int table1;				//테이블수
	private int chair;				//의자수
	private String parkinglot;		//주차장 YN
	private int empCt;				//종업원수
	private int car;				//차량 승용차
	private int freightCar;			//차량 화물차
	private int deposit;			//임차료 보증금
	private int monthrent;			//월세
	private int egRatio;			//전기가스료
	private int waterRatio;			//수도료
	private int payment;			//인건비
	private int etc;				//기타
	private int monthlyexpenses;	//월기본경비
	private Date reportDate;		//신교년월일
	private int vatCode;			//부가가치세 코드
	private String besCategory;		//기본사항
	
	
	public BizEstStmt() {}
	
	
	public BizEstStmt(String besCode, int besArea, int besUnderFloor, int besFloor, int besFloorarea, int besGrossarea,
			int room, int table1, int chair, String parkinglot, int empCt, int car, int freightCar, int deposit,
			int monthrent, int egRatio, int waterRatio, int payment, int etc, int monthlyexpenses, Date reportDate,
			int vatCode, String besCategory) {
		super();
		this.besCode = besCode;
		this.besArea = besArea;
		this.besUnderFloor = besUnderFloor;
		this.besFloor = besFloor;
		this.besFloorarea = besFloorarea;
		this.besGrossarea = besGrossarea;
		this.room = room;
		this.table1 = table1;
		this.chair = chair;
		this.parkinglot = parkinglot;
		this.empCt = empCt;
		this.car = car;
		this.freightCar = freightCar;
		this.deposit = deposit;
		this.monthrent = monthrent;
		this.egRatio = egRatio;
		this.waterRatio = waterRatio;
		this.payment = payment;
		this.etc = etc;
		this.monthlyexpenses = monthlyexpenses;
		this.reportDate = reportDate;
		this.vatCode = vatCode;
		this.besCategory = besCategory;
	}
	public String getBesCode() {
		return besCode;
	}
	public void setBesCode(String besCode) {
		this.besCode = besCode;
	}
	public int getBesArea() {
		return besArea;
	}
	public void setBesArea(int besArea) {
		this.besArea = besArea;
	}
	public int getBesUnderFloor() {
		return besUnderFloor;
	}
	public void setBesUnderFloor(int besUnderFloor) {
		this.besUnderFloor = besUnderFloor;
	}
	public int getBesFloor() {
		return besFloor;
	}
	public void setBesFloor(int besFloor) {
		this.besFloor = besFloor;
	}
	public int getBesFloorarea() {
		return besFloorarea;
	}
	public void setBesFloorarea(int besFloorarea) {
		this.besFloorarea = besFloorarea;
	}
	public int getBesGrossarea() {
		return besGrossarea;
	}
	public void setBesGrossarea(int besGrossarea) {
		this.besGrossarea = besGrossarea;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public int getTable1() {
		return table1;
	}
	public void setTable1(int table1) {
		this.table1 = table1;
	}
	public int getChair() {
		return chair;
	}
	public void setChair(int chair) {
		this.chair = chair;
	}
	public String getParkinglot() {
		return parkinglot;
	}
	public void setParkinglot(String parkinglot) {
		this.parkinglot = parkinglot;
	}
	public int getEmpCt() {
		return empCt;
	}
	public void setEmpCt(int empCt) {
		this.empCt = empCt;
	}
	public int getCar() {
		return car;
	}
	public void setCar(int car) {
		this.car = car;
	}
	public int getFreightCar() {
		return freightCar;
	}
	public void setFreightCar(int freightCar) {
		this.freightCar = freightCar;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getMonthrent() {
		return monthrent;
	}
	public void setMonthrent(int monthrent) {
		this.monthrent = monthrent;
	}
	public int getEgRatio() {
		return egRatio;
	}
	public void setEgRatio(int egRatio) {
		this.egRatio = egRatio;
	}
	public int getWaterRatio() {
		return waterRatio;
	}
	public void setWaterRatio(int waterRatio) {
		this.waterRatio = waterRatio;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	public int getMonthlyexpenses() {
		return monthlyexpenses;
	}
	public void setMonthlyexpenses(int monthlyexpenses) {
		this.monthlyexpenses = monthlyexpenses;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public int getVatCode() {
		return vatCode;
	}
	public void setVatCode(int vatCode) {
		this.vatCode = vatCode;
	}
	public String getBesCategory() {
		return besCategory;
	}
	public void setBesCategory(String besCategory) {
		this.besCategory = besCategory;
	}
	@Override
	public String toString() {
		return "BizEstStmt [besCode=" + besCode + ", besArea=" + besArea + ", besUnderFloor=" + besUnderFloor
				+ ", besFloor=" + besFloor + ", besFloorarea=" + besFloorarea + ", besGrossarea=" + besGrossarea
				+ ", room=" + room + ", table1=" + table1 + ", chair=" + chair + ", parkinglot=" + parkinglot
				+ ", empCt=" + empCt + ", car=" + car + ", freightCar=" + freightCar + ", deposit=" + deposit
				+ ", monthrent=" + monthrent + ", egRatio=" + egRatio + ", waterRatio=" + waterRatio + ", payment="
				+ payment + ", etc=" + etc + ", monthlyexpenses=" + monthlyexpenses + ", reportDate=" + reportDate
				+ ", vatCode=" + vatCode + ", besCategory=" + besCategory + "]";
	}
	
	
}
