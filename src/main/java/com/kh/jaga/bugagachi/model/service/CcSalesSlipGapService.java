package com.kh.jaga.bugagachi.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlipDetail;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;
import com.kh.jaga.bugagachi.model.vo.TnxHis;
import com.kh.jaga.slip.model.vo.Receiption;


@Service
public interface CcSalesSlipGapService {

	List<CcSalesSlipDetail> selectCssg(CcSalesSlipGap cssg);

	List<Receiption> selectReceiCssg(CcSalesSlipGap cssg);

	CcSalesSlipGap selectCcGap(CcSalesSlipGap cssg);

	List<TnxHis> selectTnxHis(CcSalesSlipGap cssg);

	String selectCssgPk(CcSalesSlipGap cssg) throws Exception;

	int updateCcSalesSlipGap(CcSalesSlipGap cssg);

	List<TnxHis> selectNewRecei(Receiption re, Date eD);

	int insertCssg(CcSalesSlipGap cssg);

	String selectCssgPk2(CcSalesSlipGap cssg) throws Exception ;

	int insertCssgDetail(List<CcSalesSlipDetail> cgDetailList, String pk);

	int insertCssgHis(List<TnxHis> cssgHisList, String pk);

	int updateCcSalesSlipGapDead(CcSalesSlipGap cssg);

	 
}
