<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
width: 104px;
height: 24px;
left: 320px;
top: 124px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;

}

/*사업자등록번호 네모칸 biz-reg-num-surr*/

#biz-reg-num-surr{
position: absolute;
width: 222px;
height: 24px;
left: 454px;
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

/*  은행이름칸 bank-code-name-surr */

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
font-size: 12px;
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
font-size: 12px;
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
font-size: 12px;
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
font-size: 12px;
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
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}


/* 6. 담당(부서)사원  department-incharge*/

#department-incharge{
position: absolute;
width: 104px;
height: 24px;
left: 321px;
top: 387px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
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
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}


/* 9. 업체담당자연락처 com-manage-tel */

#com-manage-tel{
position: absolute;
width: 120px;
height: 24px;
left: 320px;
top: 547px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
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
left: 331px;
top: 627px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
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
left: 331px;
top: 667px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
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
font-size: 12px;
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
font-size: 12px;
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
font-size: 12px;
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
font-size: 12px;
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
font-size: 12px;
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
font-size: 12px;
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
font-size: 12px;
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
left: 515px;
top: 344px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 팩스번호란 vender-fax-surr */

#vender-fax-surr{
position: absolute;
width: 201px;
height: 27px;
left: 785px;
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

/* 주소첫번째란 vender-address1-surr */

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
 

/*담당부서사원코드란 department-incharge1-surr */

#department-incharge1-surr{
position: absolute;
width: 82px;
height: 27px;
left: 455px;
top: 384px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}


/*은행코드란 bank-code-surr */

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

/*업체담당자연락처 코드란 com-manager1-tel-surr*/

#com-manager1-tel-surr{
position: absolute;
width: 190px;
height: 27px;
left: 460px;
top: 544px;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*  예금주란 account-holder-surr */

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


/*  계좌번호란 account-num-surr */

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

/* 업체담당자연락처 상세란 com-manager-tel-surr */

#com-manager2-tel-surr{
position: absolute;
width: 201px;
height: 27px;
left: 660px;
top: 544px;

background: #D9E3E3;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 종목란 sell-target-surr  */

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

#okay{
position: absolute;
width: 82px;
height: 27px;
left: 644px;
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
width: 104px;
height: 24px;
left: 321px;
top: 467px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
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
width: 58px;
height: 24px;
left: 455px;
top: 79px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: right;

color: #4C4C4C;
}

/*거래처 명 칸: vender-name-surr*/

#vender-name-surr{

position: absolute;
width: 167px;
height: 27px;
left: 516px;
top: 79px;

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
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #4C4C4C;
}
/*농어민란 farmers-status-surr*/
#farmers-status-surr{

position: absolute;
width: 25px;
height: 25px;
left: 1082px;
top: 192px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

</style>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	<div id="main">
	<div class="container-fluid">
		<h2 class="mt-4">거래처 신규등록</h2>
<!-- 		<ol class="breadcrumb mb-4">
		</ol> -->
<!--   		<div class="card mb-4"> - -->
	 	<div class="card-body"> 
			<div id="main">
		<div id="table-total"> 
		 
<!-- <table> -->
	<form id="joinForm" method="post" action="insert.ve">
		<tr>
			<td><b id="vender-info">거래처 신규등록</b></td>
			<td><b id="vender-name">거래처명</b><input type="text" name="venderName" id="vender-name-surr" name="venderName"></td>
		</tr>
		
		<tr>
			<td><b id="biz-num">1.사업자등록번호</b>
			<input type="text" name="bizRegNum" id="biz-reg-num-surr">
			<!-- <button>사업자등록상태조회</button></td> -->
		</tr>


		<tr>
			<td><b id="boss-name">2.대표자성명</b>
			<input type="text" name="bossName" id="boss-name-surr"></td>
		</tr>
		
		<tr>
			<td>
				<b id="sell">3.업종</b> <b id="sell-way">업태</b> <input type="text" name="sellWay" id="sell-way-surr" >
				<b id="sell-target">종목</b> <input type="text" name="sellTarget" id="sell-target-surr">
				<b id="farmers-status">농어민</b><input type="checkbox" value="1" id="farmers-status-surr" name="farmersStatus">
			</td>
		</tr>
		
		<tr>
			<td><b id="address">4.주소</b>
			<input type="text" name="" id="vender-address1-surr"><input type="text" id="vender-address2-surr"></td>
			<td><input type="text" name="venderAddress" id="vender-address3-surr"></td>
		</tr>
		
		<tr>
			<td><b id="null-okay">####상세 입력 안함####</b>
		</tr>

		<tr>
			<td><b id="phone">5.연 락 처</b> 
			<b id="vender-tel">전화번호</b> <input type="tel" name="venderTel" id="vender-tell-surr">
			<b id="vender-fax">팩스번호</b> <input type="tel" name="venderFax" id="vender-fax-surr">
			</td>
			<td></td>
		</tr>
		
		<tr>
			<td><b id="department-incharge">6.담당(부서)사원</b>
			`<input type="text" id="department-incharge1-surr">
			`<input type="text" name="departmentIncharge" id="department-incharge2-surr">
			</td>
		</tr>
		
 		<tr>
			<td><b id="account-income-num">7.입금 계좌 번호</b>
				<b id=bank>은행</b><input type="text" id="bank-code-surr" name="bankCode"><input type="text" id="bank-code-name-surr">
			</td>
			<td><b id="account-holder"> 예금주 </b><input type="text" name="accountHolder" id="account-holder-surr">
				<b id="account-num">계좌번호</b><input type="text" name="accountNum" id="account-num-surr">
			</td>
		</tr>
		
		<tr>
			<td><b id="com-manage-tel"> 8.업체담당자연락처 </b>
				<input type="text" name="comManagerTel" id="com-manager1-tel-surr" placeholder="숫자만 입력">

			</td>
		 <td><input type="hidden" value="${sessionScope.loginCompany.companyCode}" name="comCode"></td> 
			
		</tr>
		<tr>
			<td><b id="remarks">비    고</b>
			<input type="text" name="remarks" id="remarks-surr"></td>
			<td></td>
		</tr>
		<tr>
			<td><b id="status">사 용 여 부</b>
			<input type="text" name="status" id="zero-one-surr">
			<b id="zero-one">0:부 1:여</b></td>
			<td></td>
		</tr>
		
		<tr>
			<td><button id="okay" type="submit" style="color:white">확인</button></td>
		</tr>

		</form>
		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
<!-- </table> -->
</body>
</html>