package com.kh.jaga.taxInvoice.model.service;

import java.util.List;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;

public interface TaxInvoiceService {

	List<Receiption> selectTListAll(Company com);

}
