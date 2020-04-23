package com.kh.jaga.bugagachi.model.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlipDetail;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;
import com.kh.jaga.bugagachi.model.vo.TnxHis;
import com.kh.jaga.slip.model.vo.Receiption;

@Repository
public interface CcSalesSlipGapDao {
  
	List<CcSalesSlipDetail> selectCssg(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

	CcSalesSlipGap selectCcGap(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

	List<TnxHis> selectTnxHis(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

	String selectCssgPk(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) throws Exception;

	int updateCcSalesSlipGap(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

	List<TnxHis> selectNewRecei(SqlSessionTemplate sqlSession, Receiption re,Date eD);

	int insertCssg(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

	String selectCssgPk2(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) throws Exception;

	int insertCssgDetail(SqlSessionTemplate sqlSession, List<CcSalesSlipDetail> cgDetailList, String pk);

}
