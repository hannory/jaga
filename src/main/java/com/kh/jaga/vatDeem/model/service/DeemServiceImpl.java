package com.kh.jaga.vatDeem.model.service;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatDeem.model.Dao.DeemDao;
import com.kh.jaga.vatDeem.model.vo.Deem;
import com.kh.jaga.vatDeem.model.vo.DeemOther;
import com.kh.jaga.vatDeem.model.vo.DeemPro;
import com.kh.jaga.vatDeem.model.vo.DeemSlip;

@Service
public class DeemServiceImpl implements DeemService{

	@Autowired
	private DeemDao dd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public Deem selectDeem(Deem deem) {
		// TODO 마감된 의제매입신고서 있나 확인한러감
		return dd.selectDeem(deem,sqlSession);
	}
	@Override
	public List<DeemPro> selectDeemPro(DeemPro dp) {
		// TODO 마감처리된 공급자 찾으러감
		System.out.println("Service: selectDeemPro: dp: "+dp);
		return dd.selectDeemPro(dp,sqlSession);
	}
	@Override
	public DeemOther selectDeemOther(DeemOther deo) {
		// TODO Auto-generated method stub
		return dd.selectDeemOther(deo,sqlSession);
	}
	@Override
	public List<DeemSlip> selectDeemSlip(DeemSlip dSlip) {
		// TODO Auto-generated method stub
		return dd.selectDeemSlip(dSlip,sqlSession);
	}
	@Override
	public int updateDeadCenDeem(Deem deem) {
		// TODO Auto-generated method stub
		return dd.updateDeadLineCenDeem(deem,sqlSession);
	}
	@Override
	public int updatedeem(Deem deem) {
		// TODO Auto-generated method stub
		return dd.updateDeem(deem,sqlSession);
	}
	@Override
	public List<DeemSlip> selectDeemSlip(Receiption re, Date eD) {
		// TODO Auto-generated method stub
		System.out.println("Service: selectDeemSlip: re: eD"+re+eD);
		return dd.selectDeemSlip(re,eD,sqlSession);
	}
	@Override
	public int insertDeem(Deem deem2) {
		// TODO Auto-generated method stub
		return dd.insertDeem(deem2,sqlSession);
	}
	@Override
	public String selectDeemedCode() {
		// TODO Auto-generated method stub
		return dd.selectDeemedCode(sqlSession);
	}
	@Override
	public int insertDeemSlip(List<DeemSlip> dsList) {
		// TODO Auto-generated method stub
		return dd.insertDeemSlip(dsList,sqlSession);
	}
	@Override
	public int insertDeemPro(List<DeemPro> dpList) {
		// TODO Auto-generated method stub
		return dd.insertDeemPro(dpList,sqlSession);
	}
	@Override
	public BigDecimal selectAsmt(Receiption re, Date eD) {
		// TODO Auto-generated method stub
		return dd.selectAsmt(re,eD,sqlSession);
	}
	@Override
	public int insertDeemOther(DeemOther deo) {
		// TODO Auto-generated method stub
		return dd.insertDeemOther(deo,sqlSession);
	}
	@Override
	public DeemPro selectFarm(DeemPro dp, Receiption re, Date eD) {
		// TODO Auto-generated method stub
		return dd.selectFarm(dp,re,eD,sqlSession);
	}
	

}
