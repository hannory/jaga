package com.kh.jaga.vender.model.service;

import java.util.List;

import com.kh.jaga.vender.model.vo.Vender;

public interface VenderService {

	int insertVender(Vender v);

	List<Vender> selectVender(String comCode);

	List<Vender> selectOne(String venderCode);

	int modifyOne(Vender v);

	List<Vender> selectBankList();


}
