<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jquery UI calendar-->
<script
   src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
   integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
   crossorigin="anonymous"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
  
</head>

<style>
/* Group 14 */
/* 

position: absolute;
width: 69px;
height: 22.33px;
left: 446px;
top: 547px;

 */
 
/* 거래처 등록정보 vender-info*/

#vender-info{
position: absolute;
width: 173px;
height: 30px;
left: 305px;
top: 81px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 18px;
line-height: 21px;

color: #000000;

}

/* 1. 사업자등록번호 biz-Num*/

#biz-num{
position: absolute;
width: 400px;
height: 24px;
left: 320px;
top: 124px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;

color: #4C4C4C;

}

/*사업자등록번호 네모칸 biz-reg-num-surr*/

#biz-reg-num-surr{
position: absolute;
width: 360px;
height: 27px;
left: 731px;
top: 124px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 거래처주소 2번째칸 vender-address2-surr */

#vender-address2-surr{
position: absolute;
width: 392px;
height: 27px;
left: 594px;
top: 235px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 담당부서사원네모칸 department-incharge2-surr  */

#department-incharge2-surr{
position: absolute;
width: 191px;
height: 27px;
left: 594px;
top: 385px;

background: #D9E3E3;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}


/* 비고란 remarks-surr  */

#remarks-surr{
position: absolute;
width: 555px;
height: 27px;
left: 454px;
top: 625px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 은행이름칸 bank-code-name-surr */

#bank-code-name-surr{
position: absolute;
width: 228px;
height: 27px;
left: 644px;
top: 465px;

background: #D9E3E3;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 상세입력안함칸 null-okay-surr*/

#null-okay{
position: absolute;
width: 649px;
height: 27px;
left: 337px;
top: 298px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}
/* #### 상세 입력 안함 #### null-okay */

#null-okay{
position: absolute;
width: 668px;
height: 24px;
left: 320px;
top: 300px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;

color: #4C4C4C;
}


/* 2. 대 표 자 성 명 boss-name */

#boss-name{
position: absolute;
width: 104px;
height: 24px;
left: 319px;
top: 160px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}


/* 3. 업 종 sell */

#sell{
position: absolute;
width: 104px;
height: 24px;
left: 321px;
top: 197px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}


/* 4. 주 소  address*/

#address{
position: absolute;
width: 104px;
height: 24px;
left: 321px;
top: 237px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}



/* 5. 연 락 처  phone*/

#phone{
position: absolute;
width: 104px;
height: 24px;
left: 321px;
top: 347px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}


/* 6. 담당(부서)사원  department-incharge*/

#department-incharge{
position: absolute;
width: 130px;
height: 24px;
left: 321px;
top: 387px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}


/* 8. 입금 계좌 번호  account-num*/

#account-num{
position: absolute;
width: 104px;
height: 24px;
left: 321px;
top: 467px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;
font-size: 16px;

color: #4C4C4C;
}


/* 9. 업체담당자연락처 com-manage-tel */

#com-manage-tel{
position: absolute;
width: 160px;
height: 24px;
left: 320px;
top: 555px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}


/* 11. 비 고 remarks*/

#remarks{
position: absolute;
width: 104px;
height: 24px;
left: 320px;
top: 627px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}


/* 12. 사 용 여 부  status*/

#status{
position: absolute;
width: 104px;
height: 24px;
left: 320px;
top: 667px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;

}

/* 업태 sell-way */

#sell-way{
position: absolute;
width: 104px;
height: 24px;
left: 455px;
top: 197px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #4C4C4C;
}


/* 전화번호 vender-tel */

#vender-tel{
position: absolute;
width: 104px;
height: 24px;
left: 455px;
top: 347px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #4C4C4C;

}

/* 은 행 bank */

#bank{
position: absolute;
width: 104px;
height: 24px;
left: 455px;
top: 467px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #4C4C4C;
}


/* 예 금 주  account-holder*/

#account-holder{
position: absolute;
width: 104px;
height: 24px;
left: 455px;
top: 507px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #4C4C4C;
}


/* 계좌번호 account-num*/

#account-num{
position: absolute;
width: 104px;
height: 24px;
left:  720px;
top: 507px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #4C4C4C;
}


