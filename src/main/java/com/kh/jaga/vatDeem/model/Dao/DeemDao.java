package com.kh.jaga.vatDeem.model.Dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
