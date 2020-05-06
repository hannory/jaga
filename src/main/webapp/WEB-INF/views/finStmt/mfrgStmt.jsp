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
		display: none;
	}
	#cancleBtn {
		display: none;
		border:1px solid red; 
		color:red;
	}
	#closingMsg{
		display: none;
		color: #296355;
	}
	#closingNum{
		font-weight: bold;
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
	.table-title-num {
		background:#7edfc6;
		text-align:right;
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
	#inputNum {
		text-align:right;
	}
	#inputNum:focus {
		background:#b3cfe4;
	}
	#inputNum::-webkit-inner-spin-button,
	#inputNum::-webkit-outer-spin-button {
		-webkit-appearance:none;
	}
	.modal-head {
		border: 1px solid #a6a6a6;
		background: #e7e6e6;
		text-align: center;
	}
	#pastDate {
		color: white;
		/* background: #cf1d7f */;
		background: #e73d1fc5;
		padding: 2px 4px;
	}
	#modal-inner-head {
    	padding-top: 16px;
    	padding-right: 33px;
    	padding-left: 16px;
    }
    .modal-body {
    	overflow: scroll;
    	overflow-x: hidden;
    	height: 578px;
    	padding-top: 0px !important;
    }
	#loading-div {
	    width: 100%;  
	    height: 100%;  
	    top: 0px;
	    left: 0px;
	    position: fixed;  
	    display: none;  
	    opacity: 0.7;  
	    background-color: #fff;  
	    z-index: 99;  
	    text-align: center; 
    } 
