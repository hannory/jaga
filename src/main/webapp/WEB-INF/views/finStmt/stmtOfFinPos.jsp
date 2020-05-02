<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.subtitle {
		font-size:21px;
		margin-right:60px;
	}
	#foldBtn {
		background:#24574A;
		border-radius:4px;
		padding:1px;
		padding-bottom:7px;
		color:white;
	}
	#foldImg {
		height:30px;
		padding:1px;
		padding-right:3px;
	}
	#saveBtn, #closeBtn {
		/* display: none; */
	}
	#cancleBtn {
		/* display: none; */
		border:1px solid red; 
		color:red;
	}
	.normal-label {
		margin:0px;
	}
	.table-head {
		border:1px solid #a6a6a6;
		background:#e7e6e6;
	}
	.table-title {
		background:#7edfc6;
		text-align:left;
		padding-left:20px;
	}
	.table-subTitle {
		background:#d3ede6;
		text-align:left;
		padding-left:40px;
	}
	.table-subSubTitle {
		text-align:left;
		padding-left:61px;
	}
	.table-content {
		text-align:right;
	}
	.modal-head {
		border: 1px solid #a6a6a6;
		background: #e7e6e6;
		text-align: center;
	}
	#pastDate {
		background: #f165b2;
		padding-top: 1px;
		padding-bottom: 1px;
	}
