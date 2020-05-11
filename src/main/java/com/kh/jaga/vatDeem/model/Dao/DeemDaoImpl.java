package com.kh.jaga.vatDeem.model.Dao;


import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.vo.Receiption;
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

	@Override
	public int updateDeadLineCenDeem(Deem deem, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		System.out.println("Dao: updateDeadLineCenDeem: deem: "+deem);
		int result=sqlSession.update("Deem.updateDeadLineCenDeem",deem);
		return result;
	}

	@Override
	public int updateDeem(Deem deem, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		System.out.println("Dao: updateDeem: deem: "+deem);
		int result=sqlSession.update("Deem.updateDeem",deem);
		return result;
	}

	@Override
	public List<DeemSlip> selectDeemSlip(Receiption re, Date eD, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",re);
		map.put("endDate",eD);
		List<DeemSlip> dsList=sqlSession.selectList("Deem.selectListDeemSlip",map);
		System.out.println("Dao: selectDeemSlip: dsList: "+dsList);
		return dsList;
	}

	@Override
	public int insertDeem(Deem deem2, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int result=sqlSession.insert("Deem.insertDeem",deem2);
		return result;
	}

	@Override
	public String selectDeemedCode(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		String deemedCode=sqlSession.selectOne("Deem.selectDeemedCode");
		return deemedCode;
	}

	@Override
	public int insertDeemSlip(List<DeemSlip> dsList, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		
		int result=0;
		for(DeemSlip deemSlip: dsList) {	
			result=sqlSession.insert("Deem.insertDeemSlip",deemSlip);
		}
		return result;
	}

	@Override
	public int insertDeemPro(List<DeemPro> dpList, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		int result=0;
		System.out.println("Dao: insertDeemPro: result:before: "+dpList);
		for(DeemPro dp: dpList) {
			result=sqlSession.insert("Deem.insertDeemPro",dp);
			System.out.println("Dao: insertDeemPro: result: for: "+result);
		}
		
		System.out.println("Dao: insertDeemPro: result: "+result);
		
		return result;
	}

	@Override
	public BigDecimal selectAsmt(Receiption re, Date eD, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",re);
		map.put("endDate",eD);
		BigDecimal asmt=sqlSession.selectOne("Deem.selectAsmt",map);
		return asmt;
	}

	@Override
	public int insertDeemOther(DeemOther deo, SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		System.out.println("Dao: insertDeemOther: deo: "+deo);
		int result=sqlSession.insert("Deem.insertDeemOther",deo);
		System.out.println("Dao: insertDeemOther: result: "+result);
		return result;
	}

	@Override
	public DeemPro selectFarm(DeemPro dp,  Receiption re, Date eD,SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		System.out.println("Dao:selectFarm: dpro: "+dp);
		System.out.println("Dao:selectFarm: re: "+re);
		System.out.println("Dao:selectFarm: eD: "+eD);
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",re);
		map.put("endDate",eD);
		map.put("DeemPro",dp);
		DeemPro dpro=sqlSession.selectOne("Deem.selectFarm",map);
		System.out.println("Dao:selectFarm: dpro: "+dpro);
		return dpro;
	}

}
