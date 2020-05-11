package com.kh.jaga.vatDeem.model.service;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatDeem.model.vo.Deem;
import com.kh.jaga.vatDeem.model.vo.DeemOther;
import com.kh.jaga.vatDeem.model.vo.DeemPro;
import com.kh.jaga.vatDeem.model.vo.DeemSlip;

@Service
public interface DeemService {

	Deem selectDeem(Deem deem);

	List<DeemPro> selectDeemPro(DeemPro dp);

	DeemOther selectDeemOther(DeemOther deo);

	List<DeemSlip> selectDeemSlip(DeemSlip dSlip);

	int updateDeadCenDeem(Deem deem);

	int updatedeem(Deem deem);

	List<DeemSlip> selectDeemSlip(Receiption re, Date eD);

	int insertDeem(Deem deem2);

	String selectDeemedCode();

	int insertDeemSlip(List<DeemSlip> dsList);

	int insertDeemPro(List<DeemPro> dpList);

	BigDecimal selectAsmt(Receiption re, Date eD);

	int insertDeemOther(DeemOther deo);

	DeemPro selectFarm(DeemPro dp, Receiption re, Date eD);

}