</style>
<title>자가 경리</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<%-- <c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" /> --%>
	<div id="loading-div">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
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
				<td><span class="subtitle"><a href="stmtOfFinPos.fs">재무상태표</a></span></td>
				<td><span class="subtitle"><a href="incomeStmt.fs">손익계산서</a></span></td>
				<td><span class="subtitle" style="border-bottom:1px solid #24574A"><a href="mfrgStmt.fs">제조원가명세서</a></span></td>
				<td><span class="subtitle"><a href="stmtOfCashFlow.fs">현금흐름표</a></span></td>
				<td align="right" style="width:180px;"><span id="foldBtn"><img id="foldImg" src="${ contextPath }/resources/images/fold.PNG"></span></td>
			</tr>
		</table>
		<form id="contentForm" action="insertMfrgStmt.fs" method="post">
			<ol class="breadcrumb mb-4">
				<table id="searchReTable">
					<tr>
						<td style="width:150px;">조회기간 : </td>
						<td>
							<input type="number" id="year" name="year" style="width:70px"> 년&nbsp;&nbsp;&nbsp;&nbsp;
							<select id="month" name="month">
								<option id="jan" value="01">1</option>
								<option id="feb" value="02">2</option>
								<option id="mar" value="03">3</option>
								<option id="apr" value="04">4</option>
								<option id="may" value="05">5</option>
								<option id="jun" value="06">6</option>
								<option id="jul" value="07">7</option>
								<option id="aug" value="08">8</option>
								<option id="sep" value="09">9</option>
								<option id="oct">10</option>
								<option id="nov">11</option>
								<option id="dec">12</option>
							</select> 월&nbsp;&nbsp;&nbsp;&nbsp;
							<button onclick="return dateSearch();">검색</button></td>
					</tr>
				</table>
			</ol>
			<table style="width:100%; max-width:1100px;">
				<tr>
					<td>
						<span style="margin-bottom:10px; color:red;"><img src="${ contextPath }/resources/images/pencil.PNG"><label class="normal-lable" id="requestMsg">기말원재료재고액을 입력하세요</label></span>
						&nbsp;&nbsp;&nbsp;&nbsp;		
						<button type="button" id="saveBtn" onclick="saveMfrgStmt();">저장</button>
						&nbsp;&nbsp;
						<button type="button" id="closeBtn" onclick="closeMfrgStmt();">마감</button>
						<input type="hidden" id="closing" name="closing">
						<button type="button" id="cancleBtn" onclick="cancleClosing();">마감 취소</button>
					</td>
					<td align="right">
						<span id="closingMsg">당기 <label class="normal-label" id="closingNum"></label>번째 마감 후 재수정 중</span>
					</td>
				</tr>
			</table>
			<table id="contentTable" width="1100px" style="text-align:center;">
				<thead>
					<tr>
						<td class="table-head" width="28%" rowspan="2">과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
						<td class="table-head" colspan="2">
							제 <label class="normal-label" id="cur-term"></label>(당)기 2020.01 ~ 2020.<label class="normal-label" id="cur-month"></label>
							<input type="hidden" id="login-openDay" value="${ sessionScope.loginCompany.gaeup }">
							<input type="hidden" id="term" name="term">
						</td>
						<td class="table-head" colspan="2">제 <label class="normal-label" id="past-term"></label>(전)기 2019.01 ~ 2019.12</td>
					</tr>
					<tr>
						<td class="table-head" colspan="2">금액</td>
						<td class="table-head" colspan="2">금액</td>
					</tr>
				</thead>
				<tbody id="main-tbody" style="display:none;">
					<tr>
						<td class="table-title">1. 원재료비</td>
						<td class="table-title" width="18%"></td>
						<td class="table-title-num" width="18%"><span id="cSum10"></span></td>
						<td class="table-title" width="18%"></td>
						<td class="table-title-num" width="18%"><span id="pSum10"></span></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">기초원재료재고액</td>
						<td id="cVal11"></td>
						<td></td>
						<td id="pVal11"></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">당기원재료매입액</td>
						<td class="table-content"><span id="c15300"></span><input type="hidden" id="v15300" name="v15300"></td>
						<td></td>
						<td class="table-content"><span id="p15300"></span></td>
						<td></td>
					</tr>
					<!-- <tr>
						<td class="table-subSubTitle">타계정으로대체액</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr> -->
					<tr class="table-detail">
						<td class="table-subSubTitle">기말원재료재고액</td>
						<td><input type="text" id="inputNum" name="val13" onkeyup="inputNumberFormat(this)" style="width:195px;"></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="table-title">2. 노무비</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum20"></span></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum20"></span></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">임금</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">상여금</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="table-title">3. 경비</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum30"></span></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum30"></span></td>
					</tr>
					<tr class="table-detail" id="row51100">
						<td class="table-subSubTitle">복리후생비</td>
						<td class="table-content"><span id="c51100"></span><input type="hidden" id="v51100" name="v51100"></td>
						<td></td>
						<td class="table-content"><span id="p51100"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail" id="row51200">
						<td class="table-subSubTitle">여비교통비</td>
						<td class="table-content"><span id="c51200"></span><input type="hidden" id="v51200" name="v51200"></td>
						<td></td>
						<td class="table-content"><span id="p51200"></span></td>
						<td></td>
					</tr>
					<!-- <tr class="table-detail">
						<td class="table-subSubTitle">접대비</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">가스수도료</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">전력비</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr> -->
					<tr class="table-detail" id="row53000">
						<td class="table-subSubTitle">소모품비</td>
						<td class="table-content"><span id="c53000"></span><input type="hidden" id="v53000" name="v53000"></td>
						<td></td>
						<td class="table-content"><span id="p53000"></span></td>
						<td></td>
					</tr>
					<tr>
						<td class="table-title">4. 당기 총 제조비용</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum40"></span></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum40"></span></td>
					</tr>
					<tr>
						<td class="table-title">5. 기초재공품 재고액</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum50"></span></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum50"></span></td>
					</tr>
					<tr>
						<td class="table-title">6. 합계</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum60"></span></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum60"></span></td>
					</tr>
					<tr>
						<td class="table-title">7. 기말재공품 재고액</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum70"></span></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum70"></span></td>
					</tr>
					<tr>
						<td class="table-title">8. 타계정으로 대체액</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum80"></span></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum80"></span></td>
					</tr>
					<tr>
						<td class="table-title">9. 당기제품 제조원가</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum90"></span><input type="hidden" id="sum90" name="sum90"></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum90"></span><input type="hidden" id="pValSum90" name="pValSum90"></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div style="height: 10vh;"></div>
		<div class="card mb-4">
			<div class="card-body">제조원가명세서는 각 원가 요소별로 그 발생액을 표시하고 당기의 총 제조비용에 기초하여 재공품 재고액을 공제, 당기 완성품의 제조원가를 계산한다.</div>
		</div>
	</div>
	</main>
	<script>
		$(function() {
			//$("#main-tbody").hide();
			
			/* 표에서 하늘색 hover 주기 */
			$("#contentTable td").mouseover(function() {
				$(this).parent().css("background", "#DDEBF7");
			});
			
			$("#contentTable td").mouseout(function() {
				$(this).parent().css("background", "white");
			});			
		
			/* 현재 날짜로 기본값 설정 */
			var curDate = new Date();
			console.log("curDate : " + curDate);
			console.log("curYear : " + curDate.getFullYear());
			
			$("#year").val(curDate.getFullYear());
			
			switch (curDate.getMonth()) {
			case 0 : $("#jan").prop("selected", true); break;
			case 1 : $("#feb").prop("selected", true); break;
			case 2 : $("#mar").prop("selected", true); break;
			case 3 : $("#apr").prop("selected", true); break;
			case 4 : $("#may").prop("selected", true); break;
			case 5 : $("#jun").prop("selected", true); break;
			case 6 : $("#jul").prop("selected", true); break;
			case 7 : $("#aug").prop("selected", true); break;
			case 8 : $("#sep").prop("selected", true); break;
			case 9 : $("#oct").prop("selected", true); break;
			case 10 : $("#nov").prop("selected", true); break;
			case 11 : $("#dec").prop("selected", true); break;
			}
			
			//로그인 회사로 기수 및 날짜 설정
			var openDay = $("#login-openDay").val();
			var openYear = String(openDay).substring(0,4);
			
			var curTerm = Number(curDate.getFullYear()) - Number(openYear) + 1;
			var pastTerm = curTerm - 1;
			
			$("#cur-term").text(curTerm);
			$("#term").val(curTerm);
			$("#past-term").text(pastTerm);
			$("#cur-month").text(("0" + (curDate.getMonth() + 1)).slice(-2));
			
			//키 입력창에 값을 입력시 발생하는 이벤트
			$("#inputNum").keyup(function() {
				var cSum10 = Number(uncomma($("#c15300").text())) - Number(uncomma($("#inputNum").val()));
				$("#cSum10").text(comma(cSum10));
				
				var cSum20 = 0;
				$("#cSum20").text(cSum20);
				
				var cSum30 = Number(uncomma($("#c51100").text()));
				$("#cSum30").text(comma(cSum30));
				
				var cSum40 = cSum10 + cSum20 + cSum30;
				$("#cSum40").text(comma(cSum40));
				
				var cSum50 = 0;
				$("#cSum50").text(comma(cSum50));
				
				var cSum60 = cSum40 + cSum50;
				$("#cSum60").text(comma(cSum60));
				
				var cSum70 = 0;
				$("#cSum70").text(comma(cSum70));
				
				var cSum80 = 0;
				$("#cSum80").text(comma(cSum80));
				
				var cSum90 = cSum60 - (cSum70 + cSum80);
				$("#cSum90").text(comma(cSum90));
			})
		});
		
		/* 콤마 찍기 */
		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
		}
		
		/* 콤마 등 숫자 이외의 입력값 제거 */
		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, "");
		}
		
		//값 입력시 콤마 찍기
		function inputNumberFormat(str) {
			str.value = comma(uncomma(str.value));
		}
		
		//(날짜를 통한) 검색 버튼 클릭 시
		function dateSearch() {
			$("#loading-div").show();
			
			$("#main-tbody").css("display", "");
			
			var year = $("#year").val();
			var month = $("#month").val();
			
			$.ajax({
				url : "searchMfrg.fs",
				type : "get",
				data : {
					year : year
				},
				success: function(data) {
					
					if(data == "") {
						$("#saveBtn").show();
						$("#closeBtn").show();
					} else {
						if(data.closing == "Y") {
							$("#cancleBtn").show();
							$("#requestMsg").text("마감이 완료되었습니다");
							$("#inputNum").attr("readonly", "readonly");
						} else {
							$("#saveBtn").show();
							$("#closeBtn").show();
							
							if(data.countClosed != 0) {
								$("#closingNum").text(data.countClosed);
								$("#closingMsg").show();
							}
						}
						
						var val13 = data.val13;
						
						$("#inputNum").val(comma(val13));						
					}
				},
				error : function(status) {
					console.log(status);
				}
			});
			
			$.ajax({
				url : "selectMfrgStmt.fs",
				type : "get",
				data : {
					year : year,
					month : month
				},
				success : function(data) {
					$("#cur-month").text(month);
					
					//-------------당기-------------	
					var c15300 = data["c15300"];
					var c51100 = data["c51100"];
					var c51200 = data["c51200"];
					var c53000 = data["c53000"];
					
					$("#c15300").text(comma(c15300));
					$("#c51100").text(comma(c51100));
					$("#c51200").text(comma(c51200));
					$("#c53000").text(comma(c53000));
					
					//표 각 합계 계산
					var cSum10 = c15300 - Number(uncomma($("#inputNum").val()));
					$("#cSum10").text(comma(cSum10));
					
					var cSum20 = 0;
					$("#cSum20").text(cSum20);
					
					var cSum30 = c51100 + c51200 + c53000;
					$("#cSum30").text(comma(cSum30));
					
					var cSum40 = cSum10 + cSum20 + cSum30;
					$("#cSum40").text(comma(cSum40));
					
					var cSum50 = 0;
					$("#cSum50").text(comma(cSum50));
					
					var cSum60 = cSum40 + cSum50;
					$("#cSum60").text(comma(cSum60));
					
					var cSum70 = 0;
					$("#cSum70").text(comma(cSum70));
					
					var cSum80 = 0;
					$("#cSum80").text(comma(cSum80));
					
					var cSum90 = cSum60 - (cSum70 + cSum80);
					$("#cSum90").text(comma(cSum90));
					
					//------------당기 끝------------					
					//-------------전기-------------	
					var p15300 = data["p15300"];
					var p51100 = data["p51100"];
					var p51200 = data["p51200"];
					var p53000 = data["p53000"];
					
					$("#p15300").text(comma(p15300));
					$("#p51100").text(comma(p51100));
					$("#p51200").text(comma(p51200));
					$("#p53000").text(comma(p53000));
					
					//표 각 합계 계산
					var pSum10 = p15300;
					$("#pSum10").text(comma(pSum10));
					
					var pSum20 = 0;
					$("#pSum20").text(pSum20);
					
					var pSum30 = p51100 + p51200 + p53000;
					$("#pSum30").text(comma(pSum30));
					
					var pSum40 = pSum10 + pSum20 + pSum30;
					$("#pSum40").text(comma(pSum40));
					
					var pSum50 = 0;
					$("#pSum50").text(comma(pSum50));
					
					var pSum60 = pSum40 + pSum50;
					$("#pSum60").text(comma(pSum60));
					
					var pSum70 = 0;
					$("#pSum70").text(comma(pSum70));
					
					var pSum80 = 0;
					$("#pSum80").text(comma(pSum80));
					
					var pSum90 = pSum60 - (pSum70 + pSum80);
					$("#pSum90").text(comma(pSum90));
					//------------전기 끝------------
					
					//행 보여주기/숨기기
					if(c51100 == 0 && p51100 == 0) {
						$("#row51100").fadeOut(200);
					} else {
						$("#row51100").fadeIn(200);
					}
					
					if(c51200 == 0 && p51200 == 0) {
						$("#row51200").fadeOut(200);
					} else {
						$("#row51200").fadeIn(200);
					}
					
					if(c53000 == 0 && p53000 == 0) {
						$("#row53000").fadeOut(200);
					} else {
						$("#row53000").fadeIn(200);
					}
					
					$("#loading-div").hide();
				},
				error : function(status) {
					console.log(status);
				}
			});
			
			//sumbit 차단 위하여 false 처리
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
				
				var year = $("#year").val();
				var month = $("#month").val();
				var accountCode = $(this).children('span').attr('id').substring(1,6);
				var curPast = $(this).children('span').attr('id').substring(0,1);
				
				$("#modal-account-code").val(accountCode);
				
				var fromDate = "";
				var toDate = "";
				
				if(curPast == "p") {
					$("#pastDate").text("전기 데이터 조회중").show();
					
					fromDate = (Number(year) - 1) + "-01";
					toDate = (Number(year) - 1) + "-" + month;
				} else {
					$("#pastDate").hide();
					
					fromDate = year + "-01";
					toDate = year + "-" + month;
				}
				
				$("#datepicker3").val(fromDate);
				$("#datepicker4").val(toDate);
				
				$.ajax({
					url : "selectSlip.fs",
					type : "get",
					data : {
						year : year,
						curPast : curPast,
						month : month,
						accountCode : accountCode
					},
					success : function(data) {
						$("#modal-account-title").val(data[0].accountTitle);
						
						$tableBody = $("#list_detail tbody");
						//테이블을 갱신하기 위해 비워줌
						$tableBody.html('');
						
						//잔액과 누계
						var balance = 0;
						//월계
						var monthBalance = 0;
						
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
							
							//월계, 누계 계산
							if(month != monthCheck) {
								
								var $mtr = $("<tr>").attr("class", "modal-head");
								var $mtd1 = $("<td>").attr("class", "modal-head");
								var $mtd2 = $("<td>").attr("class", "modal-head");
								var $mtd3 = $("<td>").attr("class", "modal-head").text("[월\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0계]").css("text-align", "left");
								var $mtd4 = $("<td>").attr("class", "modal-head");
								var $mtd5 = $("<td>").attr("class", "modal-head");
								
								if(value.debitCredit == "차변") {
									var $mtd6 = $("<td>").attr("class", "modal-head").text(comma(monthBalance)).css("text-align", "right");
									var $mtd7 = $("<td>").attr("class", "modal-head");
								} else {
									var $mtd6 = $("<td>").attr("class", "modal-head");
									var $mtd7 = $("<td>").attr("class", "modal-head").text(comma(monthBalance)).css("text-align", "right");
								}
								
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
								
								var $atr = $("<tr>").attr("class", "modal-head");
								var $atd1 = $("<td>").attr("class", "modal-head");
								var $atd2 = $("<td>").attr("class", "modal-head");
								var $atd3 = $("<td>").attr("class", "modal-head").text("[누\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0계]").css("text-align", "left");
								var $atd4 = $("<td>").attr("class", "modal-head");
								var $atd5 = $("<td>").attr("class", "modal-head");
								
								if(value.debitCredit == '차변') {
									var $atd6 = $("<td>").attr("class", "modal-head").text(comma(balance)).css("text-align", "right");
									var $atd7 = $("<td>").attr("class", "modal-head");
								} else {
									var $atd6 = $("<td>").attr("class", "modal-head");
									var $atd7 = $("<td>").attr("class", "modal-head").text(comma(balance)).css("text-align", "right");
								}
								
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
								monthBalance = 0;
							}
							
							if(month != monthCheck) {
								var gap = month - monthCheck;
								monthCheck += gap;
							}
							
							//전표별 값 입력
							var $tr = $("<tr>");
							var $dateTd = $("<td>").text((("0") + month).slice(-2) + "-" + date).css("text-align", "center");
							var $dateSlipCodeTd = $("<td>").text(value.dateSlipCode).css("text-align", "center");
							var $briefTd = $("<td>").text(value.brief);
							var $venderCodeTd = $("<td>").text(value.venderCode).css("text-align", "center");
							var $venderNameTd = $("<td>").text(value.venderName);
							
							//차변 대변 구분
							if(value.debitCredit == '차변') {
								var $debitTd = $("<td>").text(comma(value.price)).css("text-align", "right");
								var $creditTd = $("<td>");
							} else {
								var $debitTd = $("<td>");
								var $creditTd = $("<td>").text(comma(value.price)).css("text-align", "right");
							}
							
							//잔액, 누계 계산
							balance += value.price;
							var $balanceTd = $("<td>").text(comma(balance)).css("text-align", "right");
							
							//월계 계산
							monthBalance += value.price;
							
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
						if(data[0].debitCredit == "차변") {
							$("#last-debit-month").text(comma(monthBalance)).css("text-align", "right");
							$("#last-debit-acc").text(comma(balance)).css("text-align", "right");
							$("#last-credit-month").text("");
							$("#last-credit-acc").text("");
						} else {							
							$("#last-debit-month").text("");
							$("#last-debit-acc").text("");
							$("#last-credit-month").text(comma(monthBalance)).css("text-align", "right");
							$("#last-credit-acc").text(comma(balance)).css("text-align", "right");
						}
						
					},
					error : function(status) {
						console.log(status);
					}
				})
			}
		})
		
		//저장버튼 클릭시
		function saveMfrgStmt() {
			
			if($("#cSum10").text() == "") {
				
				Swal.fire({
					icon: "warning",
					text: "먼저 조회기간 검색을 해주세요!"
				})
			} else if($("#inputNum").val() == "") {
				
				Swal.fire({
					icon: "warning",
					text: "기말원재료재고액을 입력해주세요!"
				})
			} else {
				//천단위 콤마를 붙인 값을 다시 숫자 타입으로 변경
				$("#inputNum").val(Number(uncomma($("#inputNum").val())));
				//저장의 경우 마감여부는 'N'으로 설정
				$("#closing").val('N');
				
				$("#sum90").val(Number(uncomma($("#cSum90").text()))); 
				$("#pValSum90").val(Number(uncomma($("#pSum90").text()))); 
				
				$("#contentForm").submit();
				
			}
			
		}
		
		//마감 버튼 클릭시
		function closeMfrgStmt() {
			
			if($("#cSum10").text() == "") {
				
				Swal.fire({
					icon: "warning",
					text: "먼저 조회기간 검색을 해주세요!"
				})
			} else if($("#inputNum").val() == "") {
				
				Swal.fire({
					icon: "warning",
					text: "기말원재료재고액을 입력해주세요!"
				})
			} else {
				//천단위 콤마를 붙인 값을 다시 숫자 타입으로 변경
				$("#inputNum").val(Number(uncomma($("#inputNum").val())));
				//저장의 경우 마감여부는 'N'으로 설정
				$("#closing").val('Y');
				
				$("#sum90").val(Number(uncomma($("#cSum90").text()))); 
				$("#pValSum90").val(Number(uncomma($("#pSum90").text()))); 
				
				$("#contentForm").submit();
				
			}
			
		}
		
		//마감 취소 클릭 시
		function cancleClosing() {
			$("#saveBtn").show();
			$("#closeBtn").show();
			$("#cancleBtn").hide();
			$("#requestMsg").text("기말원재료재고액을 입력하세요");
			$("#inputNum").removeAttr("readonly");
			
			var year = $("#year").val();
			
			$.ajax({
				url : "countClosedMfrg.fs",
				type : "get",
				data : {
					year : year
				},
				success : function(data) {
					console.log("마감횟수 : " + data);
					
					$("#closingNum").text(data);
				},
				error : function(status) {
					console.log(status);
				}
			})
			
			$("#closingMsg").show();
		}
	</script>
	
	<!-- Bootstrap 원장조회 모달 -->
	<div class="modal fade" id="slip" role="dailog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header" style="background-color:#1B5748;">
					<h4 class="modal-title" style="color:white;">원장조회</h4>
		        	<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div id="modal-inner-head">
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
					<table style=" width:100%; margin-left:auto; margin-right: auto;">
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
					</table>
				</div>
				<div class="modal-body">
					<div>
			        	<table id="list_detail" style=" width:100%; margin-left:auto; margin-right: auto;">
				        	<tbody>
				        	</tbody>
				        	<tfoot>
				        		<tr>
				        			<td class="modal-head" style="width:5%;"></td>
				        			<td class="modal-head" style="width:6%;"></td>
				        			<td class="modal-head" style="width:20%; text-align:left;">[월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계]</td>
				        			<td class="modal-head" style="width:6%;"></td>
				        			<td class="modal-head" style="width:18%;"></td>
				        			<td class="modal-head" id="last-debit-month" style="width:15%;"></td>
				        			<td class="modal-head" id="last-credit-month" style="width:15%;"></td>
				        			<td class="modal-head" style="width:15%;"></td>
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
			        	<button type="button" class="btn btn-default" data-dismiss="modal" style="font-weight: bold; color: #1B5748;">Close</button>
			        </div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap 원장조회 모달 끝 -->
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>



















