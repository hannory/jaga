package com.kh.jaga.bugagachi.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;


@Service
public interface CcSalesSlipGapService {

	List<CcSalesSlipGap> selectCssg(CcSalesSlipGap cssg);

	
}
