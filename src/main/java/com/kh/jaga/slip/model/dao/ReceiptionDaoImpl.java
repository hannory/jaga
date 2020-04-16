package com.kh.jaga.slip.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.Vender;

@Repository
public class ReceiptionDaoImpl implements ReceiptionDao {

	@Override
	public List<Vender> selectVenderList(SqlSessionTemplate sqlSession) throws receiptionException {
		List<Vender> list = sqlSession.selectList("Receiption.selectVenderList");
		
		if(list == null) {
			throw new receiptionException("거래처리스트출력실패!!");
		}
		
		return list;
	}
	
}
