package com.kh.jaga.vatSumTaxInv.model.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDto;
import com.kh.jaga.vatSumTaxInv.model.vo.SumTaxInvDetail;

@Repository
public interface SumOfTaxInvDao {

	SumOfTaxInvDto selectSotiDto(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto);

	List<SumOfTaxInvDiv> selectSotiDiv(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2);

	List<SumOfTaxInvDiv> selectSotiDivPur(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2);

	List<SumTaxInvDetail> selectSotiDetailSales(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2);

	List<SumTaxInvDetail> selectSotiDetailPur(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2);

	List<SumTaxInvDetail> selectReceition(SqlSessionTemplate sqlSession, Receiption receiptionPur, Date eD);

	int insertSoti(SqlSessionTemplate sqlSession, SumOfTaxInv soti);

	String selectSotiCurrval(SqlSessionTemplate sqlSession) throws Exception;

	int insertDetailList(SqlSessionTemplate sqlSession, List<SumTaxInvDetail> rePur);

	int insertDivList(SqlSessionTemplate sqlSession, List<SumOfTaxInvDiv> sDivPur);

	int insertsDtoDeadline(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto);

	int updatesDtoDeadLineCen(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto);

}
