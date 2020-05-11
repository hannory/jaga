package com.kh.jaga.vatDeem.model.Dao;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatDeem.model.vo.Deem;
import com.kh.jaga.vatDeem.model.vo.DeemOther;
import com.kh.jaga.vatDeem.model.vo.DeemPro;
import com.kh.jaga.vatDeem.model.vo.DeemSlip;

@Repository
public interface DeemDao {

	Deem selectDeem(Deem deem, SqlSessionTemplate sqlSession);

	List<DeemPro> selectDeemPro(DeemPro dp, SqlSessionTemplate sqlSession);

	DeemOther selectDeemOther(DeemOther deo, SqlSessionTemplate sqlSession);

	List<DeemSlip> selectDeemSlip(DeemSlip dSlip, SqlSessionTemplate sqlSession);

	int updateDeadLineCenDeem(Deem deem, SqlSessionTemplate sqlSession);

	int updateDeem(Deem deem, SqlSessionTemplate sqlSession);

	List<DeemSlip> selectDeemSlip(Receiption re, Date eD, SqlSessionTemplate sqlSession);

	int insertDeem(Deem deem2, SqlSessionTemplate sqlSession);

	String selectDeemedCode(SqlSessionTemplate sqlSession);

	int insertDeemSlip(List<DeemSlip> dsList, SqlSessionTemplate sqlSession);

	int insertDeemPro(List<DeemPro> dpList, SqlSessionTemplate sqlSession);

	BigDecimal selectAsmt(Receiption re, Date eD, SqlSessionTemplate sqlSession);

	int insertDeemOther(DeemOther deo, SqlSessionTemplate sqlSession);

	DeemPro selectFarm(DeemPro dp, Receiption re, Date eD, SqlSessionTemplate sqlSession);


}
