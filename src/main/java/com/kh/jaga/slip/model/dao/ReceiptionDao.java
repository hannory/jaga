package com.kh.jaga.slip.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.Vender;

public interface ReceiptionDao {

	List<Vender> selectVenderList(SqlSessionTemplate sqlSession) throws receiptionException;

}