</style>
<title>자가 경리</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<main>
	<div class="container-fluid">
		<table width="1100px">
			<tr>
				<td><h2 class="mt-4">재무제표</h2></td>
			</tr>
		</table>
		<table style="margin-bottom:15px">
			<tr>
				<td><span class="subtitle"><a href="compTrialBal.fs">합계잔액시산표</a></span></td>
				<td><span class="subtitle" style="border-bottom:1px solid #24574A">재무상태표</span></td>
				<td><span class="subtitle"><a href="incomeStmt.fs">손익계산서</a></span></td>
				<td><span class="subtitle"><a href="mfrgStmt.fs">제조원가명세서</a></span></td>
				<td><span class="subtitle"><a href="stmtOfCashFlow.fs">현금흐름표</a></span></td>
				<td align="right" style="width:180px;"><span id="foldBtn"><img id="foldImg" src="${contextPath}/resources/images/fold.PNG"></span></td>
			</tr>
		</table>
		<form id="contentForm" action="insertMfrgStmt.fs" method="post">
			<ol class="breadcrumb mb-4">
				<table id="searchReTable">
					<tr>
						<td style="width:150px;">조회기간 : </td>
						<td>
							<input type="text" id="datepicker">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button onclick="return dateSearch();">검색</button></td>
					</tr>
				</table>
			</ol>
			<table style="width:100%; max-width:1100px;">
				<tr>
					<td>
						<span style="margin-bottom:10px; color:red;"><img src="${ contextPath }/resources/images/pencil.PNG"><label class="normal=lable" id="requestMsg">기말원재료재고액을 입력하세요</label></span>
						&nbsp;&nbsp;&nbsp;&nbsp;		
						<button type="button" id="saveBtn" onclick="saveMfrgStmt();">저장</button>
						&nbsp;&nbsp;
						<button type="button" id="closeBtn" onclick="closeMfrgStmt();">마감</button>
						<input type="hidden" id="closing" name="closing">
						<button type="button" id="cancleBtn" onclick="cancleClosing();">마감 취소</button>
					</td>
					<td align="right">
					</td>
				</tr>
			</table>
			<table id="contentTable" width="1100px" style="text-align:center;">
				<tr>
					<td class="table-head" width="28%" rowspan="2">과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
						<input type="hidden" id="login-openDay" value="${ sessionScope.loginCompany.gaeup }">
						<input type="hidden" id="term" name="term">
					</td>
					<td class="table-head" colspan="2">제 <label class="normal-label" id="cur-term"></label>(당)기 2020.<label class="normal-label" id="cur-month"></label>.<label class="normal-label" id="cur-date"></label> 현재</td>
					<td class="table-head" colspan="2">제 <label class="normal-label" id="past-term"></label>(전)기 2019.12.31 현재</td>
				</tr>
				<tr>
					<td class="table-head" colspan="2">금액</td>
					<td class="table-head" colspan="2">금액</td>
				<tr>
					<td class="table-title" style="padding-left:0px;">자산</td>
					<td class="table-title" width="18%"></td>
					<td class="table-title" width="18%"></td>
					<td class="table-title" width="18%"></td>
					<td class="table-title" width="18%"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅰ. 유동자산</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">① 당좌자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">현금및현금성자산</td>
					<td class="table-content"><span id="c10100"></span></td>
					<td></td>
					<td class="table-content"><span id="p10100"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">단기투자자산</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">매출채권</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">② 재고자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅱ. 비유동자산</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">① 투자자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">② 유형자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">③ 무형자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">④ 기타비유동자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
				</tr>
				<tr>
					<td class="table-title" style="padding-left:0px;">자산총계</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title" style="padding-left:0px;">부채</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅰ. 유동부채</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅱ. 비유동부채</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title" style="padding-left:0px;">부채총계</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title" style="padding-left:0px;">자본</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅰ. 자본금</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅱ. 자본잉여금</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅲ. 자본조정</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅳ. 기타포괄손익누계액</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅴ. 이익잉여금</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title" style="padding-left:0px;">(당기순이익)</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title" style="padding-left:0px;">자본총계</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title" style="padding-left:0px;">부채와자본총계</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
			</table>
		</form>
		<div style="height: 10vh;"></div>
		<div class="card mb-4">
			<div class="card-body">재무상태표는 일정시점 현재 기업이 보유하고 있는 경제적 자원인 자산과 경제적 의무인 부채, 그리고 자본에 대한 정보를 제공하는 재무보고서로서, 정보이용자들이 기업의 유동성
			, 재무적 탄력성, 수익성과 위험 등을 평가하는 데 유용한 정보를 제공한다.</div>
		</div>
	</div>
	</main>
	<script>
		//날짜 input jquery ui
		$.datepicker.setDefaults({
			showOn : "both",
			buttonImageOnly : true,
			buttonImage : "${contextPath}/resources/images/calendar.png",
			dateFormat : 'yy-mm-dd'
	
		});
		
		$(function() {
			$("#datepicker").datepicker({});
			//달력버튼
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
			
			//표에서 하늘색 hover 주기
			$("#contentTable td").mouseover(function() {
				$(this).parent().css("background", "#DDEBF7");
			});
			
			$("#contentTable td").mouseout(function() {
				$(this).parent().css("background", "white");
			});		
			
			//현재 날자로 기본값 설정
			var curDate = new Date();
			
			var getYear = curDate.getFullYear();
			var doubleMonth = ("0" + (curDate.getMonth() + 1)).slice(-2);
			var doubleDate = ("0" + curDate.getDate()).slice(-2);
			
			$("#cur-month").text(doubleMonth);
			$("#cur-date").text(doubleDate);
			
			var fullDate = getYear + "-" + doubleMonth + "-" + doubleDate;
			$("#datepicker").val(fullDate);
			
			//로그인 회사로 기수 설정
			var openDay = $("#login-openDay").val();
			var openYear = String(openDay).substring(0,4);
			
			var curTerm = Number(getYear) - Number(openYear) + 1;
			var pastTerm = curTerm - 1;
			
			$("#cur-term").text(curTerm);
			$("#term").val(curTerm);
			$("#past-term").text(pastTerm);
		});
		
		//콤마 찍기
		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
		}
		
		//콤마 등 숫자 이외의 입력값 제거
		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, "");
		}
		
		//(날짜를 통한) 검색 버튼 클릭 시
		function dateSearch() {
			console.log("달력값 : " + $("#datepicker").val());
			
			dateArray = ($("#datepicker").val()).split("-");
			
			console.log(dateArray[0] + "|" + dateArray[1] + "|" + dateArray[2]);
			
			$.ajax({
				url : "selectFinPos.fs",
				type : "get",
				data : {
					year : dateArray[0],
					month : dateArray[1],
					date : dateArray[2]
				},
				success : function(data) {
					$("#cur-month").text(dateArray[1]);
					$("#cur-date").text(dateArray[2]);
					
					//-------------당기-------------
					var c10100 = data["c10100"];
					
					$("#c10100").text(comma(c10100));
				}
			})
			
			return false;
		}
		
		//접기 버튼 클릭시
		$(document).on("click", "#foldBtn", function() {
			var clicks = $(this).data('clicks');
			
			if(clicks) {
				$("#foldImg").attr({'src':'${ contextPath }/resources/images/fold.PNG'});
				$(".table-detail").fadeIn(200);
			} else {
				$("#foldImg").attr({'src':'${ contextPath }/resources/images/unfold.PNG'});
				$(".table-detail").fadeOut(200);
			}
			
			$(this).data('clicks', !clicks);
		})
		
		//원장조회 모달 띄우기
		$(document).on("dblclick", '.table-content', function() {
			
			if($(this).text() == 0 | $(this).text() == "") {
				
				Swal.fire({
					icon: "warning",
					text: "조회할 원장내역이 없습니다"
				})
				
			} else {
				$("#slip").modal();
				
				var year = dateArray[0];
				var month = dateArray[1];
				var accountCode = $(this).children('span').attr('id').substring(1,6);
				var curPast = $(this).children('span').attr('id').substring(0,1);
				
				$("#modal-account-code").val(accountCode);
				
				var fromDate = "";
				var toDate = "";
				
				if(curPast == "p") {
					$("#pastDate").text("전기 데이터 조회중");
					
					fromDate = (Number(year) - 1) + "-01";
					toDate = (Number(year) - 1) + "-" + month;
				} else {
					$("#pastDate").text("");
					
					fromDate = year + "-01";
					toDate = year + "-" + month;
				}
				
				$("#datepicker3").val(fromDate);
				$("#datepicker4").val(toDate);
				
				console.log("FinPos AJAX 넘어가는 값 테스트 : " + year + ", " + month + ", " + curPast + ", " + accountCode);
				
				$.ajax({
					url : "selectSlip.fs",
					type : "get",
					data : {
						year : year,
						month : month,
						curPast : curPast,
						accountCode : accountCode
					},
					success : function(data) {
						console.log("data[0] FinPos" + data[0]);
						$("#modal-account-title").val(data[0].accountTitle);
						
						$tableBody = $("#list_detail tbody");
						//테이블을 갱신하기 위해 비워줌
						$tableBody.html('');
						
						var balance = 0;			//잔액
						var monthDebitBal = 0;		//차변 월계
						var monthCreditBal = 0;		//대변 월계
						var accDebitBal = 0;		//차변 누계
						var accCreditBal = 0;		//대변 누계
						
						//월별로 월계, 누계 계산을 위한 변수
						var monthCheck = 0;
						
						$.each(data, function(index, value) {
							//일자 뽑기
							var dateArray = String((value.slipDate).split(",", 1)).split(" ", 2);
							var date = dateArray[1];
							
							//일자를 2자리수로 만들기
							if(date.length == 1) {
								var date = 0 + date;
							}
							
							var month = (value.slipDate).split('월', 1);
							
							//해당 계정과목 값의 첫 월 계산
							if(index == 0) {
								monthCheck = Number(month);
							}
							
							//달이 바뀌어 월계, 누계 계산이 필요한 경우
							if(month != monthCheck) {
								//월계 계산
								var $mtr = $("<tr>").attr("class", "modal-head");
								var $mtd1 = $("<td>").attr("class", "modal-head");
								var $mtd2 = $("<td>").attr("class", "modal-head");
								var $mtd3 = $("<td>").attr("class", "modal-head").text("[월\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0계]").css("text-align", "left");
								var $mtd4 = $("<td>").attr("class", "modal-head");
								var $mtd5 = $("<td>").attr("class", "modal-head");
								
								var $mtd6 = $("<td>").attr("class", "modal-head").text(comma(monthDebitBal)).css("text-align", "right");
								var $mtd7 = $("<td>").attr("class", "modal-head").text(comma(monthCreditBal)).css("text-align", "right");
								
								/* if(value.debitCredit == "차변") {
									var $mtd6 = $("<td>").attr("class", "modal-head").text(comma(monthBalance)).css("text-align", "right");
									var $mtd7 = $("<td>").attr("class", "modal-head");
								} else {
									var $mtd6 = $("<td>").attr("class", "modal-head");
									var $mtd7 = $("<td>").attr("class", "modal-head").text(comma(monthBalance)).css("text-align", "right");
								} */
								
								var $mtd8 = $("<td>").attr("class", "modal-head");
								
								$mtr.append($mtd1);
								$mtr.append($mtd2);
								$mtr.append($mtd3);
								$mtr.append($mtd4);
								$mtr.append($mtd5);
								$mtr.append($mtd6);
								$mtr.append($mtd7);
								$mtr.append($mtd8);
								$tableBody.append($mtr);
								
								//누계 계산
								var $atr = $("<tr>").attr("class", "modal-head");
								var $atd1 = $("<td>").attr("class", "modal-head");
								var $atd2 = $("<td>").attr("class", "modal-head");
								var $atd3 = $("<td>").attr("class", "modal-head").text("[누\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0계]").css("text-align", "left");
								var $atd4 = $("<td>").attr("class", "modal-head");
								var $atd5 = $("<td>").attr("class", "modal-head");
								
								var $atd6 = $("<td>").attr("class", "modal-head").text(comma(accDebitBal)).css("text-align", "right");
								var $atd7 = $("<td>").attr("class", "modal-head").text(comma(accCreditBal)).css("text-align", "right");
								
								/* if(value.debitCredit == '차변') {
									var $atd6 = $("<td>").attr("class", "modal-head").text(comma(balance)).css("text-align", "right");
									var $atd7 = $("<td>").attr("class", "modal-head");
								} else {
									var $atd6 = $("<td>").attr("class", "modal-head");
									var $atd7 = $("<td>").attr("class", "modal-head").text(comma(balance)).css("text-align", "right");
								} */
								
								var $atd8 = $("<td>").attr("class", "modal-head");
								
								$atr.append($atd1);
								$atr.append($atd2);
								$atr.append($atd3);
								$atr.append($atd4);
								$atr.append($atd5);
								$atr.append($atd6);
								$atr.append($atd7);
								$atr.append($atd8);
								$tableBody.append($atr);
								
								//월계 초기화
								monthDebitBal = 0;
								monthCreditBal = 0;
							}
							
							if(month != monthCheck) {
								var gap = month - monthCheck;
								monthCheck += gap;
							}
							
							//월을 두자리수로 만들기
							if(String(month).lenght == 1) {
								var month = 0 + month;
							}
							
							//전표별 값 입력
							var $tr = $("<tr>");
							var $dateTd = $("<td>").text(month + "-" + date).css("text-align", "center");
							var $dateSlipCodeTd = $("<td>").text(value.dateSlipCode).css("text-align", "center");
							var $briefTd = $("<td>").text(value.brief);
							var $venderCodeTd = $("<td>").text(value.venderCode).css("text-align", "center");
							var $venderNameTd = $("<td>").text(value.venderName);
							
							//차변 대변 구분 출력 및 계산
							if(value.debitCredit == '차변') {
								var $debitTd = $("<td>").text(comma(value.price)).css("text-align", "right");
								var $creditTd = $("<td>");
								
								balance += value.price;
								monthDebitBal += value.price;
								accDebitBal += value.price;
							} else {
								var $debitTd = $("<td>");
								var $creditTd = $("<td>").text(comma(value.price)).css("text-align", "right");
								
								balance -= value.price;
								monthCreditBal += value.price;
								accCreditBal += value.price;
							}
							
							//누계 출력
							var $balanceTd = $("<td>").text(comma(balance)).css("text-align", "right");
							
							$tr.append($dateTd);
							$tr.append($dateSlipCodeTd);
							$tr.append($briefTd);
							$tr.append($venderCodeTd);
							$tr.append($venderNameTd);
							$tr.append($debitTd);
							$tr.append($creditTd);
							$tr.append($balanceTd);
							$tableBody.append($tr);
						});
						
						//마지막행 월계, 누게에 값 입력
						$("#last-debit-month").text(comma(monthDebitBal)).css("text-align", "right");
						$("#last-debit-acc").text(comma(accDebitBal)).css("text-align", "right");
						$("#last-credit-month").text(comma(monthCreditBal)).css("text-align", "right");
						$("#last-credit-acc").text(comma(accCreditBal)).css("text-align", "right");
						
						/* if(data[0].debitCredit == "차변") {
							$("#last-debit-month").text(comma(monthBalance)).css("text-align", "right");
							$("#last-debit-acc").text(comma(balance)).css("text-align", "right");
							$("#last-credit-month").text("");
							$("#last-credit-acc").text("");
						} else {							
							$("#last-debit-month").text("");
							$("#last-debit-acc").text("");
							$("#last-credit-month").text(comma(monthBalance)).css("text-align", "right");
							$("#last-credit-acc").text(comma(balance)).css("text-align", "right");
						} */
						
					},
					error : function(status) {
						console.log(status);
					}
				})
			}
		})
	</script>
	
	<!-- Bootstrap 원장조회 모달 -->
	<div class="modal fade" id="slip" role="dialog">
    	<div class="modal-dialog modal-lg">
	      <div class="modal-content">
		        <div class="modal-header" style="background-color:#1B5748;">
		        	<h4 class="modal-title" style="color:white;">원장조회</h4>
		        	<button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
			    	<table width="100%" style="margin-bottom:5px">
			        	<tr>
			        		<td>계정과목&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="modal-account-title" readonly>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="modal-account-code" size="4" readonly>
			        		</td>
			        		<td align="right"><span id="pastDate"></span>&nbsp;&nbsp;<span>조회기간&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" id="datepicker3"> ~ <input type="text" id="datepicker4"></td>
			        	</tr>
			        </table>
					<script>
							/* 날짜 input jquery ui */
							$.datepicker
									.setDefaults({
										showOn : "both",
										buttonImageOnly : true,
										buttonImage : "${contextPath}/resources/images/calendar.png",
										dateFormat : 'yy-mm-dd'
	
									});
							$(function() {
								$("#datepicker3").datepicker({});
								$("#datepicker4").datepicker({});
								/* 달력버튼 */
								$("img.ui-datepicker-trigger")
										.attr(
												"style",
												"margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
							});
							
							
					</script>
					<div>
			        	<table id="list_detail" style=" width:100%; margin-left:auto; margin-right: auto;">
			        		<thead>
				        		<tr>
				        			<td class="modal-head" style="width:5%;">일자</td>
				        			<td class="modal-head" style="width:6%;">번호</td>
				        			<td class="modal-head" style="width:20%;">적요</td>
				        			<td class="modal-head" style="width:6%;">코드</td>
				        			<td class="modal-head" style="width:18%;">거래처명</td>
				        			<td class="modal-head" style="width:15%;">차변</td>
				        			<td class="modal-head" style="width:15%;">대변</td>
				        			<td class="modal-head" style="width:15%;">잔액</td>
				        		</tr>
				        	</thead>
				        	<tbody>
				        	</tbody>
				        	<tfoot>
				        		<tr>
				        			<td class="modal-head"></td>
				        			<td class="modal-head"></td>
				        			<td class="modal-head" style="text-align:left;">[월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계]</td>
				        			<td class="modal-head"></td>
				        			<td class="modal-head"></td>
				        			<td class="modal-head" id="last-debit-month"></td>
				        			<td class="modal-head" id="last-credit-month"></td>
				        			<td class="modal-head"></td>
				        		</tr>
				        		<tr>
				        			<td class="modal-head"></td>
				        			<td class="modal-head"></td>
				        			<td class="modal-head" style="text-align:left;">[누&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계]</td>
				        			<td class="modal-head"></td>
				        			<td class="modal-head"></td>
				        			<td class="modal-head" id="last-debit-acc"></td>
				        			<td class="modal-head" id="last-credit-acc"></td>
				        			<td class="modal-head"></td>
				        		</tr>
			        		</tfoot>
			        	</table>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
				</div>        
	        </div>
		</div>
	</div>
	<!-- Bootstrap 원장조회 모달 끝 -->
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>