/* 팩스번호 vender-fax */

#vender-fax{
position: absolute;
width: 104px;
height: 24px;
left: 720px;
top: 347px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #4C4C4C;
}


/* 종목 sell-target*/

#sell-target{
position: absolute;
width: 104px;
height: 24px;
left: 720px;
top: 197px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #4C4C4C;
}


/* 대표자성명칸 boss-name-surr */

#boss-name-surr{
position: absolute;
width: 222px;
height: 27px;
left: 452px;
top: 160px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*업태란 sell-way-surr */

#sell-way-surr{
position: absolute;
width: 180px;
height: 27px;
left: 495px;
top: 194px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}
/*전화번호 란  vender-tell-surr*/

#vender-tell-surr{
position: absolute;
width: 180px;
height: 27px;
left: 525px;
top: 344px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*팩스번호란 vender-fax-surr */

#vender-fax-surr{
position: absolute;
width: 201px;
height: 27px;
left: 805px;
top: 344px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 주소상세란 vender-address3-surr*/

#vender-address3-surr{
position: absolute;
width: 531px;
height: 27px;
left: 455px;
top: 264px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*주소첫번째란 vender-address1-surr */

#vender-address1-surr{
position: absolute;
width: 82px;
height: 27px;
left: 455px;
top: 234px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}
 

/* 담당부서사원코드란 department-incharge1-surr */

#department-incharge1-surr{
position: absolute;
width: 160px;
height: 27px;
left: 455px;
top: 384px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}


/* 은행코드란 bank-code-surr */

#bank-code-surr{
position: absolute;
width: 82px;
height: 27px;
left: 505px;
top: 464px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*  업체담당자연락처 코드란 com-manager1-tel-surr*/

/* #com-manager1-tel-surr{
position: absolute;
width: 82px;
height: 27px;
left: 600px;
top: 544px;

background: #D9E3E3;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
} */

/* 예금주란 account-holder-surr */

#account-holder-surr{
position: absolute;
width: 180px;
height: 27px;
left: 505px;
top: 504px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}


/*계좌번호란 account-num-surr */

#account-num-surr{
position: absolute;
width: 201px;
height: 27px;
left: 785px;
top: 504px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*업체담당자연락처 상세란 com-manager-tel-surr */

#com-manager2-tel-surr{
position: absolute;
width: 201px;
height: 27px;
left: 750px;
top: 544px;

background: #D9E3E3;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*  종목란 sell-target-surr  */

#sell-target-surr{
position: absolute;
width: 221px;
height: 27px;
left: 765px;
top: 194px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}



/* + 키 입력 시 신규 등록 가능 key-okay*/

#key-okay{
position: absolute;
width: 208px;
height: 24px;
left: 801px;
top: 387px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;

color: #4C4C4C;
}



/* 0:부 1:여  zero-one*/

#zero-one{
position: absolute;
width: 53px;
height: 24px;
left: 491px;
top: 667px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;

color: #4C4C4C;
}

/*확인란 okay */

#okay1{
position: absolute;
width: 82px;
height: 27px;
left: 590px;
top: 755px;

background: #296355;
border-radius: 5px;
}


#okay2{
position: absolute;
width: 82px;
height: 27px;
left: 670px;
top: 755px;

background: #296355;
border-radius: 5px;
}

/*조회 등록 btn-okay*/
#btn-okay{
position: absolute;
width: 75px;
height: 22.33px;
left: 455px;
top: 547px;

background: #D9E3E3;
}

/* /*조회등록 글씨 select*/
#select{
position: absolute;
width: 69px;
height: 15.69px;
left: 446px;
top: 550.62px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 13px;
line-height: 15px;
}


/*입금계좌번호  account-income-num*/

#account-income-num{
position: absolute;
width: 130px;
height: 24px;
left: 321px;
top: 467px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;

}

/*사용여부 칸 zero-one-surr*/
#zero-one-surr{
position: absolute;
width: 27px;
height: 27px;
left: 455px;
top: 664px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*거래처 명 : vender-name*/
#vender-name{
position: absolute;
width: 70px;
height: 24px;
left: 321px;
top: 90px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}

/*거래처 명 칸: vender-name-surr*/

#vender-name-surr{

