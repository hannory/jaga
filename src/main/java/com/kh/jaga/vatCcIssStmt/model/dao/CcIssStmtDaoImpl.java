package com.kh.jaga.vatCcIssStmt.model.dao;

import java.math.BigDecimal;
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
		map.put("Receiption",re);
		map.put("endDate",eD);
		List<Receiption> recei=sqlSession.selectList("CcIssStmt.selectNewCcIssStmt", map);
	
		//가지고온 전표를 종류별로 나눠서 계산한후 CcIssStmt로 담아서 보내줌
		CcIssStmt cis=new CcIssStmt();
		cis.setComCode(re.getComCode()); //회사코드
		
		BigDecimal cardTaxSum= new BigDecimal(0);//카드_과세매출분 합계
		BigDecimal cardFreeSum= new BigDecimal(0);//카드_면세매출분 합계
		BigDecimal sum= new BigDecimal(0);//현금_면세매출분 합계
		BigDecimal freeSum= new BigDecimal(0);//현금_면세매출분 합계
		  for(Receiption rc: recei) {
		  //전표들을 불러와서 전표구분에따라서 나눠주고 ccIssStmt로 받은 다음에 리턴해주기
			  if(rc.getEvidenceCode().equals("50")||rc.getEvidenceCode().equals("70")) {
				  
				  BigDecimal price=null;//공급대가(공급가액+부가세)
				  
				  price=rc.getSupplyValue().add(rc.getValueTax());
				  System.out.println("공급대가:"+price);
	
				  cardTaxSum=cardTaxSum.add(price);
				  cis.setCardTax(cardTaxSum);
				  
				  System.out.println("카드 과세합계: "+cis.getCardTax());
			  }else if(rc.getEvidenceCode().equals("60")) {//카드_면세
				  
				  BigDecimal price=null;//공급대가(공급가액+부가세)
				  
				  price=rc.getSupplyValue().add(rc.getValueTax());
				  System.out.println("카드면세_공급대가:"+price);
	
				  cardFreeSum=cardFreeSum.add(price);
				  cis.setCardTaxFree(cardFreeSum);
				  
				  System.out.println("카드 면세합계: "+cis.getCardTaxFree());
			  }else if(rc.getEvidenceCode().equals("100")||rc.getEvidenceCode().equals("90")) {//현금영수증_과세,영세
				  BigDecimal price=null;//공급대가(공급가액+부가세)
				  
				  price=rc.getSupplyValue().add(rc.getValueTax());
				  System.out.println("현금과세_공급대가:"+price);
	
				  sum=sum.add(price);
				  cis.setCashTax(sum);
				  
				  System.out.println("현금 과세합계: "+cis.getCashTax());
			  }else if(rc.getEvidenceCode().equals("80")) {//현금영수증_과세,영세
				  BigDecimal price=null;//공급대가(공급가액+부가세)
				  
				  price=rc.getSupplyValue().add(rc.getValueTax());
				  System.out.println("현금면세_공급대가:"+price);
	
				  sum=sum.add(price);
				  cis.setCashTaxFree(sum);;
				  
				  System.out.println("현금 면세합계: "+cis.getCashTaxFree());
			  }
		  }
		  	System.out.println("dao 전표 계산후: "+cis);
		
		
				
   		return cis;
	}

	@Override
	public int insertCis(SqlSessionTemplate sqlSession, CcIssStmt cis) {
		// TODO Auto-generated method stub
		System.out.println("Dao 마감처리: "+cis);
		return sqlSession.insert("CcIssStmt.insertCcIssStmt",cis);
	}

	@Override
	public String selectCurrvalCcIssStmt(SqlSessionTemplate sqlSession, CcIssStmt cis) {
		// TODO 커발 찾기
		
		String issCode=sqlSession.selectOne("CcIssStmt.selectCurrvalCis",cis);
		System.out.println("dao selectCurrval issCode Cis:"+issCode);
		
		return issCode;
	}

	@Override
	public int updateCcIssStmt(SqlSessionTemplate sqlSession, CcIssStmt cis) {
		// TODO 마감상태 update하러 가기 cis
		
		System.out.println("dao 디비가기전 cis: "+cis);
		int result =sqlSession.update("CcIssStmt.updateCisDeadline", cis);
		
		System.out.println("dao result업데이트 상태보기");
		
		return result;
	}

}
