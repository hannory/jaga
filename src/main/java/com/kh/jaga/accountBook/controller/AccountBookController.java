package com.kh.jaga.accountBook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountBookController {
	@GetMapping("dailyTable.ab")
	public String showDailyTable() {
		return "dailyTable";
	}
}
