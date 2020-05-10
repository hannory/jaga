package com.kh.jaga.vatDeem.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
