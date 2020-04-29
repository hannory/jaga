package com.kh.jaga.vatSumTaxInv.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDto;
import com.kh.jaga.vatSumTaxInv.model.vo.SumTaxInvDetail;

@Service
public interface SumOfTaxInvService {

	SumOfTaxInvDto selectSotiDto(SumOfTaxInvDto sDto);

	List<SumOfTaxInvDiv> selectSotiDiv(SumOfTaxInvDto sDto2);

	List<SumOfTaxInvDiv> selectSotiDivPur(SumOfTaxInvDto sDto2);

	List<SumTaxInvDetail> selectSotiDetail(SumOfTaxInvDto sDto2);

	List<SumTaxInvDetail> selectSotiDetailPur(SumOfTaxInvDto sDto2);

	List<SumTaxInvDetail> selectReceiption(Receiption receiptionPur, Date eD);

	int insertSoti(SumOfTaxInv soti);

	String selectTaxinvCode() throws Exception;

	int insertDetailList(List<SumTaxInvDetail> rePur);

	int insertDivList(List<SumOfTaxInvDiv> sDivPur);

	int insertSdto(SumOfTaxInvDto sDto);

	int updateSdto(SumOfTaxInvDto sDto);

}
