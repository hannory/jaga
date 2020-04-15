package com.kh.jaga.bugagachi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;

@Repository
public interface CcSalesSlipGapDao {

	List<CcSalesSlipGap> selectCssg(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg);

}
