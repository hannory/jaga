package com.kh.jaga.vatDeem.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.jaga.vatDeem.model.vo.Deem;
import com.kh.jaga.vatDeem.model.vo.DeemOther;
import com.kh.jaga.vatDeem.model.vo.DeemPro;
import com.kh.jaga.vatDeem.model.vo.DeemSlip;

@Service
public interface DeemService {

	Deem selectDeem(Deem deem);

	List<DeemPro> selectDeemPro(DeemPro dp);

	DeemOther selectDeemOther(DeemOther deo);

	List<DeemSlip> selectDeemSlip(DeemSlip dSlip);

}
