package com.kh.jaga.vatCcIssStmt.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.aspectj.weaver.ast.HasAnnotation;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;

@Repository
public class CcIssStmtDaoImpl implements CcIssStmtDao{

	@Override
	public CcIssStmt selectCis(SqlSessionTemplate sqlSession, CcIssStmt cis) {
		// TODO cis로 디비cc_iss_stmt테이블가기
		CcIssStmt cis2=sqlSession.selectOne("CcIssStmt.selectCcIssStmt", cis);
		
		System.out.println("daoimpl cis2:"+cis2);
		
		return cis2;
	}

	@Override
	public CcIssStmt selectNewCis(SqlSessionTemplate sqlSession, Receiption re, Date eD) {
		// TODO 새로운 전표값 받고 계산후 넘겨주기
		HashMap<String, Object> map=new HashMap<String, Object>();
		if(re.getSlipDate().equals("20/01/01")) {
			map.put("Receiption",re);
			map.put("endDate",eD);
			List<Receiption> recei=sqlSession.selectList("CcIssStmt.selectNewCcIssStmt", map);
			System.out.println("1기확정 전표list: "+recei);
			System.out.println("1기확정일때 전표에서 값사져오기");
		}else if(re.getSlipDate().equals("20/01/01")) {
			List<Receiption> recei=sqlSession.selectList("CcIssStmt.selectNewCcIssStmt1", re);
			System.out.println("2기확정일때 전표에서 값사져오기");
		}
				
   		return null;
	}

}
