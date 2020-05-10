package com.kh.jaga.vatDeem.model.Dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.vatDeem.model.vo.Deem;
import com.kh.jaga.vatDeem.model.vo.DeemOther;
import com.kh.jaga.vatDeem.model.vo.DeemPro;
import com.kh.jaga.vatDeem.model.vo.DeemSlip;

@Repository
public class DeemDaoImpl implements DeemDao{

	@Override
	public Deem selectDeem(Deem deem, SqlSessionTemplate sqlSession) {
		// TODO 마감된 의제매입신고서 있나 찾아봄
		Deem deem2=sqlSession.selectOne("Deem.selectDeem",deem);
		System.out.println("Dao: selectDeem: deem2: "+deem2);
		return deem2;
	}

	@Override
	public List<DeemPro> selectDeemPro(DeemPro dp, SqlSessionTemplate sqlSession) {
		// TODO 공급자 불러오기(마감된거)
		
		System.out.println("Dao: selectDeemPro: dp: "+dp);
		List<DeemPro> dpList=sqlSession.selectList("Deem.selectDeemProList",dp);
		System.out.println("Dao: selectDeemPro: dpList: "+dpList);
		
		return dpList;
	}

	@Override
	public DeemOther selectDeemOther(DeemOther deo, SqlSessionTemplate sqlSession) {
		// TODO 과세표준표 가지고오기
		System.out.println("Dao: selectDeemOther: deo: "+deo);
		DeemOther dot=sqlSession.selectOne("Deem.selectDeemOther",deo);
		System.out.println("Dao: selectDeemOther: dot: "+dot);
		return dot;
	}

	@Override
	public List<DeemSlip> selectDeemSlip(DeemSlip dSlip, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		System.out.println("Dao: selectDeemSlip: "+dSlip);
		List<DeemSlip> dsList=sqlSession.selectList("Deem.selectDeemSlip",dSlip);
		return dsList;
	}

}
