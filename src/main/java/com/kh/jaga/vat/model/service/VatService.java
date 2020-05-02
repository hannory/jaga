package com.kh.jaga.vat.model.service;

import org.springframework.stereotype.Service;

import com.kh.jaga.vat.model.vo.Vat;

@Service
public interface VatService {

	Vat selectVat(Vat vat);

}
