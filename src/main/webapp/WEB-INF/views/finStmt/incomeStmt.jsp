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
	.table-subTitle-num {
		background:#d3ede6;
		text-align:right;
		padding-left:40px;
	}
	.table-subSubTitle {
		text-align:left;
		padding-left:61px;
	}
	.table-content {
		text-align:right;
	}
	#contentTable tr:hover:not(.table-head-tr) {
		background: #DDEBF7;
		box-shadow: inset 0 -4px 0 #b4e6f8;
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
    #modal-slip {
    	display: none;
    	height: 202px;	/* 194px */
    }
    #modal-slip > div {
    	width: 1115px;
    	padding-left: 16px;
    	padding-right: 16px;
    }
    #modal-slip table {
    	width: 100%;
    }
    #modal-slip td {
		border: 1px solid #a6a6a6;
	}
    .text-center {
    	text-align: center;
    }
    .text-left {
    	padding-left: 2px;
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
		<table style="width:100%; max-width:1100px;">
			<tr>
				<td><h2 class="mt-4">재무제표</h2></td>
			</tr>
		</table>
		<table style="margin-bottom:15px">
			<tr>
				<td><span class="subtitle"><a href="compTrialBal.fs">합계잔액시산표</a></span></td>
				<td><span class="subtitle"><a href="stmtOfFinPos.fs">재무상태표</a></span></td>
				<td><span class="subtitle" style="border-bottom:1px solid #24574A"><a href="incomeStmt.fs">손익계산서</a></span></td>
				<td><span class="subtitle"><a href="mfrgStmt.fs">제조원가명세서</a></span></td>
				<td><span class="subtitle"><a href="stmtOfCashFlow.fs">현금흐름표</a></span></td>
				<td align="right" style="width:180px;"><span id="foldBtn" data-clicks="false" align="left"><img id="foldImg" src="${ contextPath }/resources/images/fold.PNG"></span></td>
			</tr>
		</table>
		<form id="contentForm" action="insertIncomeStmt.fs" method="post">		
			<ol class="breadcrumb mb-4">
				<table id="searchTable">
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
						<span style="margin-bottom:10px; color:red;"><img src="${ contextPath }/resources/images/pencil.PNG">기말상품재고액을 입력하세요</span>
						&nbsp;&nbsp;&nbsp;&nbsp;		
						<button type="button" id="saveBtn" onclick="saveIncomeStmt();">저장</button>
						&nbsp;&nbsp;
						<button type="button" id="closeBtn" onclick="insertIncomeStmt();">마감</button>
						<input type="hidden" id="closing" name="closing">
						<button type="button" id="cancleBtn" onclick="cancleClosing();">마감 취소</button>
					</td>
					<td align="right">
						<span id="closingMsg">당기 <label class="normal-label" id="closingNum"></label>번째 마감 후 재수정 중</span>
					</td>
				</tr>
			</table>
			<table id="contentTable" width="1100px" style="text-align:center;">
				<thead id="main-thead">
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
						<td class="table-title">Ⅰ. 매출액</td>
						<td class="table-title" width="18%"></td>
						<td class="table-title-num" width="18%"><span id="cSum10"></span><input type="hidden" id="sum10" name="sum10"></td>
						<td class="table-title" width="18%"></td>
						<td class="table-title-num" width="18%"><span id="pSum10"></span><input type="hidden" id="lastSum10" name="lastSum10"></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">상품매출</td>
						<td class="table-content"><span id="c40100"></span><input type="hidden" id="v40100" name="v40100"></td>
						<td></td>
						<td class="table-content"><span id="p40100"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">제품매출</td>
						<td class="table-content"><span id="c40400"></span><input type="hidden" id="v40400" name="v40400"></td>
						<td></td>
						<td class="table-content"><span id="p40400"></span></td>
						<td></td>
					</tr>
					<tr>
						<td class="table-title">Ⅱ. 매출원가</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum20"></span><input type="hidden" id="sum20" name="sum20"></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum20"></span><input type="hidden" id="lastSum20" name="lastSum20"></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subTitle">상품매출원가</td>
						<td class="table-subTitle"></td>
						<td class="table-subTitle-num"><span id="cSum21"></span><input type="hidden" id="sum21" name="sum21"></td>
						<td class="table-subTitle"></td>
						<td class="table-subTitle-num"><span id="pSum21"></span></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">기초상품재고액</td>
						<td class="table-content"><span id="cVal211"></span></td>
						<td></td>
						<td class="table-content"><span id="pVal211"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">당기상품매입액</td>
						<td class="table-content"><span id="c14600"></span><input type="hidden" id="v14600" name="v14600"></td>
						<td></td>
						<td class="table-content"><span id="p14600"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">기말상품재고액</td>
						<td><input type="text" id="inputNum" name="val213" onkeyup="inputNumberFormat(this);" style="width:195px;"></td>
						<td></td>
						<td class="table-content"><span id="pVal213"></span><input type="hidden" id="lastVal213" name="lastVal213"></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subTitle">제품매출원가</td>
						<td class="table-subTitle"></td>
						<td class="table-subTitle-num"><span id="cSum22"></span></td>
						<td class="table-subTitle"></td>
						<td class="table-subTitle-num"><span id="pSum22"></span></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">기초제품재고액</td>
						<td class="table-content"><span id="cVal221"></span></td>
						<td></td>
						<td class="table-content"><span id="pVal221"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">당기제품제조원가</td>
						<td class="mfrg-costs" style="text-align: right;"><span id="cVal222"></span></td>
						<td></td>
						<td class="mfrg-costs" style="text-align: right;"><span id="pVal222"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subSubTitle">기말제품재고액</td>
						<td class="table-content" id="cVal223"><input type="hidden" id="val223" name="val223"></td>
						<td></td>
						<td class="table-content" id="pVal223"><input type="hidden" id="lastVal223" name="lastVal223"></td>
						<td></td>
					</tr>
					<tr>
						<td class="table-title">Ⅲ. 매출총이익</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum30"></span><input type="hidden" id="sum30" name="sum30"></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum30"></span><input type="hidden" id="lastSum30" name="lastSum30"></td>
					</tr>
					<tr>
						<td class="table-title">Ⅳ. 판매비와관리비</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum40"></span><input type="hidden" id="sum40" name="sum40"></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum40"></span><input type="hidden" id="lastSum40" name="lastSum40"></td>
					</tr>
					<tr class="table-detail" id="row80200">
						<td class="table-subSubTitle">급여</td>
						<td class="table-content"><span id="c80200"></span></td>
						<td></td>
						<td class="table-content"><span id="p80200"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail" id="row80300">
						<td class="table-subSubTitle">상여금</td>
						<td class="table-content"><span id="c80300"></span></td>
						<td></td>
						<td class="table-content"><span id="p80300"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail" id="row81100">
						<td class="table-subSubTitle">복리후생비</td>
						<td class="table-content"><span id="c81100"></span></td>
						<td></td>
						<td class="table-content"><span id="p81100"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail" id="row81100">
						<td class="table-subSubTitle">접대비</td>
						<td class="table-content"><span id="c81300"></span></td>
						<td></td>
						<td class="table-content"><span id="p81300"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail" id="row83000">
						<td class="table-subSubTitle">소모품비</td>
						<td class="table-content"><span id="c83000"></span></td>
						<td></td>
						<td class="table-content"><span id="p83000"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail" id="row83100">
						<td class="table-subSubTitle">수수료비용</td>
						<td class="table-content"><span id="c83100"></span></td>
						<td></td>
						<td class="table-content"><span id="p83100"></span></td>
						<td></td>
					</tr>
					<tr>
						<td class="table-title">Ⅴ. 영업이익</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum50"></span><input type="hidden" id="sum50" name="sum50"></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum50"></span><input type="hidden" id="lastSum50" name="lastSum50"></td>
					</tr>
					<tr>
						<td class="table-title">Ⅵ. 영업외수익</td>
						<td class="table-title"></td>
						<td class="table-title-num" id="cSum60"></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum60"></span><input type="hidden" id="lastSum60" name="lastSum60"></td>
					</tr>
					<tr>
						<td class="table-title">Ⅶ. 영업외비용</td>
						<td class="table-title"></td>
						<td class="table-title-num" id="cSum70"></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum70"></span><input type="hidden" id="lastSum70" name="lastSum70"></td>
					</tr>
					<tr>
						<td class="table-title">Ⅷ. 소득세차감전이익</td>
						<td class="table-title"></td>
						<td class="table-title-num" id="cSum80"></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum80"></span><input type="hidden" id="lastSum80" name="lastSum80"></td>
					</tr>
					<tr>
						<td class="table-title">Ⅸ. 소득세등</td>
						<td class="table-title"></td>
						<td class="table-title-num" id="cSum90"></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum90"></span><input type="hidden" id="lastSum90" name="lastSum90"></td>
					</tr>
					<tr>
						<td class="table-title">Ⅹ. 당기순이익</td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="cSum100"></span><input type="hidden" id="sum100" name="sum100"></td>
						<td class="table-title"></td>
						<td class="table-title-num"><span id="pSum100"></span><input type="hidden" id="lastSum100" name="lastSum100"></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div style="height: 10vh;"></div>
		<div class="card mb-4" style="max-width:1100px">
			<div class="card-body">손익계산서란 일정기간 동안 발생한 수익과 비용을 기록하여 
			해당 기간 동안 얼마만큼의 이익 또는 손실을 보았는지 경영성과를 보여주는 보고서이다. 
			기업의 미래현금흐름과 수익창출 능력 등의 예측에 유용한 정보를 제공한다.</div>
		</div>
	</div>
	</main>
	<script>
		$(function() {
			/* 표에서 하늘색 hover 주기 */
			/* $("#contentTable td").mouseover(function() {
				$(this).parent().css("background", "#DDEBF7");
			});
			
			$("#contentTable td").mouseout(function() {
				$(this).parent().css("background", "white");
			}); */
			
			// 현재 날짜로 기본값 설정 : 조회기간 영역
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
			
			// 현재 날짜로 기본값 설정 : 테이블의 당기 기간 영역
			var curMonth = "";
						
			if((curDate.getMonth() + 1) < 10) {
				curMonth = "0" + (curDate.getMonth() + 1);
			}
			
			$("#cur-month").text(curMonth);
			
			// 로그인 회사로 기수 설정
			var openDay = $("#login-openDay").val();
			var openYear = String(openDay).substring(0,4);
			
			var curTerm = Number(curDate.getFullYear()) - Number(openYear) + 1;
			var pastTerm = curTerm - 1;
			
			$("#cur-term").text(curTerm);
			$("#term").val(curTerm);
			$("#past-term").text(pastTerm);
			
			/* 키 입력창에 값을 입력시 발생하는 이벤트 */
			$("#inputNum").keyup(function() {
				console.log("keyup 위한 테스트 uncomma : " + uncomma($("#cSum21").text()));
				
				
				var cSum21 = uncomma($("#cVal211").text()) + uncomma($("#c14600").text()) - uncomma($("#inputNum").val());
				$("#cSum21").text(comma(cSum21));
				
				var cSum20 = cSum21 + uncomma($("#cSum22").text());
				$("#cSum20").text(comma(cSum20));
				
				var cSum30 = uncomma($("#cSum10").text()) - cSum20;
				$("#cSum30").text(comma(cSum30));
				
				var cSum50 = cSum30 - uncomma($("#cSum40").text())
				$("#cSum50").text(comma(cSum50));
				
				var cSum80 = cSum50 + uncomma($("#cSum60").text()) - uncomma($("#cSum70").text());
				$("#cSum80").text(comma(cSum80));
				
				var cSum100 = cSum80 - uncomma($("#cSum90").text());
				$("#cSum100").text(comma(cSum100));
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
			return Number(str.replace(/[^\d]+/g, ""));
		}
		
		/* 값 입력시 콤마 찍기 */
		function inputNumberFormat(str) {
			str.value = comma(uncomma(str.value));
		}
		
		//(날짜를 통한) 검색 버튼 클릭시
		function dateSearch() {
			$("#loading-div").show();
		    
			$("#main-tbody").css("display", "table-row-group");
			
			var year = $("#year").val();
			var month = $("#month").val();
			
			$.ajax({
				url : "searchIncomeStmt.fs",
				type : "get",
				data : {
					year : year
				},
				success : function(data) {
					
					if(data == "") {
						console.log("data is empty");
						
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
					
						var val213 = data.val213;
						
						$("#inputNum").val(comma(val213));
					}
					
					
				},
				error : function(status) {
					console.log(status);
				}
			})
			
			$.ajax({
				url : "selectIncomeStmt.fs",
				type : "get",
				data : {
					year : year,
					month : month
				},
				success : function(data) {
					$("#cur-month").text(month);
					
					//-------------당기-------------					
					var c14600 = data["c14600"];
					var c40100 = data["c40100"];
					var c40400 = data["c40400"];
					var c80200 = data["c80200"];
					var c80300 = data["c80300"];
					var c81100 = data["c81100"];
					var c81300 = data["c81300"];
					var c83000 = data["c83000"];
					var c83100 = data["c83100"];
					var cVal222 = data["cVal222"];
					
					$("#c14600").text(comma(c14600));
					$("#c40100").text(comma(c40100));
					$("#c40400").text(comma(c40400));
					$("#c80200").text(comma(c80200));
					$("#c80300").text(comma(c80300));
					$("#c81100").text(comma(c81100));
					$("#c81300").text(comma(c81300));
					$("#c83000").text(comma(c83000));
					$("#c83100").text(comma(c83100));
					$("#cVal222").text(comma(cVal222));
					
					//표 각 합계 계산
					var cSum10 = c40100 + c40400;
					$("#cSum10").text(comma(cSum10));
					
					var cVal211 = 0;
					
					var cSum21 = cVal211 + c14600;
					$("#cSum21").text(comma(cSum21));
					
					var cVal221 = 0;
					var cVal223 = 0;

					var cSum22 = cVal221 + cVal222 - cVal223;
					$("#cSum22").text(comma(cSum22));
					
					var cSum20 = cSum21 + cSum22;
					$("#cSum20").text(comma(cSum20));
					
					var cSum30 = cSum10 - cSum20;
					$("#cSum30").text(comma(cSum30));
					
					var cSum40 = c80200 + c80300 + c81100 + c83000 + c83100 + c81300;
					$("#cSum40").text(comma(cSum40));
					
					var cSum50 = cSum30 - cSum40;
					$("#cSum50").text(comma(cSum50));
					
					var cSum60 = 0;
					$("#cSum60").text(comma(cSum60));
					
					var cSum70 = 0;
					$("#cSum70").text(comma(cSum70));
					
					var cSum80 = cSum50 + cSum60 - cSum70;
					$("#cSum80").text(comma(cSum80));
					
					var cSum90 = 0;
					$("#cSum90").text(comma(cSum90));
					
					var cSum100 = cSum80 - cSum90;
					$("#cSum100").text(comma(cSum100));
					//------------당기 끝------------					
					//-------------전기-------------					
					var p14600 = data["p14600"];
					var p40100 = data["p40100"];
					var p40400 = data["p40400"];
					var p80200 = data["p80200"];
					var p80300 = data["p80300"];
					var p81100 = data["p81100"];
					var p81300 = data["p81300"];
					var p83000 = data["p83000"];
					var p83100 = data["p83100"];
					var pVal222 = data["pVal222"];
					
					$("#p14600").text(comma(p14600));
					$("#p40100").text(comma(p40100));
					$("#p40400").text(comma(p40400));
					$("#p80200").text(comma(p80200));
					$("#p80300").text(comma(p80300));
					$("#p81100").text(comma(p81100));
					$("#p81300").text(comma(p81300));
					$("#p83000").text(comma(p83000));
					$("#p83100").text(comma(p83100));
					$("#pVal222").text(comma(pVal222));
					
					//표 각 합계 계산
					var pSum10 = p40100 + p40400;
					$("#pSum10").text(comma(pSum10));
					
					var pVal211 = 0;
					var pVal213 = 0;
					
					var pSum21 = pVal211 + p14600 + pVal213;
					$("#pSum21").text(comma(pSum21));
					
					var pVal221 = 0;
					var pVal223 = 0;

					var pSum22 = pVal221 + pVal222 - pVal223;
					$("#pSum22").text(comma(pSum22));
					
					var pSum20 = pSum21 + pSum22;
					$("#pSum20").text(comma(pSum20));
					
					var pSum30 = pSum10 - pSum20;
					$("#pSum30").text(comma(pSum30));
					
					var pSum40 = p80200 + p80300 + p81100 + p83000 + p83100 + p81300;
					$("#pSum40").text(comma(pSum40));
					
					var pSum50 = pSum30 - pSum40;
					$("#pSum50").text(comma(pSum50));
					
					var pSum60 = 0;
					$("#pSum60").text(comma(pSum60));
					
					var pSum70 = 0;
					$("#pSum70").text(comma(pSum70));
					
					var pSum80 = pSum50 + pSum60 - pSum70;
					$("#pSum80").text(comma(pSum80));
					
					var pSum90 = 0;
					$("#pSum90").text(comma(pSum90));
					
					var pSum100 = pSum80 - pSum90;
					$("#pSum100").text(comma(pSum100));
					//------------전기 끝------------	
					
					//행 보여주기/숨기기
					if(c81100 == 0 && p81100 == 0) {
						$("#row81100").fadeOut(200);
					} else {
						$("#row81100").fadeIn(200);
					}
					
					if(c83000 == 0 && p83000 == 0) {
						$("#row83000").fadeOut(200);
					} else {
						$("#row83000").fadeIn(200);
					}
					
					if(c83100 == 0 && p83100 == 0) {
						$("#row83100").fadeOut(200);
					} else {
						$("#row83100").fadeIn(200);
					}
					
					$("#loading-div").hide();
				},
				error : function(status) {
					console.log(status);
				}
			});
			
			
			//form 전송이 되지 않도록 처리
			return false;
		}
		
		//접기 버튼 클릭 시
		$(document).on("click", '#foldBtn', function() {
			var clicks = $(this).data('clicks');
			
			if(clicks) {
				$("#foldImg").attr({'src':'${ contextPath }/resources/images/fold.PNG'});
				$(".table-detail").fadeIn(200);
			} else {
				$("#foldImg").attr({'src':'${ contextPath }/resources/images/unfold.PNG'});
				$(".table-detail").fadeOut(200);
			}
			
			$(this).data('clicks', !clicks);
		});
		
		
		$(document).on("dblclick", '.mfrg-costs', function() {
			Swal.fire({
				icon: "warning",
				text: "원장내역 조회사항이 아닙니다"
			})
		})
		
		//원장조회 모달 띄우기
		$(document).on("dblclick", '.table-content', function() {
			
			/* if($(this).text() == "") {

				Swal.fire({
					icon: "warning",
					text: "먼저 조회기간 검색을 해주세요!"
				})
				
			} else  */
			
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

					console.log("year type : " + typeof(year));
				}

				$("#datepicker3").val(fromDate);
				$("#datepicker4").val(toDate);
				
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
						console.log(data);
						console.log("data.lenght : " + data.length);
						
						$("#modal-account-title").val(data[0].accountTitle);
						console.log("data[0].accountTitle : " + data[0].accountTitle);
						
						$tableBody = $("#list_detail tbody");
						//테이블을 갱신하기 위해 비워줌
						$tableBody.html('');
						
						//잔액과 누계 계산을 위한 변수
						var balance = 0;
						//월계 게산을 위한 변수
						var monthBalance = 0;
						
						//월별로 월계, 누계 계산을 위한 변수
						var monthCheck = 0;
						
						$.each(data, function(index, value) {
							
							console.log("index : " + index);
		
							console.log("slipDate : " + value.slipDate);
							
							//"00월 00일, 0000년" 형식의 반환 String에서 일자 뽑기
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
								
								if(value.debitCredit == '차변') {
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
							
							//분개별 값 입력
							var $tr = $("<tr>").attr('class', 'journal');
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
						
						//마지막행 월계, 누계에 값 입력
						if(data[0].debitCredit == '차변') {
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
				});
			}
			
		});
		
		//원장 모델에서 특정 분개 더블 클릭 시 처리
		$(document).on("dblclick", '.journal', function() {
			
			var $tableBody = $("#modal-slip-table tbody");
			$tableBody.html('');
			
		
			
			var datepicker3 = $("#datepicker3").val();
			var journalYear = datepicker3.substring(0, 4);

			var journalDate = $(this).children('td:first-child').text().split("-");
			var dateSlipCode = $(this).children('td:nth-child(2)').text();
			
			var clicks = $(this).data('clicks');
			
			if(clicks) {
				$(".modal-body").css("height", "578px");
				$("#modal-slip").hide();
			} else {
				$(".modal-body").css("height", "376px");	/* 384px */
				$("#modal-slip").show();
			}
			
			$(this).data('clicks', !clicks);
			
			var rowNum = 1;
			
			$.ajax({
				url : "selectSlipByJournal.fs",
				type : "get",
				data : {
					year : journalYear,
					month : journalDate[0],
					date : journalDate[1],
					dateSlipCode : dateSlipCode
				},
				success : function(data) {
					
					if(data[0].dateSlipCode.substring(0,1) == 5) {
						$("#slip-category").text("매입매출");
					} else {
						$("#slip-category").text("일반");
					}
					
					$.each(data, function(index, value) {
						console.log("계정과목" + value.accountTitle);
						
						var $tr = $("<tr>");
						var $rowNumTd = $("<td>").text(rowNum).attr("class", "text-center");
						var $monthTd = $("<td>").text(journalDate[0]).attr("class", "text-center");
						var $dateTd = $("<td>").text(journalDate[1]).attr("class", "text-center");
						var $dateSlipCodeTd = $("<td>").text(value.dateSlipCode).attr("class", "text-center");
						var $debitCreditTd = $("<td>").text(value.debitCredit).attr("class", "text-center");
						var $accountCodeTd = $("<td>").text(value.accountCode).attr("class", "text-center").css("width", "5%");
						var $accountTitleTd = $("<td>").text(value.accountTitle);
						var $venderCodeTd = $("<td>").text(value.venderCode).attr("class", "text-center").css("width", "5%");
						var $venderNameTd = $("<td>").text(value.venderName);
						
						if(value.debitCredit == '차변') {
							var $debitTd = $("<td>").text(comma(value.price)).css("text-align", "right");
							var $creditTd = $("<td>");
						} else {
							var $debitTd = $("<td>");
							var $creditTd = $("<td>").text(comma(value.price)).css("text-align", "right");
						}
						
						var $briefTd = $("<td>").text(value.brief).css("padding-left", "2px");
						
						$tr.append($rowNumTd);
						$tr.append($monthTd);
						$tr.append($dateTd);
						$tr.append($dateSlipCodeTd);
						$tr.append($debitCreditTd);
						$tr.append($accountCodeTd);
						$tr.append($accountTitleTd);
						$tr.append($venderCodeTd);
						$tr.append($venderNameTd);
						$tr.append($debitTd);
						$tr.append($creditTd);
						$tr.append($briefTd);
						$tableBody.append($tr);
						
					});
				},
				error : function(status) {
					console.log(status);
				}
			})
		});
		
		//저장버튼 클릭시 
		function saveIncomeStmt() {
			console.log("마감 버튼 입력 : " + $("#cSum10").text());
			
			if($("#cSum10").text() == "") {
				
				Swal.fire({
					icon: "warning",
					text: "먼저 조회기간 검색을 해주세요!"
				})
				
			} else if($("#inputNum").val() == "") {
				
				Swal.fire({
					icon: "warning",
					text: "기말상품재고액을 입력해주세요!"
				})
				
			} else {
				$("#sum10").val(Number(uncomma($("#cSum10").text())));
				$("#v40100").val(Number(uncomma($("#c40100").text())));
				$("#sum20").val(Number(uncomma($("#cSum20").text())));
				$("#inputNum").val(Number(uncomma($("#inputNum").val())));
				$("#val223").val(Number(uncomma($("#cVal223").text())));
				$("#sum30").val(Number(uncomma($("#cSum30").text())));
				$("#sum40").val(Number(uncomma($("#cSum40").text())));
				$("#sum50").val(Number(uncomma($("#cSum50").text())));
				$("#sum100").val(Number(uncomma($("#cSum100").text())));
				
				$("#lastSum10").val(Number(uncomma($("#pSum10").text())))
				$("#lastSum20").val(Number(uncomma($("#pSum20").text())))
				$("#lastVal213").val(Number(uncomma($("#pVal213").text())))
				$("#lastVal223").val(Number(uncomma($("#pVal223").text())))
				$("#lastSum30").val(Number(uncomma($("#pSum30").text())))
				$("#lastSum40").val(Number(uncomma($("#pSum40").text())))
				$("#lastSum50").val(Number(uncomma($("#pSum50").text())))
				$("#lastSum60").val(Number(uncomma($("#pSum60").text())))
				$("#lastSum70").val(Number(uncomma($("#pSum70").text())))
				$("#lastSum80").val(Number(uncomma($("#pSum80").text())))
				$("#lastSum90").val(Number(uncomma($("#pSum90").text())))
				$("#lastSum100").val(Number(uncomma($("#pSum100").text())))
				
				$("#closing").val('N');
				
				$("#contentForm").submit();
				
			}			
		}
		
		//마감버튼 클릭시 
		function insertIncomeStmt() {
			console.log("마감 버튼 입력 : " + $("#cSum10").text());
			
			if($("#cSum10").text() == "") {
				
				Swal.fire({
					icon: "warning",
					text: "먼저 조회기간 검색을 해주세요!"
				})
				
			} else if($("#inputNum").val() == "") {
				
				Swal.fire({
					icon: "warning",
					text: "기말상품재고액을 입력해주세요!"
				})
				
			} else {
				$("#sum10").val(Number(uncomma($("#cSum10").text())));
				$("#v40100").val(Number(uncomma($("#c40100").text())));
				$("#sum20").val(Number(uncomma($("#cSum20").text())));
				$("#inputNum").val(Number(uncomma($("#inputNum").val())));
				$("#val223").val(Number(uncomma($("#cVal223").text())));
				$("#sum30").val(Number(uncomma($("#cSum30").text())));
				$("#sum40").val(Number(uncomma($("#cSum40").text())));
				$("#sum50").val(Number(uncomma($("#cSum50").text())));
				$("#sum100").val(Number(uncomma($("#cSum100").text())));
				
				$("#lastSum10").val(Number(uncomma($("#pSum10").text())))
				$("#lastSum20").val(Number(uncomma($("#pSum20").text())))
				$("#lastVal213").val(Number(uncomma($("#pVal213").text())))
				$("#lastVal223").val(Number(uncomma($("#pVal223").text())))
				$("#lastSum30").val(Number(uncomma($("#pSum30").text())))
				$("#lastSum40").val(Number(uncomma($("#pSum40").text())))
				$("#lastSum50").val(Number(uncomma($("#pSum50").text())))
				$("#lastSum60").val(Number(uncomma($("#pSum60").text())))
				$("#lastSum70").val(Number(uncomma($("#pSum70").text())))
				$("#lastSum80").val(Number(uncomma($("#pSum80").text())))
				$("#lastSum90").val(Number(uncomma($("#pSum90").text())))
				$("#lastSum100").val(Number(uncomma($("#pSum100").text())))
				
				$("#closing").val('Y');
				
				$("#contentForm").submit();
				
			}			
		}
		
		//마감 취소 클릭 시
		function cancleClosing() {
			$("#saveBtn").show();
			$("#closeBtn").show();
			$("#cancleBtn").hide();
			$("#requestMsg").text("기말상품재고액을 입력하세요");
			$("#inputNum").removeAttr("readonly");
			
			var year = $("#year").val();
			
			$.ajax({
				url : "countClosedIncomeStmt.fs",
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
	<div class="modal fade" id="slip" role="dialog">
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
				<div id="modal-slip">
		        	<div>
		        		<hr style="border:solid 2px #1B5748; margin-top:14px; margin-bottom:10px;">
			        	<div style="padding-bottom:2px;"><label class="normal-label" id="slip-category"></label>전표</div>
			        	<table id="modal-slip-table">
			        		<thead>
		        				<tr>
		        					<td class="modal-head" style="width:2%;"></td>
				        			<td class="modal-head" style="width:3%;">월</td>
				        			<td class="modal-head" style="width:3%;">일</td>
				        			<td class="modal-head" style="width:5%;">번호</td>
				        			<td class="modal-head" style="width:4%;">구분</td>
				        			<td class="modal-head" colspan="2" style="width:15%;">계정과목</td>
				        			<td class="modal-head" colspan="2" style="width:18%;">거래처</td>
				        			<td class="modal-head" style="width:15%;">차변</td>
				        			<td class="modal-head" style="width:15%;">대변</td>
				        			<td class="modal-head" style="widht:20%;">적요</td>
				        		</tr>
			        		</thead>
			        		<tbody>
			        		</tbody>
			        	</table>
		        	</div>
		        </div>     
	        </div>
		</div>
	</div>
	<!-- Bootstrap 원장조회 모달 끝 -->
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>