position: absolute;
width: 254px;
height: 27px;
left: 453px;
top: 90px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*농어민 여부 farmers-status*/
#farmers-status{
position: absolute;
width: 95px;
height: 24px;
left: 1025px;
top: 197px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #4C4C4C;
}
/*농어민란 farmers-status-surr*/
#farmers-status-surr{

position: absolute;
width: 20px;
height: 20px;
left: 1082px;
top: 200px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}
/*업체담당자연락처 코드란 com-manager1-tel-surr*/

#com-manager1-tel-surr{
position: absolute;
width: 190px;
height: 27px;
left: 500px;
top: 555px;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 구분 vendertype */

#vendertype{
position: absolute;
width: 40px;
height: 24px;
left: 733px;
top: 90px;


font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;


}

/* 구분 셀렉트박스란 vendertype-surr*/

#vendertype-surr{
position: absolute;
width: 170px;
height: 27px;
left: 810px;
top: 90px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}


 #addressbtn{
position: absolute;
width: 50px;
height: 28px;
left: 540px;
top: 235px;
background:#24574A;
color:white;
border-radius:5px;
font-size:6px;

 }
</style>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="main">
	<div class="container-fluid">
		<h2 class="mt-4">거래처 정보수정</h2>
		<ol class="breadcrumb mb-4">
		</ol>
  		<div class="card mb-4">
			<div class="card-body">
			<div id="main">
		<div id="table-total"> 
		 
		 <form action="modifyVender.vi" method="post">
<!-- <table> -->				
	<c:if test="${!empty sessionScope.loginCompany}">
 		<c:forEach var="v" items="${list}">
		<tr>
