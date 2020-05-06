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
		display: none;
		border:1px solid red; 
		color:red;
	}
	.normal-label {
		margin:0px;
	}
	/* #contentTable tr:hover {
		color:red;
	} */
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
		/* color:orange;
		border:1px solid red; */
		background: #DDEBF7;
		box-shadow: inset 0 -4px 0 #b4e6f8;
	}
	.modal-head {
		border: 1px solid #a6a6a6;
		background: #e7e6e6;
		text-align: center;
	}
	#pastDate {
		color: white;
		/* background: #ff4400c7; */
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
				<tr class="table-head-tr">
					<td class="table-head" width="28%" rowspan="2">과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
						<input type="hidden" id="login-openDay" value="${ sessionScope.loginCompany.gaeup }">
						<input type="hidden" id="term" name="term">
					</td>
					<td class="table-head" colspan="2">제 <label class="normal-label" id="cur-term"></label>(당)기 2020.<label class="normal-label" id="cur-month"></label>.<label class="normal-label" id="cur-date"></label> 현재</td>
					<td class="table-head" colspan="2">제 <label class="normal-label" id="past-term"></label>(전)기 2019.12.31 현재</td>
				</tr>
				<tr class="table-head-tr">
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
					<td class="table-title-num"><span id="cSumAssests10"></span><input type="hidden" id="sum10" name="sum10"></td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="pSumAssests10"></span></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">① 당좌자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="cSumAssests11"></span><input type="hidden" id="sum11" name="sum11"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="pSumAssests11"></span></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">현금및현금성자산</td>
					<td class="table-content"><span id="cCash"></span><input type="hidden" id="cash" name="cash"></td>
					<td></td>
					<td class="table-content"><span id="pCash"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">단기투자자산</td>
					<td class="table-content"><span id="cShortTermInv"></span><input type="hidden" id="shortTermInv" name="shortTermInv"></td>
					<td></td>
					<td class="table-content"><span id="pShortTermInv"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">매출채권</td>
					<td class="table-content"><span id="cAccountRecievable"></span><input type="hidden" id="accountRecievable" name="accountRecievable"></td>
					<td></td>
					<td class="table-content"><span id="pAccountRecievable"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">미수금</td>
					<td class="table-content"><span id="cNonTradeRecievable"></span><input type="hidden" id="nonTradeRecievable" name="nonTradeRecievable"></td>
					<td></td>
					<td class="table-content"><span id="pNonTradeRecievable"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">부가세대급금</td>
					<td class="table-content"><span id="cVatPayment"></span><input type="hidden" id="vatPayment" name="vatPayment"></td>
					<td></td>
					<td class="table-content"><span id="pVatPayment"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">② 재고자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="cSumAssests12"></span><input type="hidden" id="sum12" name="sum12"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="pSumAssests12"></span></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">상품</td>
					<td class="table-content"><span id="cMerchandises"></span><input type="hidden" id="merchandises" name="merchandises"></td>
					<td></td>
					<td class="table-content"><span id="pMerchandises"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">제품</td>
					<td class="table-content"><span id="cFinishedGoods"></span><input type="hidden" id="finishedGoods" name="finishedGoods"></td>
					<td></td>
					<td class="table-content"><span id="pFinishedGoods"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">원재료</td>
					<td class="table-content"><span id="cRawMaterials"></span><input type="hidden" id="rawMaterials" name="rawMaterials"></td>
					<td></td>
					<td class="table-content"><span id="pRawMaterials"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">재공품</td>
					<td class="table-content"><span id="cWorkInProcess"></span><input type="hidden" id="workInProcess" name="workInProcess"></td>
					<td></td>
					<td class="table-content"><span id="pWorkInProcess"></span></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-title">Ⅱ. 비유동자산</td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="cSumAssests20"></span><input type="hidden" id="sum20" name="sum20"></td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="pSumAssests20"></span></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">① 투자자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="cSumAssests21"></span><input type="hidden" id="sum21" name="sum21"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="pSumAssests21"></span></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">장기투자증권</td>
					<td class="table-content"><span id="cLongInvSecurities"></span><input type="hidden" id="longInvSecurities" name="longInvSecurities"></td>
					<td></td>
					<td class="table-content"><span id="pLongInvSecurities"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">② 유형자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="cSumAssests22"></span><input type="hidden" id="sum22" name="sum22"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="pSumAssests22"></span></td>
				</tr>
				<!-- <tr class="table-detail">
					<td class="table-subSubTitle">기계장치</td>
					<td class="table-content"><span id="cMachinery"></span><input type="hidden" id="machinery" name="machinery"></td>
					<td></td>
					<td class="table-content"><span id="pMachinery"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">감가상각누계액</td>
					<td class="table-content"><span id="cAdOfMachinery"></span><input type="hidden" id="adOfMachinery" name="adOfMachinery"></td>
					<td></td>
					<td class="table-content"><span id="pAdOfMachinery"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">차량운반구</td>
					<td class="table-content"><span id="cVehicles"></span><input type="hidden" id="vehicles" name="vehicles"></td>
					<td></td>
					<td class="table-content"><span id="pVehicles"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">감가상각누계액</td>
					<td class="table-content"><span id="cAdOfVehicles"></span><input type="hidden" id="adOfVehicles" name="adOfVehicles"></td>
					<td></td>
					<td class="table-content"><span id="pAdOfVehicles"></span></td>
					<td></td>
				</tr> -->
				<tr class="table-detail">
					<td class="table-subSubTitle">비품</td>
					<td class="table-content"><span id="cOfficeEquipment"></span><input type="hidden" id="officeEquipment" name="officeEquipment"></td>
					<td></td>
					<td class="table-content"><span id="pOfficeEquipment"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">③ 무형자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="cSumAssests23"></span><input type="hidden" id="sum23" name="sum23"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="pSumAssests23"></span></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">④ 기타비유동자산</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="cSumAssests24"></span><input type="hidden" id="sum24" name="sum24"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle-num"><span id="pSumAssests24"></span></td>
				</tr>
				<tr>
					<td class="table-title" style="padding-left:0px; box-shadow: inset 0 -4px 0 #2abd98;">자산총계</td>
					<td class="table-title" style="box-shadow: inset 0 -4px 0 #2abd98;"></td>
					<td class="table-title-num" style="box-shadow: inset 0 -4px 0 #2abd98;"><span id="cTotalAssests"></span><input type="hidden" id="totalAssests" name="totalAssests"></td>
					<td class="table-title" style="box-shadow: inset 0 -4px 0 #2abd98;"></td>
					<td class="table-title-num" style="box-shadow: inset 0 -4px 0 #2abd98;"><span id="pTotalAssests"></span></td>
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
					<td class="table-title-num"><span id="cSumLiabilities10"></span><input type="hidden" id="sumLiabilities10" name="sumLiabilities10"></td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="pSumLiabilities10"></span></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">매입채무</td>
					<td class="table-content"><span id="cAccountPayables"></span><input type="hidden" id="accountPayables" name="accountPayables"></td>
					<td></td>
					<td class="table-content"><span id="pAccountPayables"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">미지급금</td>
					<td class="table-content"><span id="cNonTradePayables"></span><input type="hidden" id="nonTradePayables" name="nonTradePayables"></td>
					<td></td>
					<td class="table-content"><span id="pNonTradePayables"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">예수금</td>
					<td class="table-content"><span id="cWitholdings"></span><input type="hidden" id="witholdings" name="witholdings"></td>
					<td></td>
					<td class="table-content"><span id="pWitholdings"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">부가세예수금</td>
					<td class="table-content"><span id="cVatDeposit"></span><input type="hidden" id="vatDeposit" name="vatDeposit"></td>
					<td></td>
					<td class="table-content"><span id="pVatDeposit"></span></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-title">Ⅱ. 비유동부채</td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="cSumLiabilities20"></span><input type="hidden" id="sumLiabilities20" name="sumLiabilities20"></td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="pSumLiabilities20"></span></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">장기차입금</td>
					<td class="table-content"><span id="cLongBorrowings"></span><input type="hidden" id="longBorrowings" name="longBorrowings"></td>
					<td></td>
					<td class="table-content"><span id="pLongBorrowings"></span></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">퇴직급여충당부채</td>
					<td class="table-content"><span id="cRetirementLiabilities"></span><input type="hidden" id="retirementLiabilities" name="retirementLiabilities"></td>
					<td></td>
					<td class="table-content"><span id="pRetirementLiabilities"></span></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-title" style="padding-left:0px; box-shadow: inset 0 -4px 0 #2abd98;">부채총계</td>
					<td class="table-title" style="box-shadow: inset 0 -4px 0 #2abd98;"></td>
					<td class="table-title-num" style="box-shadow: inset 0 -4px 0 #2abd98;"><span id="cTotalLiabilities"></span><input type="hidden" id="totalLiabilities" name="totalLiabilities"></td>
					<td class="table-title" style="box-shadow: inset 0 -4px 0 #2abd98;"></td>
					<td class="table-title-num" style="box-shadow: inset 0 -4px 0 #2abd98;"><span id="pTotalLiabilities"></span></td>
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
					<td class="table-title-num"><span id="cSumCapital10"></span><input type="hidden" id="sumCapital10" name="sumCapital10"></td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="pSumCapital10"></span></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">자본금</td>
					<td class="table-content"><span id="cCapitalStock"></span><input type="hidden" id="capitalStock" name="capitalStock"></td>
					<td></td>
					<td class="table-content"><span id="pCapitalStock"></span></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-title">Ⅱ. 자본잉여금</td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="cSumCapital20"></span><input type="hidden" id="sumCapital20" name="sumCapital20"></td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="pSumCapital20"></span></td>
				</tr>
				<tr>
					<td class="table-title">Ⅲ. 자본조정</td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="cSumCapital30"></span><input type="hidden" id="sumCapital30" name="sumCapital30"></td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="pSumCapital30"></span></td>
				</tr>
				<tr>
					<td class="table-title">Ⅳ. 기타포괄손익누계액</td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="cSumCapital40"></span><input type="hidden" id="sumCapital40" name="sumCapital40"></td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="pSumCapital40"></span></td>
				</tr>
				<tr>
					<td class="table-title">Ⅴ. 이익잉여금</td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="cSumCapital50"></span><input type="hidden" id="sumCapital50" name="sumCapital50"></td>
					<td class="table-title"></td>
					<td class="table-title-num"><span id="pSumCapital50"></span></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">미처분이익잉여금</td>
					<td class="retained-earnings" style="text-align: right;"><span id="cRetainedEarnings"></span><input type="hidden" id="retainedEarnings" name="retainedEarnings"></td>
					<td></td>
					<td class="retained-earnings" style="text-align: right;"><span id="pRetainedEarnings"></span></td>
					<td></td>
				</tr>
				<!-- <tr>
					<td class="table-title" style="padding-left:0px;">(당기순이익)</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr> -->
				<tr>
					<td class="table-title" style="padding-left:0px; box-shadow: inset 0 -4px 0 #2abd98;">자본총계</td>
					<td class="table-title" style="box-shadow: inset 0 -4px 0 #2abd98;"></td>
					<td class="table-title-num" style="box-shadow: inset 0 -4px 0 #2abd98;"><span id="cTotalCapital"></span><input type="hidden" id="totalCapital" name="totalCapital"></td>
					<td class="table-title" style="box-shadow: inset 0 -4px 0 #2abd98;"></td>
					<td class="table-title-num" style="box-shadow: inset 0 -4px 0 #2abd98;"><span id="pTotalCapital"></span></td>
				</tr>
				<tr>
					<td class="table-title" style="padding-left:0px; box-shadow: inset 0 -4px 0 #2abd98;">부채와자본총계</td>
					<td class="table-title" style="box-shadow: inset 0 -4px 0 #2abd98;"></td>
					<td class="table-title-num" style="box-shadow: inset 0 -4px 0 #2abd98;"><span id="cTotalLiabCap"></span><input type="hidden" id="totalLiabCap" name="totalLiabCap"></td>
					<td class="table-title" style="box-shadow: inset 0 -4px 0 #2abd98;"></td>
					<td class="table-title-num" style="box-shadow: inset 0 -4px 0 #2abd98;"><span id="pTotalLiabCap"></span></td>
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
			/* $("#contentTable td").mouseover(function() {
				$(this).parent().css("background", "#DDEBF7");
			});
			
			$("#contentTable td").mouseout(function() {
				$(this).parent().css("background", "white");
			});	 */	
			
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
			$("#loading-div").show();
			
			dateArray = ($("#datepicker").val()).split("-");
			
			//당기 이익잉여금 계산
			$.ajax({
				url : "selectIncomeStmt.fs",
				type : "get",
				data : {
					year : dateArray[0],
					month : dateArray[1]
				},
				success : function(data) {
					//---------당기 이익잉여금---------		
					var c14600 = data["c14600"];
					var c40100 = data["c40100"];
					var c40400 = data["c40400"];
					var c81100 = data["c81100"];
					var c81300 = data["c81300"];
					var c83000 = data["c83000"];
					var c83100 = data["c83100"];
					var cVal222 = data["cVal222"];
					
					$("#c14600").text(comma(c14600));
					$("#c40100").text(comma(c40100));
					$("#c40400").text(comma(c40400));
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

					var cSum22 = cVal221 + cVal222 + cVal223;
					$("#cSum22").text(comma(cSum22));
					
					var cSum20 = cSum21 + cSum22;
					$("#cSum20").text(comma(cSum20));
					
					var cSum30 = cSum10 - cSum20;
					$("#cSum30").text(comma(cSum30));
					
					var cSum40 = c81100 + c83000 + c83100 + c81300;
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
					
					var cRetainedEarnings = cSum80 - cSum90;
					$("#cRetainedEarnings").text(comma(cRetainedEarnings));
					//---------전기 이익잉여금---------	
					var p14600 = data["p14600"];
					var p40100 = data["p40100"];
					var p40400 = data["p40400"];
					var p81100 = data["p81100"];
					var p81300 = data["p81300"];
					var p83000 = data["p83000"];
					var p83100 = data["p83100"];
					var pVal222 = data["pVal222"];
					
					$("#p14600").text(comma(p14600));
					$("#p40100").text(comma(p40100));
					$("#p40400").text(comma(p40400));
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

					var pSum22 = pVal221 + pVal222 + pVal223;
					$("#pSum22").text(comma(pSum22));
					
					var pSum20 = pSum21 + pSum22;
					$("#pSum20").text(comma(pSum20));
					
					var pSum30 = pSum10 - pSum20;
					$("#pSum30").text(comma(pSum30));
					
					var pSum40 = p81100 + p83000 + p83100 + p81300;
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
					
					var pRetainedEarnings = pSum80 - pSum90;
					$("#pRetainedEarnings").text(comma(pRetainedEarnings));
					
					//재무상태표 계산을 위한 ajax
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
							var cCash = data["cCash"];
							var cShortTermInv = data["cShortTermInv"];
							var cAccountRecievable = data["cAccountRecievable"];
							var cNonTradeRecievable = data["cNonTradeRecievable"];
							var cVatPayment = data["cVatPayment"];
							var cMerchandises = data["cMerchandises"];
							var cFinishedGoods = data["cFinishedGoods"];
							var cRawMaterials = data["cRawMaterials"];
							var cWorkInProcess = data["cWorkInProcess"];
							var cLongInvSecurities = data["cLongInvSecurities"];
							var cOfficeEquipment = data["cOfficeEquipment"];
							var cAccountPayables = data["cAccountPayables"];
							var cNonTradePayables = data["cNonTradePayables"];
							var cWitholdings = data["cWitholdings"];
							var cVatDeposit = data["cVatDeposit"];
							var cLongBorrowings = data["cLongBorrowings"];
							var cRetirementLiabilities = data["cRetirementLiabilities"];
							var cCapitalStock = data["cCapitalStock"];
							
							$("#cCash").text(comma(cCash));
							$("#cShortTermInv").text(comma(cShortTermInv));
							$("#cAccountRecievable").text(comma(cAccountRecievable));
							$("#cNonTradeRecievable").text(comma(cNonTradeRecievable));
							$("#cVatPayment").text(comma(cVatPayment));
							$("#cMerchandises").text(comma(cMerchandises));
							$("#cFinishedGoods").text(comma(cFinishedGoods));
							$("#cRawMaterials").text(comma(cRawMaterials));
							$("#cWorkInProcess").text(comma(cWorkInProcess));
							$("#cLongInvSecurities").text(comma(cLongInvSecurities));
							$("#cOfficeEquipment").text(comma(cOfficeEquipment));
							$("#cAccountPayables").text(comma(cAccountPayables));
							$("#cNonTradePayables").text(comma(cNonTradePayables));
							$("#cWitholdings").text(comma(cWitholdings));
							$("#cVatDeposit").text(comma(cVatDeposit));
							$("#cLongBorrowings").text(comma(cLongBorrowings));
							$("#cRetirementLiabilities").text(comma(cRetirementLiabilities));
							$("#cCapitalStock").text(comma(cCapitalStock));
							
							//표 각 합계 계산
							var cSumAssests11 = cCash + cShortTermInv + cAccountRecievable + cNonTradeRecievable + cVatPayment;
							$("#cSumAssests11").text(comma(cSumAssests11));
							
							var cSumAssests12 = cMerchandises + cFinishedGoods + cRawMaterials + cWorkInProcess;
							$("#cSumAssests12").text(comma(cSumAssests12));
							
							var cSumAssests10 = cSumAssests11 + cSumAssests12;
							$("#cSumAssests10").text(comma(cSumAssests10));
							
							var cSumAssests21 = cLongInvSecurities;
							$("#cSumAssests21").text(comma(cSumAssests21));
							
							var cSumAssests22 = cOfficeEquipment;
							$("#cSumAssests22").text(comma(cSumAssests22));
							
							var cSumAssests23 = 0;
							$("#cSumAssests23").text(comma(cSumAssests23));
							
							var cSumAssests24 = 0;
							$("#cSumAssests24").text(comma(cSumAssests24));
							
							var cSumAssests20 = cSumAssests21 + cSumAssests22 + cSumAssests23 + cSumAssests24;
							$("#cSumAssests20").text(comma(cSumAssests20));
							
							var cTotalAssests = cSumAssests10 + cSumAssests20;
							$("#cTotalAssests").text(comma(cTotalAssests));
							
							var cSumLiabilities10 = cAccountPayables + cNonTradePayables + cWitholdings + cVatDeposit;
							$("#cSumLiabilities10").text(comma(cSumLiabilities10));
							
							var cSumLiabilities20 = cLongBorrowings + cRetirementLiabilities;
							$("#cSumLiabilities20").text(comma(cSumLiabilities20));
							
							var cTotalLiabilities = cSumLiabilities10 + cSumLiabilities20;
							$("#cTotalLiabilities").text(comma(cTotalLiabilities));
							
							var cSumCapital10 = cCapitalStock;
							$("#cSumCapital10").text(comma(cSumCapital10));
							
							var cSumCapital20 = 0;
							$("#cSumCapital20").text(comma(cSumCapital20));
							
							var cSumCapital30 = 0;
							$("#cSumCapital30").text(comma(cSumCapital30));
							
							var cSumCapital40 = 0;
							$("#cSumCapital40").text(comma(cSumCapital40));
							
							var cSumCapital50 = cRetainedEarnings;
							$("#cSumCapital50").text(comma(cSumCapital50));
							
							var cTotalCapital = cSumCapital10 + cSumCapital20 + cSumCapital30 + cSumCapital40 + cSumCapital50;
							$("#cTotalCapital").text(comma(cTotalCapital));
							
							var cTotalLiabCap = cTotalLiabilities + cTotalCapital;
							$("#cTotalLiabCap").text(comma(cTotalLiabCap));
							//------------당기 끝------------					
							//-------------전기-------------	
							var pCash = data["pCash"];
							var pShortTermInv = data["pShortTermInv"];
							var pAccountRecievable = data["pAccountRecievable"];
							var pNonTradeRecievable = data["pNonTradeRecievable"];
							var pVatPayment = data["pVatPayment"];
							var pMerchandises = data["pMerchandises"];
							var pFinishedGoods = data["pFinishedGoods"];
							var pRawMaterials = data["pRawMaterials"];
							var pWorkInProcess = data["pWorkInProcess"];
							var pLongInvSecurities = data["pLongInvSecurities"];
							var pOfficeEquipment = data["pOfficeEquipment"];
							var pAccountPayables = data["pAccountPayables"];
							var pNonTradePayables = data["pNonTradePayables"];
							var pWitholdings = data["pWitholdings"];
							var pVatDeposit = data["pVatDeposit"];
							var pLongBorrowings = data["pLongBorrowings"];
							var pRetirementLiabilities = data["pRetirementLiabilities"];
							var pCapitalStock = data["pCapitalStock"];
							
							$("#pCash").text(comma(pCash));
							$("#pShortTermInv").text(comma(pShortTermInv));
							$("#pAccountRecievable").text(comma(pAccountRecievable));
							$("#pNonTradeRecievable").text(comma(pNonTradeRecievable));
							$("#pVatPayment").text(comma(pVatPayment));
							$("#pMerchandises").text(comma(pMerchandises));
							$("#pFinishedGoods").text(comma(pFinishedGoods));
							$("#pRawMaterials").text(comma(pRawMaterials));
							$("#pWorkInProcess").text(comma(pWorkInProcess));
							$("#pLongInvSecurities").text(comma(pLongInvSecurities));
							$("#pOfficeEquipment").text(comma(pOfficeEquipment));
							$("#pAccountPayables").text(comma(pAccountPayables));
							$("#pNonTradePayables").text(comma(pNonTradePayables));
							$("#pWitholdings").text(comma(pWitholdings));
							$("#pVatDeposit").text(comma(pVatDeposit));
							$("#pLongBorrowings").text(comma(pLongBorrowings));
							$("#pRetirementLiabilities").text(comma(pRetirementLiabilities));
							$("#pCapitalStock").text(comma(pCapitalStock));
							
							//표 각 합계 계산
							var pSumAssests11 = pCash + pShortTermInv + pAccountRecievable + pNonTradeRecievable + pVatPayment;
							$("#pSumAssests11").text(comma(pSumAssests11));
							
							var pSumAssests12 = pMerchandises + pFinishedGoods + pRawMaterials + pWorkInProcess;
							$("#pSumAssests12").text(comma(pSumAssests12));
							
							var pSumAssests10 = pSumAssests11 + pSumAssests12;
							$("#pSumAssests10").text(comma(pSumAssests10));
							
							var pSumAssests21 = pLongInvSecurities;
							$("#pSumAssests21").text(comma(pSumAssests21));
							
							var pSumAssests22 = pOfficeEquipment;
							$("#pSumAssests22").text(comma(pSumAssests22));
							
							var pSumAssests23 = 0;
							$("#pSumAssests23").text(comma(pSumAssests23));
							
							var pSumAssests24 = 0;
							$("#pSumAssests24").text(comma(pSumAssests24));
							
							var pSumAssests20 = pSumAssests21 + pSumAssests22 + pSumAssests23 + pSumAssests24;
							$("#pSumAssests20").text(comma(pSumAssests20));
							
							var pTotalAssests = pSumAssests10 + pSumAssests20;
							$("#pTotalAssests").text(comma(pTotalAssests));
							
							var pSumLiabilities10 = pAccountPayables + pNonTradePayables + pWitholdings + pVatDeposit;
							$("#pSumLiabilities10").text(comma(pSumLiabilities10));
							
							var pSumLiabilities20 = pLongBorrowings + pRetirementLiabilities;
							$("#pSumLiabilities20").text(comma(pSumLiabilities20));
							
							var pTotalLiabilities = pSumLiabilities10 + pSumLiabilities20;
							$("#pTotalLiabilities").text(comma(pTotalLiabilities));
							
							var pSumCapital10 = pCapitalStock;
							$("#pSumCapital10").text(comma(pSumCapital10));
							
							var pSumCapital20 = 0;
							$("#pSumCapital20").text(comma(pSumCapital20));
							
							var pSumCapital30 = 0;
							$("#pSumCapital30").text(comma(pSumCapital30));
							
							var pSumCapital40 = 0;
							$("#pSumCapital40").text(comma(pSumCapital40));
							
							var pSumCapital50 = pRetainedEarnings;
							$("#pSumCapital50").text(comma(pSumCapital50));
							
							var pTotalCapital = pSumCapital10 + pSumCapital20 + pSumCapital30 + pSumCapital40 + pSumCapital50;
							$("#pTotalCapital").text(comma(pTotalCapital));
							
							var pTotalLiabCap = pTotalLiabilities + pTotalCapital;
							$("#pTotalLiabCap").text(comma(pTotalLiabCap));
							//------------전기 끝------------	
							
							
							
							
							//행 보여주기/숨기기
							
							$("#loading-div").hide();
						}
					})
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
		
		$(document).on("dblclick", '.retained-earnings', function() {
			Swal.fire({
				icon: "warning",
				text: "원장내역 조회사항이 아닙니다"
			})
		});
		
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
				var date = dateArray[2];
				var accountClass = $(this).children('span').attr('id').substring(1);
				var curPast = $(this).children('span').attr('id').substring(0,1);
				
				//$("#modal-account-code").val(accountCode);
				
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
					url : "selectSlipByDate.fs",
					type : "get",
					data : {
						year : year,
						month : month,
						date : date,
						accountClass : accountClass,
						curPast : curPast
					},
					success : function(data) {
						console.log("data[0] FinPos" + data[0]);
						$("#modal-account-title").val(data[0].accountTitle);
						
						$tableBody = $("#list-detail tbody");
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
							
							//전표별 값 입력
							var $tr = $("<tr>");
							var $dateTd = $("<td>").text((("0") + month).slice(-2) + "-" + date).css("text-align", "center");
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
		        <div >
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
			        	<table id="list-detail" style=" width:100%; margin-left:auto; margin-right: auto;">
			        		<!-- <thead>
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
				        	</thead> -->
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
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal" style="font-weight: bold; color: #1B5748;">Close</button>
				        </div>
			        </div>
				</div>        
	        </div>
		</div>
	</div>
	<!-- Bootstrap 원장조회 모달 끝 -->
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>















