package com.kh.jaga.vatCcIssStmt.model.service;

import java.sql.Date;

import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;

@Service
public interface CcIssStmtService {

	CcIssStmt selectCis(CcIssStmt cis);

	CcIssStmt selectNewCis(Receiption re, Date stD);

}
