package com.kh.jaga.slip.model.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;

import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Receiption2;

@Controller
public interface TransectionHistoryService {

	List<Receiption> selectTListAll(String comCode);

	List<Receiption2> selectDateList(HashMap<String, Object> hm);

	List<Journalize> selectDetailJournal(String slipCode);

}
