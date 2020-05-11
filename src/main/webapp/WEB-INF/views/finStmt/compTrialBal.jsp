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
	.table-justify1 {
		width: 183px;
		display: flex;
		justify-content: space-between;
	}
	.hidden-right {
		color: #7edfc6;
		margin-bottom: 0px;
	}
	.table-justify2 {
		width: 180px;
		display: flex;
		justify-content: space-between;
	}
	.table-justify3 {
		width: 150px;
		display: flex;
		justify-content: space-between;
	}
	/* table-justify1과 같은 레벨인데 번호가 2자리인 경우 */
	.table-justify4 {
		width: 200px;
		display: flex;
		justify-content: space-between;
	}
	.normal-label {
		margin:0px;
	}
	.num {
		text-align:right;
		padding-right:3px;
	}
	.table-head {
		border:1px solid #a6a6a6;
		background:#e7e6e6;
	}
	.table-title {
		background:#7edfc6;
	}
	.table-subTitle {
		background:#d3ede6;
	}
	.table-content {
		cursor: pointer;
	}
	.journal {
		cursor: pointer;
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
	.green-btn {
		background-color: #24574A;
		border-radius: 5px;
		color: white;
		border-width: 0px;
	}
	#main-table {
		display: none;
		height: 624px;
		width: 1117px;
		overflow: scroll;
		overflow-x: hidden;
	}
	.modal-head {
		border: 1px solid #a6a6a6;
		background: #e7e6e6;
		text-align: center;
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
		<table width="1100px">
			<tr>
				<td><h2 class="mt-4">재무제표</h2></td>
			</tr>
		</table>
		<table style="margin-bottom:15px">
			<tr>
				<td><span class="subtitle" style="border-bottom:1px solid #24574A">합계잔액시산표</span></td>
				<td><span class="subtitle"><a href="stmtOfFinPos.fs">재무상태표</a></span></td>
				<td><span class="subtitle"><a href="incomeStmt.fs">손익계산서</a></span></td>
				<td><span class="subtitle"><a href="mfrgStmt.fs">제조원가명세서</a></span></td>
				<td><span class="subtitle"><a href="stmtOfCashFlow.fs">현금흐름표</a></span></td>
				<td align="right" style="width:180px;"><span id="foldBtn"><img id="foldImg" src="${contextPath}/resources/images/fold.PNG"></span></td>
			</tr>
		</table>
		<!-- <form id="contentForm" action="" method=""> -->
			<ol class="breadcrumb mb-4">
				<table id="searchTable">
					<tr>
						<td style="width:150px;">조회기간 : </td>
						<td>
							<input type="text" id="datepicker">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="green-btn" onclick="return dateSearch();">검색</button></td>
					</tr>
				</table>
			</ol>
			<table style="width:1100px; text-align:center;">
				<tr>
					<td class="table-head" colspan="2">차변</td>
					<td class="table-head" width="28%" rowspan="2" align="center"><div class="table-justify3"><div>계</div><div>정</div><div>과</div><div>목</div></td>
					<td class="table-head" colspan="2">대변</td>
				</tr>
				<tr>
					<td class="table-head" width="18%">잔액</td>
					<td class="table-head" width="18%">합계</td>
					<td class="table-head" width="18%">합계</td>
					<td class="table-head" width="18%">잔액</td>
				</tr>
			</table>
			<div id="main-table">
				<table id="contentTable" style="width:1100px;">
					<tr ondblclick="popSlipModal();">
						<td class="table-title num" width="18%"><span id="bal-debit-sum10"></span></td>
						<td class="table-title num" width="18%"><span id="debit-sum10"></span></td>
						<td class="table-title" align="center" width="28%"><div class="table-justify1"><div>1. 유</div><div>동</div><div>자</div><div>산 <label class="hidden-right">.1</label></div></div></td>
						<td class="table-title num" width="18%"><span id="credit-sum10"></span></td>
						<td class="table-title num" width="18%"><span id="bal-credit-sum10"></span></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subTitle num"><span id="bal-debit-sum11"></span></td>
						<td class="table-subTitle num"><span id="debit-sum11"></span></td>
						<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 당</div><div>좌</div><div>자</div><div>산 ></div></div></td>
						<td class="table-subTitle num"><span id="credit-sum11"></span></td>
						<td class="table-subTitle num"><span id="bal-credit-sum11"></span></td>
					</tr>
					<tr class="table-detail" id="v10100">
						<td class="table-content num"><span id="bal-debit-10100"></span></td>
						<td class="table-content num"><span id="debit-10100"></span></td>
						<td align="center"><div class="table-justify3"><div>현</div><div>금</div><div>및</div><div>현</div><div>금</div><div>성</div><div>자</div><div>산</div></div></td>
						<td class="table-content num"><span id="credit-10100"></span></td>
						<td class="table-content num"><span id="bal-credit-10100"></span></td>
					</tr>
					<!-- <tr>
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>단</div><div>기</div><div>투</div><div>자</div><div>자</div><div>산</div></div></td>
						<td></td>
						<td></td>
					</tr> -->
					<tr class="table-detail" id="v10800">
						<td class="table-content num"><span id="bal-debit-10800"></span></td>
						<td class="table-content num"><span id="debit-10800"></span></td>
						<td align="center"><div class="table-justify3"><div>매</div><div>출</div><div>채</div><div>권</div></div></td>
						<td class="table-content num"><span id="credit-10800"></span></td>
						<td class="table-content num"><span id="bal-credit-10800"></span></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>대</div><div>손</div><div>충</div><div>당</div><div>금</div></div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>미</div><div>수</div><div>금</div></div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>소</div><div>모</div><div>품</div></div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>선</div><div>급</div><div>금</div></div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>선</div><div>급</div><div>비</div><div>용</div></div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>가</div><div>지</div><div>급</div><div>금</div></div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail" id="v13500">
						<td class="table-content num"><span id="bal-debit-13500"></span></td>
						<td class="table-content num"><span id="debit-13500"></span></td>
						<td align="center"><div class="table-justify3"><div>부</div><div>가</div><div>세</div><div>대</div><div>급</div><div>금</div></div></td>
						<td class="table-content num"><span id="credit-13500"></span></td>
						<td class="table-content num"></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>임</div><div>직</div><div>등</div><div>단</div><div>기</div><div>채</div><div>권</div></div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subTitle num"><span id="bal-debit-sum12"></span></td>
						<td class="table-subTitle num"><span id="debit-sum12"></span></td>
						<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 재</div><div>고</div><div>자</div><div>산 ></div></div></td>
						<td class="table-subTitle num"><span id="credit-sum12"></span></td>
						<td class="table-subTitle num"><span id="bal-credit-sum12"></span></td>
					</tr>
					<tr class="table-detail" id="v14600">
						<td class="table-content num"><span id="bal-14600"></span></td>
						<td class="table-content num"><span id="debit-14600"></span></td>
						<td align="center"><div class="table-justify3"><div>상</div><div>품</div></div></td>
						<td class="table-content num"><span id="credit-14600"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail" id="v15000">
						<td class="table-content num"><span id="bal-15000"></span></td>
						<td class="table-content num"><span id="debit-15000"></span></td>
						<td align="center"><div class="table-justify3"><div>제</div><div>품</div></div></td>
						<td class="table-content num"><span id="credit-15000"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail" id="v15300">
						<td class="table-content num"><span id="bal-15300"></span></td>
						<td class="table-content num"><span id="debit-15300"></span></td>
						<td align="center"><div class="table-justify3"><div>원</div><div>재</div><div>료</div></div></td>
						<td class="table-content num"><span id="credit-15300"></span></td>
						<td></td>
					</tr>
					<tr class="table-detail" id="v16900">
						<td class="table-content num"><span id="bal-16900"></span></td>
						<td class="table-content num"><span id="debit-16900"></span></td>
						<td align="center"><div class="table-justify3"><div>재</div><div>공</div><div>품</div></div></td>
						<td class="table-content num"><span id="credit-16900"></span></td>
						<td></td>
					</tr>
					<tr>
						<td class="table-title"></td>
						<td class="table-title"></td>
						<td class="table-title" align="center"><div class="table-justify1"><div>2. 비</div><div>유</div><div>동</div><div>자</div><div>산 <label class="hidden-right">.2</label></div></div></td>
						<td class="table-title"></td>
						<td class="table-title"></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subTitle"></td>
						<td class="table-subTitle"></td>
						<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 투</div><div>자</div><div>자</div><div>산 ></div></div></td>
						<td class="table-subTitle"></td>
						<td class="table-subTitle"></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>장</div><div>기</div><div>투</div><div>자</div><div>증</div><div>권</div></div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>장</div><div>기</div><div>대</div><div>여</div><div>금</div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subTitle"></td>
						<td class="table-subTitle"></td>
						<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 유</div><div>형</div><div>자</div><div>산 ></div></div></td>
						<td class="table-subTitle"></td>
						<td class="table-subTitle"></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>기</div><div>계</div><div>장</div><div>치</div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>감</div><div>가</div><div>상</div><div>각</div><div>누</div><div>계</div><div>액</div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>차</div><div>량</div><div>운</div><div>반</div><div>구</div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>감</div><div>가</div><div>상</div><div>각</div><div>누</div><div>계</div><div>액</div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>비</div><div>품</div></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="table-detail">
						<td></td>
						<td></td>
						<td align="center"><div class="table-justify3"><div>감</div><div>가</div><div>상</div><div>각</div><div>누</div><div>계</div><div>액</div></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="table-title num"><span id="bal-debit-sum30"></span></td>
						<td class="table-title num"><span id="debit-sum30"></span></td>
						<td class="table-title" align="center"><div class="table-justify1"><div>3. 유</div><div>동</div><div>부</div><div>채 <label class="hidden-right">.3</label></div></div></td>
						<td class="table-title num"><span id="credit-sum30"></span></td>
						<td class="table-title num"><span id="bal-credit-sum30"></span></td>
					</tr>
					<tr class="table-detail" id="v25100">
						<td class="table-content num"><span id="bal-debit-25100"></span></td>
						<td class="table-content num"><span id="debit-25100"></span></td>
						<td align="center"><div class="table-justify3"><div>매</div><div>입</div><div>채</div><div>무</div></div></td>
						<td class="table-content num"><span id="credit-25100"></span></td>
						<td class="table-content num"><span id="bal-credit-25100"></span></td>
					</tr>
					<tr class="table-detail" id="v25300">
						<td class="table-content num"><span id="bal-debit-25300"></span></td>
						<td class="table-content num"><span id="debit-25300"></span></td>
						<td align="center"><div class="table-justify3"><div>미</div><div>지</div><div>급</div><div>금</div></div></td>
						<td class="table-content num"><span id="credit-25300"></span></td>
						<td class="table-content num"><span id="bal-credit-25300"></span></td>
					</tr>
					<tr class="table-detail" id="v25400">
						<td class="table-content num"><span id="bal-debit-25400"></span></td>
						<td class="table-content num"><span id="debit-25400"></span></td>
						<td align="center"><div class="table-justify3"><div>예</div><div>수</div><div>금</div></div></td>
						<td class="table-content num"><span id="credit-25400"></span></td>
						<td class="table-content num"><span id="bal-credit-25400"></span></td>
					</tr>
					<tr class="table-detail" id="v25500">
						<td class="table-content num"><span id="bal-debit-25500"></span></td>
						<td class="table-content num"><span id="debit-25500"></span></td>
						<td align="center"><div class="table-justify3"><div>부</div><div>가</div><div>세</div><div>예</div><div>수</div><div>금</div></div></td>
						<td class="table-content num"><span id="credit-25500"></span></td>
						<td class="table-content num"><span id="bal-credit-25500"></span></td>
					</tr>
					<tr>
						<td class="table-title"></td>
						<td class="table-title"></td>
						<td class="table-title" align="center"><div class="table-justify1"><div>4. 비</div><div>유</div><div>동</div><div>부</div><div>채 <label class="hidden-right">.4</label></div></div></td>
						<td class="table-title"></td>
						<td class="table-title"></td>
					</tr>
					<tr>
						<td class="table-title"></td>
						<td class="table-title"></td>
						<td class="table-title" align="center"><div class="table-justify1"><div>5. 자</div><div>본</div><div>금 <label class="hidden-right">.5</label></div></div></td>
						<td class="table-title num"><span id="credit-sum50"></span></td>
						<td class="table-title num"><span id="bal-credit-sum50"></span></td>
					</tr>
					<tr class="table-detail" id="v33100">
						<td class="table-content  num"><span id="bal-debit-33100"></span></td>
						<td class="table-content  num"><span id="debit-33100"></span></td>
						<td align="center"><div class="table-justify3"><div>자</div><div>본</div><div>금</div></div></td>
						<td class="table-content  num"><span id="credit-33100"></span></td>
						<td class="table-content  num"><span id="bal-credit-33100"></span></td>
					</tr>
					<tr>
						<td class="table-title"></td>
						<td class="table-title"></td>
						<td class="table-title" align="center"><div class="table-justify1"><div>6. 자</div><div>본</div><div>잉</div><div>여</div><div>금 <label class="hidden-right">.6</label></div></div></td>
						<td class="table-title"></td>
						<td class="table-title"></td>
					</tr>
					<tr>
						<td class="table-title"></td>
						<td class="table-title"></td>
						<td class="table-title" align="center"><div class="table-justify1"><div>7. 이</div><div>익</div><div>잉</div><div>여</div><div>금 <label class="hidden-right">.6</label></div></div></td>
						<td class="table-title"></td>
						<td class="table-title"></td>
					</tr>
					<tr>
						<td class="table-title"></td>
						<td class="table-title"></td>
						<td class="table-title" align="center"><div class="table-justify1"><div>8. 매</div><div>출 <label class="hidden-right">.7</label></div></div></td>
						<td class="table-title num"><span id="credit-sum70"></span></td>
						<td class="table-title num"><span id="bal-credit-sum70"></span></td>
					</tr>
					<tr class="table-detail" id="v40100">
						<td class="table-content num"><span id="bal-debit-40100"></span></td>
						<td class="table-content num"><span id="debit-40100"></span></td>
						<td align="center"><div class="table-justify3"><div>상</div><div>품</div><div>매</div><div>출</div></div></td>
						<td class="table-content num"><span id="credit-40100"></span></td>
						<td class="table-content num"><span id="bal-credit-40100"></span></td>
					</tr>
					<tr class="table-detail" id="40400">
						<td class="table-content num"><span id="bal-debit-40400"></span></td>
						<td class="table-content num"><span id="debit-40400"></span></td>
						<td align="center"><div class="table-justify3"><div>제</div><div>품</div><div>매</div><div>출</div></div></td>
						<td class="table-content num"><span id="credit-40400"></span></td>
						<td class="table-content num"><span id="bal-credit-40400"></span></td>
					</tr>
					<tr>
						<td class="table-title num"><span id="bal-debit-sum80"></span></td>
						<td class="table-title num"><span id="debit-sum80"></span></td>
						<td class="table-title" align="center"><div class="table-justify1"><div>9. 제</div><div>조</div><div>원</div><div>가 <label class="hidden-right">.3</label></div></div></td>
						<td class="table-title"></td>
						<td class="table-title"></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subTitle num"><span id="debit-sum81"></span></td>
						<td class="table-subTitle num"><span id="bal-debit-sum81"></span></td>
						<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 노</div><div>무</div><div>비 ></div></div></td>
						<td class="table-subTitle"></td>
						<td class="table-subTitle"></td>
					</tr>
					<tr class="table-detail" id="v50400">
						<td class="table-content num"><span id="bal-debit-50400"></span></td>
						<td class="table-content num"><span id="debit-50400"></span></td>
						<td align="center"><div class="table-justify3"><div>임</div><div>금</div></div></td>
						<td class="table-content num"><span id="credit-50400"></span></td>
						<td class="table-content num"><span id="bal-credit-50400"></span></td>
					</tr>
					<tr class="table-detail" id="50500">
						<td class="table-content num"><span id="bal-debit-50500"></span></td>
						<td class="table-content num"><span id="debit-50500"></span></td>
						<td align="center"><div class="table-justify3"><div>상</div><div>여</div><div>금</div></div></td>
						<td class="table-content num"><span id="credit-50500"></span></td>
						<td class="table-content num"><span id="bal-credit-50500"></span></td>
					</tr>
					<tr class="table-detail" id="50800">
						<td class="table-content num"><span id="bal-debit-50800"></span></td>
						<td class="table-content num"><span id="debit-50800"></span></td>
						<td align="center"><div class="table-justify3"><div>퇴</div><div>직</div><div>급</div><div>여</div></div></td>
						<td class="table-content num"><span id="credit-50800"></span></td>
						<td class="table-content num"><span id="bal-credit-50800"></span></td>
					</tr>
					<tr class="table-detail">
						<td class="table-subTitle num"><span id="debit-sum82"></span></td>
						<td class="table-subTitle num"><span id="bal-debit-sum82"></span></td>
						<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 제</div><div>조</div><div>경</div><div>비 ></div></div></td>
						<td class="table-subTitle"></td>
						<td class="table-subTitle"></td>
					</tr>
					<tr class="table-detail" id="51100">
						<td class="table-content num"><span id="bal-debit-51100"></span></td>
						<td class="table-content num"><span id="debit-51100"></span></td>
						<td align="center"><div class="table-justify3"><div>복</div><div>리</div><div>후</div><div>생</div><div>비</div></div></td>
						<td class="table-content num"><span id="credit-51100"></span></td>
						<td class="table-content num"><span id="bal-credit-51100"></span></td>
					</tr>
					<tr class="table-detail" id="v51200">
						<td class="table-content num"><span id="bal-debit-51200"></span></td>
						<td class="table-content num"><span id="debit-51200"></span></td>
						<td align="center"><div class="table-justify3"><div>여</div><div>비</div><div>교</div><div>통</div><div>비</div></div></td>
						<td class="table-content num"><span id="credit-51200"></span></td>
						<td class="table-content num"><span id="bal-credit-51200"></span></td>
					</tr>
					<tr class="table-detail" id="v53000">
						<td class="table-content num"><span id="bal-debit-53000"></span></td>
						<td class="table-content num"><span id="debit-53000"></span></td>
						<td align="center"><div class="table-justify3"><div>소</div><div>모</div><div>품</div><div>비</div></div></td>
						<td class="table-content num"><span id="credit-53000"></span></td>
						<td class="table-content num"><span id="bal-credit-53000"></span></td>
					</tr>
					<tr>
						<td class="table-title num"><span id="bal-debit-sum90"></span></td>
						<td class="table-title num"><span id="debit-sum90"></span></td>
						<td class="table-title" align="center"><div class="table-justify4"><div>10. 판</div><div>매</div><div>비</div><div>및</div><div>일</div><div>반</div><div>관</div><div>리</div><div>비 <label class="hidden-right">.10</label></div></div></td>
						<td class="table-title"></td>
						<td class="table-title"></td>
					</tr>
					<tr class="table-detail" id="v80200">
						<td class="table-content num"><span id="bal-debit-80200"></span></td>
						<td class="table-content num"><span id="debit-80200"></span></td>
						<td align="center"><div class="table-justify3"><div>급</div><div>여</div></div></td>
						<td class="table-content num"><span id="credit-80200"></span></td>
						<td class="table-content num"><span id="bal-credit-80200"></span></td>
					</tr>
					<tr class="table-detail" id="v81100">
						<td class="table-content num"><span id="bal-debit-81100"></span></td>
						<td class="table-content num"><span id="debit-81100"></span></td>
						<td align="center"><div class="table-justify3"><div>복</div><div>리</div><div>후</div><div>생</div><div>비</div></div></td>
						<td class="table-content num"><span id="credit-81100"></span></td>
						<td class="table-content num"><span id="bal-credit-81100"></span></td>
					</tr>
					<tr class="table-detail" id="v81300">
						<td class="table-content num"><span id="bal-debit-81300"></span></td>
						<td class="table-content num"><span id="debit-81300"></span></td>
						<td align="center"><div class="table-justify3"><div>접</div><div>대</div><div>비</div></div></td>
						<td class="table-content num"><span id="credit-81300"></span></td>
						<td class="table-content num"><span id="bal-credit-81300"></span></td>
					</tr>
					<tr class="table-detail" id="v83000">
						<td class="table-content num"><span id="bal-debit-83000"></span></td>
						<td class="table-content num"><span id="debit-83000"></span></td>
						<td align="center"><div class="table-justify3"><div>소</div><div>모</div><div>품</div><div>비</div></div></td>
						<td class="table-content num"><span id="credit-83000"></span></td>
						<td class="table-content num"><span id="bal-credit-83000"></span></td>
					</tr>
					<tr class="table-detail" id="v83100">
						<td class="table-content num"><span id="bal-debit-83100"></span></td>
						<td class="table-content num"><span id="debit-83100"></span></td>
						<td align="center"><div class="table-justify3"><div>지</div><div>급</div><div>수</div><div>수</div><div>료</div></div></td>
						<td class="table-content num"><span id="credit-83100"></span></td>
						<td class="table-content num"><span id="bal-credit-83100"></span></td>
					</tr>
					<tr>
						<td class="table-title"></td>
						<td class="table-title"></td>
						<td class="table-title" align="center"><div class="table-justify4"><div>11. 영</div><div>업</div><div>외</div><div>수</div><div>익 <label class="hidden-right">.11</label></div></div></td>
						<td class="table-title"></td>
						<td class="table-title"></td>
					</tr>
					<tr>
						<td class="table-title"></td>
						<td class="table-title"></td>
						<td class="table-title" align="center"><div class="table-justify4"><div>12. 영</div><div>업</div><div>외</div><div>비</div><div>용 <label class="hidden-right">.12</label></div></div></td>
						<td class="table-title"></td>
						<td class="table-title"></td>
					</tr>
				</table>
			</div>
			<table style="width:1100px;">
				<tr>
					<td class="table-head num" width="18%"><span id="bal-debit-total"></span></td>
					<td class="table-head num" width="18%"><span id="debit-total"></span></td>
					<td class="table-head" width="28%" align="center"><div class="table-justify3"><div>합</div><div>계</div></div></td>
					<td class="table-head num" width="18%"><span id="credit-total"></span></td>
					<td class="table-head num" width="18%"><span id="bal-credit-total"></span></td>
				</tr>
			</table>
		<!-- </form> -->
		<div style="height: 2vh;"></div>
		<div id="card-div">
			<div style="height: 8vh;"></div>
			<div class="card mb-4">
				<div class="card-body">합계잔액시산표란 일정 기간 동안 발생한 모든 계정과목의 합계와 잔액을 나타낸 표 형식의 문서를 말한다.</div>
			</div>
		</div>
	</div>
	
	<!-- Bootstrap 원장조회 모달 -->
	<%-- <script>
		function popSlipModal() {
			$("#slip").modal();
		};
	</script>
	
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
			        		<td>계정과목&nbsp;&nbsp;&nbsp;&nbsp;<input style="width:100px;" type="text">&nbsp;&nbsp;
			        			<img src="${contextPath}/resources/images/bubble.PNG" style="width:30px; height:26px;">
			        		</td>
			        		<td align="right"><span>조회기간&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" id="datepicker3"> ~ <input type="text" id="datepicker4"></td>
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
			        	<table id="List_detail" style=" width:100%; margin-left:auto; margin-right: auto;">
			        		<tr>
			        			<td class="modal-head">일자</td>
			        			<td class="modal-head">번호</td>
			        			<td class="modal-head">적요</td>
			        			<td class="modal-head">코드</td>
			        			<td class="modal-head">거래처</td>
			        			<td class="modal-head">차변</td>
			        			<td class="modal-head">대변</td>
			        			<td class="modal-head">잔액</td>
			        		</tr>
			        		<tr class="modal_detail" style="height: 25px;">
			        			<td style="text-align:center;">03-31</td>
			        			<td style="text-align:center;">00005</td>
			        			<td></td>
			        			<td style="text-align:center;">01003</td>
			        			<td style="text-align:center;">마음전자</td>
			        			<td style="text-align:right;">550,000</td>
			        			<td style="text-align:right;"></td>
			        			<td style="text-align:right;">550,000</td>
			        		</tr>
			        		<tr>
			        			<td class="modal-head"></td>
			        			<td class="modal-head"></td>
			        			<td class="modal-head" style="text-align:left;">[월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계]</td>
			        			<td class="modal-head"></td>
			        			<td class="modal-head"></td>
			        			<td class="modal-head"></td>
			        			<td class="modal-head"></td>
			        			<td class="modal-head"></td>
			        		</tr>
			        		<tr>
			        			<td class="modal-head"></td>
			        			<td class="modal-head"></td>
			        			<td class="modal-head" style="text-align:left;">[누&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계]</td>
			        			<td class="modal-head"></td>
			        			<td class="modal-head"></td>
			        			<td class="modal-head"></td>
			        			<td class="modal-head"></td>
			        			<td class="modal-head"></td>
			        		</tr>
			        	</table>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
		        </div>
			</div>        
		</div>
	</div> --%>
	<!-- Bootstrap 원장조회 모달 끝 -->
	
	</main>
	<script>
		/* 날짜 input jquery ui */
		$.datepicker.setDefaults({
			showOn : "both",
			buttonImageOnly : true,
			buttonImage : "${contextPath}/resources/images/calendar.png",
			dateFormat : 'yy-mm-dd'
	
		});
		
		$(function() {
			$("#datepicker").datepicker({});
			$("#datepicker1").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
			
			//현재 날짜를 기본값 설정
			var curDate = new Date();
			
			var getYear = curDate.getFullYear();
			var doubleMonth = ("0" + (curDate.getMonth() + 1)).slice(-2);
			var doubleDate = ("0" + curDate.getDate()).slice(-2);
			
			var fullDate = getYear + "-" + doubleMonth + "-" + doubleDate;
			$("#datepicker").val(fullDate);
		});
		
		$.modal = function(modalContent, size) {
			$('#modal')
		}
		
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
		
		//접기 버튼 처리
		$(document).on("click", "#foldBtn", function() {
			var clicks = $(this).data('clicks');
			
			if(clicks) {
				$("#foldImg").attr({'src':'${ contextPath }/resources/images/fold.PNG'});
				$(".table-detail").fadeIn(200);
				$("#main-table").css('height', '624px');
			} else {
				$("#foldImg").attr({'src':'${ contextPath }/resources/images/unfold.PNG'});
				$(".table-detail").fadeOut(200);
				$("#main-table").css('height', '280px');
			}
			
			$(this).data('clicks', !clicks);
		})
		
		//검색 버튼 클릭 시
		function dateSearch() {
			$("#loading-div").show();
			
			$("#main-table").fadeIn(200);
			$("#card-div").fadeOut(200);
			$("footer").fadeOut(200);
			
			dateArray = ($("#datepicker").val()).split("-");
	
			$.ajax({
				url : "selectCompTrialBal.fs",
				type : "get",
				data : {
					year : dateArray[0],
					month : dateArray[1],
					date : dateArray[2]
				},
				success : function(data) {
					
					var debit10100 = data["debit10100"];
					var credit10100 = data["credit10100"];
					var balDebit10100 = debit10100 - credit10100
					var debit10800 = data["debit10800"];
					var credit10800 = data["credit10800"];
					var balDebit10800 = debit10800 - credit10800
					var debit13500 = data["debit13500"];
					var credit13500 = data["credit13500"];
					var balDebit13500 = debit13500 - credit13500
					var debit14600 = data["debit14600"];
					var credit14600 = data["credit14600"];
					var balDebit14600 = debit14600 - credit14600
					var debit15000 = data["debit15000"];
					var credit15000 = data["credit15000"];
					var balDebit15000 = debit15000 - credit15000
					var debit15300 = data["debit15300"];
					var credit15300 = data["credit15300"];
					var balDebit15300 = debit15300 - credit15300
					var debit16900 = data["debit16900"];
					var credit16900 = data["credit16900"];
					var balDebit16900 = debit16900 - credit16900;
					//부채
					var debit25100 = data["debit25100"];
					var credit25100 = data["credit25100"];
					var balCredit25100 = credit25100 - debit25100;
					var debit25300 = data["debit25300"];
					var credit25300 = data["credit25300"];
					var balCredit25300 = credit25300 - debit25300;
					var debit25400 = data["debit25400"];
					var credit25400 = data["credit25400"];
					var balCredit25400 = credit25400 - debit25400;
					var debit25500 = data["debit25500"];
					var credit25500 = data["credit25500"];
					var balCredit25500 = credit25500 - debit25500;
					//자본 등
					var credit33100 = data["credit33100"];
					var debit33100 = 0;
					var balCredit33100 = credit33100 - debit33100;
					var credit40100 = data["credit40100"];
					var balCredit40100 = credit40100;
					var credit40400 = data["credit40400"];
					var balCredit40400 = credit40400;
					//제조원가
					var debit50400 = data["debit50400"];
					var balDebit50400 = debit50400;
					var debit50500 = data["debit50500"];
					var balDebit50500 = debit50500;
					var debit50800 = data["debit50800"];
					var balDebit50800 = debit50800;
					var debit51100 = data["debit51100"];
					var balDebit51100 = debit51100;
					var debit51200 = data["debit51200"];
					var balDebit51200 = debit51200;
					var debit53000 = data["debit53000"];
					var balDebit53000 = debit53000;
					//판매비와관리비
					var debit80200 = data["debit80200"];
					var balDebit80200 = debit80200;
					var debit81100 = data["debit81100"];
					var balDebit81100 = debit81100;
					var debit81300 = data["debit81300"];
					var balDebit81300 = debit81300;
					var debit83000 = data["debit83000"];
					var balDebit83000 = debit83000;
					var debit83100 = data["debit83100"];
					var balDebit83100 = debit83100;
					
					$("#debit-10100").text(comma(debit10100));
					$("#credit-10100").text(comma(credit10100));
					$("#bal-debit-10100").text(comma(balDebit10100));
					$("#debit-10800").text(comma(debit10800));
					$("#credit-10800").text(comma(credit10800));
					$("#bal-debit-10800").text(comma(balDebit10800));
					$("#debit-13500").text(comma(debit13500));
					if(credit13500 != 0) { $("#credit-13500").text(comma(credit13500)) };
					$("#bal-13500").text(comma(balDebit13500));
					$("#debit-14600").text(comma(debit14600));
					$("#credit-14600").text(comma(credit14600));
					$("#bal-14600").text(comma(balDebit14600));
					$("#debit-15000").text(comma(debit15000));
					$("#credit-15000").text(comma(credit15000));
					$("#bal-15000").text(comma(balDebit15000));
					$("#debit-15300").text(comma(debit15300));
					$("#credit-15300").text(comma(credit15300));
					$("#bal-15300").text(comma(balDebit15300));
					if(debit16900 != 0) { $("#debit-16900").text(comma(debit16900)); }
					$("#credit-16900").text(comma(credit16900));
					$("#bal-16900").text(comma(balDebit16900));
					//부채
					if(debit25100 != 0) { $("#debit-25100").text(comma(debit25100)); }
					$("#credit-25100").text(comma(credit25100));
					$("#bal-credit-25100").text(comma(balCredit25100));
					if(debit25300 != 0) { $("#debit-25300").text(comma(debit25300)); }
					$("#credit-25300").text(comma(credit25300));
					$("#bal-credit-25300").text(comma(balCredit25300));
					if(debit25400 != 0) { $("#debit-25400").text(comma(debit25400)); }
					$("#credit-25400").text(comma(credit25400));
					$("#bal-credit-25400").text(comma(balCredit25400));
					if(debit25500 != 0) { $("#debit-25500").text(comma(debit25500)); }
					$("#credit-25500").text(comma(credit25500));
					$("#bal-credit-25500").text(comma(balCredit25500));
					//자본 등
					$("#credit-33100").text(comma(credit33100));
					$("#bal-credit-33100").text(comma(balCredit33100));
					$("#credit-40100").text(comma(credit40100));
					$("#bal-credit-40100").text(comma(balCredit40100));
					$("#credit-40400").text(comma(credit40400));
					$("#bal-credit-40400").text(comma(balCredit40400));
					//제조원가
					$("#debit-50400").text(comma(debit50400));
					$("#bal-debit-50400").text(comma(balDebit50400));
					$("#debit-50500").text(comma(debit50500));
					$("#bal-debit-50500").text(comma(balDebit50500));
					$("#debit-50800").text(comma(debit50800));
					$("#bal-debit-50800").text(comma(balDebit50800));
					$("#debit-51100").text(comma(debit51100));
					$("#bal-debit-51100").text(comma(balDebit51100));
					$("#debit-51200").text(comma(debit51200));
					$("#bal-debit-51200").text(comma(balDebit51200));
					$("#debit-53000").text(comma(debit53000));
					$("#bal-debit-53000").text(comma(balDebit53000));
					//판매비와관리비
					$("#debit-80200").text(comma(debit80200));
					$("#bal-debit-80200").text(comma(balDebit80200));
					$("#debit-81100").text(comma(debit81100));
					$("#bal-debit-81100").text(comma(balDebit81100));
					$("#debit-81300").text(comma(debit81300));
					$("#bal-debit-81300").text(comma(balDebit81300));
					$("#debit-83000").text(comma(debit83000));
					$("#bal-debit-83000").text(comma(balDebit83000));
					$("#debit-83100").text(comma(debit83100));
					$("#bal-debit-83100").text(comma(balDebit83100));
					
					//표 합계 계산
					var debitSum11 = debit10100 + debit10800 + debit13500;
					var balDebitSum11 = balDebit10100 + balDebit10800 + balDebit13500;
					var creditSum11 = credit10100 + credit10800 + credit13500;
					var balCreditSum11 = 0;
	
					var debitSum12 = debit14600 + debit15000 + debit15300 + debit16900;
					var balDebitSum12 = balDebit14600 + balDebit15000 + balDebit15300 + balDebit16900;
					var creditSum12 = credit14600 + credit15000 + credit15300 + credit16900;
					var balCreditSum12 = 0;
				
					var debitSum10 = debitSum11 + debitSum12;
					var balDebitSum10 = balDebitSum11 + balDebitSum12;
					var creditSum10 = creditSum11 + creditSum12;
					var balCreditSum10 = balCreditSum11 + balCreditSum12;
					
					var debitSum30 = debit25100 + debit25300 + debit25400 + debit25500;
					var balDebitSum30 = 0;
					var creditSum30 = credit25100 + credit25300 + credit25400 + credit25500;
					var balCreditSum30 = balCredit25100 + balCredit25300 + balCredit25400 + balCredit25500;
					
					var debitSum50 = 0;
					var balDebitSum50 = 0;
					var creditSum50 = credit33100;
					var balCreditSum50 = balCredit33100;
	
					var debitSum70 = 0;
					var balDebitSum70 = 0;
					var creditSum70 = credit40100 + credit40400;
					var balCreditSum70 = balCredit40100 + balCredit40400;
	
					var debitSum81 = debit50400 + debit50500 + debit50800;
					var balDebitSum81 = balDebit50400 + balDebit50500 + balDebit50800;
					var creditSum81 = 0;
					var balCreditSum81 = 0;
	
					var debitSum82 = debit51100 + debit51200 + debit53000;
					var balDebitSum82 = balDebit51100 + balDebit51200 + balDebit53000;
					var creditSum82 = 0;
					var balCreditSum82 = 0;
	
					var debitSum80 = debitSum81 + debitSum82;
					var balDebitSum80 = balDebitSum81 + balDebitSum82;
					var creditSum80 = creditSum81 + creditSum82;
					var balCreditSum80 = balCreditSum81 + balCreditSum82;
	
					var debitSum90 = debit80200 + debit81100 + debit81300 + debit83000 + debit83100;
					var balDebitSum90 = balDebit80200 + balDebit81100 + balDebit81300 + balDebit83000 + balDebit83100;
					var creditSum90 = 0;
					var balCreditSum90 = 0;
					
					var debitTotal = debitSum10 + debitSum30 + debitSum50 + debitSum70 + debitSum80 + debitSum90;
					var creditTotal = creditSum10 + creditSum30 + creditSum50 + creditSum70 + creditSum80 + creditSum90;
					var balDebitTotal = balDebitSum10 + balDebitSum30 + balDebitSum50 + balDebitSum70 + balDebitSum80 + balDebitSum90;
					var balCreditTotal = balCreditSum10 + balCreditSum30 + balCreditSum50 + balCreditSum70 + balDebitSum80 + balDebitSum90;
					
					$("#debit-sum10").text(comma(debitSum10));
					$("#credit-sum10").text(comma(creditSum10));
					$("#bal-debit-sum10").text(comma(balDebitSum10));
					if(balCreditSum10 != 0) { $("#bal-credit-sum10").text(comma(balCreditSum10)); };
	
					$("#debit-sum11").text(comma(debitSum11));
					$("#credit-sum11").text(comma(creditSum11));
					$("#bal-debit-sum11").text(comma(balDebitSum11));
					if(balCreditSum11 != 0) { $("#bal-credit-sum11").text(comma(balCreditSum11)); };
	
					$("#debit-sum12").text(comma(debitSum12));
					$("#credit-sum12").text(comma(creditSum12));
					$("#bal-debit-sum12").text(comma(balDebitSum12));
					if(balCreditSum12 != 0) { $("#bal-credit-sum12").text(comma(balCreditSum12)); };
	
					$("#debit-sum30").text(comma(debitSum30));
					$("#credit-sum30").text(comma(creditSum30));
					if(balDebitSum30 != 0) { $("#bal-debit-sum30").text(comma(balDebitSum30)); };
					$("#bal-credit-sum30").text(comma(balCreditSum30));
	
					$("#credit-sum50").text(comma(creditSum50));
					$("#bal-credit-sum50").text(comma(balCreditSum50));
	
					$("#credit-sum70").text(comma(creditSum70));
					$("#bal-credit-sum70").text(comma(balCreditSum70));
	
					$("#debit-sum80").text(comma(debitSum80));
					$("#bal-debit-sum80").text(comma(balDebitSum80));
	
					$("#debit-sum81").text(comma(debitSum81));
					$("#bal-debit-sum81").text(comma(balDebitSum81));
	
					$("#debit-sum82").text(comma(debitSum82));
					$("#bal-debit-sum82").text(comma(balDebitSum82));
	
					$("#debit-sum90").text(comma(debitSum90));
					$("#bal-debit-sum90").text(comma(balDebitSum90));
					
					$("#debit-total").text(comma(debitTotal));
					$("#credit-total").text(comma(creditTotal));
					$("#bal-debit-total").text(comma(balDebitTotal));
					$("#bal-credit-total").text(comma(balCreditTotal));
					
					//로딩 이미지 숨기기
					$("#loading-div").hide();
				},
				error : function(status) {
					console.log(status);
				}
			})
			
			return false;
			
		}
		
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
				var accountCode = $(this).parent().attr('id').substring(1,6);
				
				
				
				var fromDate = "";
				var toDate = "";
				
				fromDate = year + "-01";
				toDate = year + "-" + month;
				
				$("#datepicker3").val(fromDate);
				$("#datepicker4").val(toDate);
				
				$.ajax({
					url : "selectSlipByDate.fs",
					type : "get",
					data : {
						year : year,
						month : month,
						date : date,
						accountCode : accountCode,
					},
					success : function(data) {
						console.log("data[0] FinPos" + data[0]);
						$("#modal-account-title").val(data[0].accountTitle);
						$("#modal-account-code").val(data[0].accountCode);
						
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
							
							//분개별 값 입력
							var $tr = $("<tr>").attr("class", "journal");
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
							
							if(value.accountCode == '25100' || value.accountCode == '25200' || value.accountCode == 25300 || value.accountCode == 25400
									|| value.accountCode == 25500 || value.accountCode == 29300 || value.accountCode == 29500 || value.accountCode == 29600
									|| value.accountCode == 33100) {
								balance = accCreditBal - accDebitBal;
								console.log("if문 진입");
							}
							
							console.log("value.accountCode : " + value.accountCode);
							console.log("balance : " + balance);
							
							var $balanceTd = $("<td>").text(comma(balance)).css("text-align", "right");			//잔액 출력
							
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
						
					},
					error : function(status) {
						console.log(status);
					}
				})
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
	</script>
	
	<!-- Bootstrap 원장조회 모달 -->
	<div class="modal fade" id="slip" role="dialog">
    	<div class="modal-dialog modal-lg">
	      <div class="modal-content">
		        <div class="modal-header" style="background-color:#1B5748;">
		        	<h4 class="modal-title" style="color:white;">원장조회</h4>
		        	<button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <!-- <div > -->
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
	<!-- </div> -->
	<!-- Bootstrap 원장조회 모달 끝 -->
	
	<footer>
		<jsp:include page="../common/menubar2.jsp" />
	</footer>
</body>
</html>