<!-- 			<td><b id="vender-info">거래처 등록정보</b></td>   -->
			<td><input type="hidden"   style="display:none;" value="${v.venderCode}" name="venderCode"></td> 
			<td><b id="vender-name">거래처명</b>
			<input type="text" name="venderName" id="vender-name-surr" value="${v.venderName} "></td>
			<td><b id="vendertype">구분</b><select id="vendertype-surr" name="venderType" >
			<option value="${v.venderType}" selected disabled hidden>일반거래처</option>
			<option value="1">일반거래처</option>
			<option value="2">은행</option>
			<option value="3">카드</option>
			</select>
			</td>
		</tr>
		
		<tr>
			<td><b id="biz-num"> 사업자등록번호 / 주민번호 / 계좌번호 / 카드번호</b>
			<input type="text" name="bizRegNum" id="biz-reg-num-surr" value="${v.bizRegNum}"></td>
		</tr>


		<tr>
			<td><b id="boss-name"> 대표자성명</b>
			<input type="text" name="bossName" id="boss-name-surr" value="${v.bossName}"></td>
		</tr>
		
		<tr>
			<td>
				<b id="sell"> 업종</b> <b id="sell-way">업태</b> <input type="text" name="sellWay" id="sell-way-surr" value="${v.sellWay}">
				<b id="sell-target">종목</b> <input type="text" name="sellTarget" id="sell-target-surr" value="${v.sellTarget}">
					<b id="farmers-status">농어민</b><input type="checkbox" value="1" id="farmers-status-surr" name="farmersStatus">
			</td>
		</tr>
		
		<tr>
			<td><b id="address"> 주소</b>
			<input type="text" name="postcode" id="vender-address1-surr" placeholder="우편번호">
			<td><input type="button" onclick="sample2_execDaumPostcode()" id="addressbtn" value="검색"></td>
			<td><input type="text" id="vender-address2-surr" name="venderAddress" placeholder="주소" value="${v.venderAddress}"></td>
  <td class="secondLine"><input type="hidden" id="address2" name="address1" placeholder="상세주소"></td>
		</tr>
		
		<tr>
			<td><b id="null-okay">####상세 입력 안함####</b>
		</tr>

		<tr>
			<td><b id="phone" > 연 락 처</b> 
			<b id="vender-tel">전화번호</b> <input type="tel" name="venderTel" id="vender-tell-surr" value="${v.venderTel}">
			<b id="vender-fax">팩스번호</b> <input type="tel" name="venderFax" id="vender-fax-surr" value="${v.venderFax}">
			</td>
			<td></td>
		</tr>
		
		<tr>
			<td><b id="department-incharge"> 담당(부서)사원</b>
			`<input type="text" id="department-incharge1-surr" name="departmentIncharge" value="${v.departmentIncharge}">
<!-- 			`<input type="text" id="department-incharge2-surr"> -->
			</td>
		</tr>
		
 		<tr>
			<td><b id="account-income-num"> 입금 계좌 번호</b>
				<b id=bank>은행</b><input type="text" id="bank-code-surr" value="${v.bankCode}" name="bankCode">
			 <c:if test="${v.bankCode==1}"><input type="text" id="bank-code-name-surr" value="한국은행"></c:if> 
			 <c:if test="${v.bankCode==2}"><input type="text" id="bank-code-name-surr" value="산업은행"></c:if> 
			 <c:if test="${v.bankCode==3}"><input type="text" id="bank-code-name-surr" value="기업은행"></c:if> 
			 <c:if test="${v.bankCode==4}"><input type="text" id="bank-code-name-surr" value="국민은행"></c:if> 
			 <c:if test="${v.bankCode==5}"><input type="text" id="bank-code-name-surr" value="신한은행"></c:if> 
			 <c:if test="${v.bankCode==6}"><input type="text" id="bank-code-name-surr" value="농협은행"></c:if> 
			 <c:if test="${v.bankCode==7}"><input type="text" id="bank-code-name-surr" value="SC은행"></c:if> 
			 <c:if test="${v.bankCode==8}"><input type="text" id="bank-code-name-surr" value="한국씨티은행"></c:if> 
			 <c:if test="${v.bankCode==9}"><input type="text" id="bank-code-name-surr" value="우리은행"></c:if> 
				
				
			</td>
			<td><b id="account-holder"> 예금주 </b><input type="text" name="accountHolder" id="account-holder-surr" value="${v.accountHolder}">
				<b id="account-num">계좌번호</b><input type="text" name="accountNum" id="account-num-surr" value="${v.accountNum}">
			</td>
		</tr>
		
		<tr>
		<td><b id="com-manage-tel">  업체담당자연락처 </b>
				<input type="text" name="comManagerTel" id="com-manager1-tel-surr" placeholder="숫자만 입력"  value="${v.comManagerTel}" >
			<td></td>
		</tr>
		<tr>
			<td><b id="remarks">비    고</b>
			<input type="text" name="remarks" id="remarks-surr" value="${v.remarks}"></td>
			<td></td>
		</tr>
		<tr>
			<td><b id="status">사 용 여 부</b>
			<input type="text" name="status" id="zero-one-surr" value="${v.status}">
			<b id="zero-one">0:부 1:여</b></td>
			<td></td>
		</tr>
		</c:forEach>
		</c:if>
		<tr>
			<td><button id="okay1" style="color:white" type="reset">수정취소</button></td>
			<td><button id="okay2" style="color:white" type="submit">수정완료</button></td>
		</tr>
		</form>
		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

/*주소*/
// 우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}

					} /* else {
						document.getElementById("sample2_extraAddress").value = '';
					} 여기 주석처리했어!*/

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('vender-address1-surr').value = data.zonecode;
					document.getElementById("vender-address2-surr").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("address2")
							.focus();

					// iframe을 넣은 element를 안보이게 한다.
					// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					element_layer.style.display = 'none';
				},
				width : '100%',
				height : '100%',
				maxSuggestItems : 5
			}).embed(element_layer);

	// iframe을 넣은 element를 보이게 한다.
	element_layer.style.display = 'block';

	// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 할때는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주거나,
// 직접 element_layer의 top,left값을 수정해 주면 
function initLayerPosition() {
	var width = 400; //우편번호서비스가 들어갈 element의 width
	var height = 500; //우편번호서비스가 들어갈 element의 height
	var borderWidth = 1; //샘플에서 사용하는 border의 두께

	// 위에서 선언한 값들을 실제 element에 넣는다.
	element_layer.style.width = width + 'px';
	element_layer.style.height = height + 'px';
	element_layer.style.border = borderWidth + 'px solid';
	// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
			+ 'px';
	element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
			+ 'px';
}

	
<!-- 		
</table> -->
</body>
</html>