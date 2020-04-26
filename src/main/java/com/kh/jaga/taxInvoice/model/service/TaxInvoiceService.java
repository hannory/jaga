package com.kh.jaga.taxInvoice.model.service;

import java.util.List;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.taxInvoice.model.vo.TaxInvoicePrintDTO;

public interface TaxInvoiceService {

	List<Receiption> selectTListAll(Company com);

	TaxInvoicePrintDTO selectTaxInvoice(String slipCode);

	int updatePrintStatus(String slipCode);

}
