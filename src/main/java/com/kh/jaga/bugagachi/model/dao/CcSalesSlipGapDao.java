package com.kh.jaga.bugagachi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlipDetail;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;
import com.kh.jaga.bugagachi.model.vo.TnxHis;

@Repository
public interface CcSalesSlipGapDao {
  
	List<CcSalesSlipDetail> selectCssg(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

	CcSalesSlipGap selectCcGap(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

	List<TnxHis> selectTnxHis(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

	String selectCssgPk(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

	int updateCcSalesSlipGap(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

}
