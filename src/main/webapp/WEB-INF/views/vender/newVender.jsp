<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${ contextPath }/resources/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="${ contextPath }/resources/demo/datatables-demo.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<style>

/* 1. 사업자등록번호 biz-Num*/

#biz-num{
position: absolute;
width: 400px;
height: 24px;
left: 320px;
top: 184px;

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
top: 184px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}
/* 거래처주소 2번째칸 vender-address2-surr */

#vender-address2-surr{
position: absolute;
width: 352px;
height: 27px;
left: 630px;
top: 362px;

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
left: 455px;
top: 475px;

/* background: #D9E3E3; */
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
top: 688px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*  은행이름칸 bank-code-name-surr */

.bank-code-name-surr{
position: absolute;
width: 228px;
height: 27px;
left: 644px;
top: 532px;

background: #D9E3E3;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

#searchBtn2{
position:absolute;
left:595px;
top:532px;

}

/* 상세입력안함칸 null-okay-surr*/

#null-okay{
position: absolute;
width: 649px;
height: 27px;
left: 337px;
top: 328px;

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
top: 330px;

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
top: 245px;

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
top: 307px;

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
top: 362px;

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
top: 417px;

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
width: 124px;
height: 24px;
left: 320px;
top: 475px;

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
top: 550px;

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


/* 9. 업체담당자연락처 com-manage-tel */

#com-manage-tel{
position: absolute;
width: 150px;
height: 24px;
left: 320px;
top: 625px;

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
left: 321px;
top: 688px;

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
left: 321px;
top: 745px;

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
top: 307px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
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
top: 417px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
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
top: 532px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
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
top: 572px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
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
left:  765px;
top: 572px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
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
left: 765px;
top: 417px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
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
left: 740px;
top: 307px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
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
left: 455px;
top: 245px;

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
left: 525px;
top: 307px;

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
left: 550px;
top: 417px;

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
left: 860px;
top: 417px;

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
top: 362px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}
 
 #addressbtn{
position: absolute;
width: 50px;
height: 28px;
left: 560px;
top: 362px;
background:#24574A;
color:white;
border-radius:5px;
font-size:6px;

 }

/*담당부서사원코드란 department-incharge1-surr */

#department-incharge1-surr{
position: absolute;
width: 82px;
height: 27px;
left: 405px;
top: 475px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}


/*은행코드란 bank-code-surr */

.bank-code-surr{
position: absolute;
width: 82px;
height: 27px;
left: 505px;
top: 532px;

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
left: 470px;
top: 625px;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*  예금주란 account-holder-surr */

#account-holder-surr{
position: absolute;
width: 190px;
height: 27px;
left: 525px;
top: 572px;

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
left: 860px;
top: 572px;

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
top: 604px;

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
left: 810px;
top: 307px;

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
top: 247px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;

color: #4C4C4C;
}



/* 0:부 1:여  zero-one*/

#zero-one{
position: absolute;
width: 73px;
height: 24px;
left: 501px;
top: 745px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
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
top: 815px;

background: #296355;
border-radius: 5px;
}

/*조회 등록 btn-okay*/
#btn-okay{
position: absolute;
width: 75px;
height: 22.33px;
left: 455px;
top: 607px;

background: #D9E3E3;
}

/* /*조회등록 글씨 select*/
#select{
position: absolute;
width: 69px;
height: 15.69px;
left: 446px;
top: 610.62px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 16px;
line-height: 15px;
}


/*입금계좌번호  account-income-num*/

#account-income-num{
position: absolute;
width: 124px;
height: 24px;
left: 321px;
top: 532px;

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
top: 745px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*거래처 명 : vender-name*/
#vender-name{

position: absolute;
width: 80px;
height: 24px;
left: 320px;
top: 120px;

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
left: 455px;
top: 120px;

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
left: 1065px;
top: 307px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
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
left: 1140px;
top: 307px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 구분 vendertype */

#vendertype{
position: absolute;
width: 50px;
height: 24px;
left: 800px;
top: 120px;

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

/* 구분 셀렉트박스란 vendertype-surr*/

#vendertype-surr{
position: absolute;
width: 170px;
height: 27px;
left: 890px;
top: 120px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}

 
/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 0 auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .modalTop{
        	margin: 0;
        	width:100%;
        	height:50px;
        	background:#6E00AB;
        }
        
        .modal-header {
        	background: #296355;
        } 
	
	#resultReTable input {
		text-align: center;
	}
	#sub{
		background:#888888;
		border: 1px solid #888888;
		color: white;
	}
	
	#update{
		background:#888888;
		border: 1px solid #888888;
		color: white;
	}
	
	#farm{
		background:#888888;
		border: 1px solid #888888;
		color: white;
	}



</style>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	
	<div id="main">
				<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>
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
<!-- 		<td><b id="vender-info">거래처 신규등록</b></td> -->
			<td><b id="vender-name">거래처명</b><input type="text" name="venderName" id="vender-name-surr" name="venderName"></td>
			<td><b id ="vendertype">구분</b><select id="vendertype-surr" name="venderType">
			<option value="1">일반거래처</option>
			<option value="2">은행</option>
			<option value="3">카드</option>
			</select>
			</td>
		</tr>
		
		<tr>
			<td><b id="biz-num"> 사업자등록번호 / 주민번호 / 계좌번호 / 카드번호  </b>
			<input type="text" name="bizRegNum" id="biz-reg-num-surr" placeholder=" 사업자/주민 등록번호의 경우 -로 입력">
			<!-- <button>사업자등록상태조회</button></td> -->
		</tr>


		<tr>
			<td><b id="boss-name"> 대표자성명</b>
			<input type="text" name="bossName" id="boss-name-surr"></td>
		</tr>
		
		<tr>
			<td>
				<b id="sell"> 업종</b> <b id="sell-way">업태</b> <input type="text" name="sellWay" id="sell-way-surr" >
				<b id="sell-target">종목</b> <input type="text" name="sellTarget" id="sell-target-surr">
				<b id="farmers-status">농어민</b><input type="checkbox" value="1" id="farmers-status-surr" name="farmersStatus">
			</td>
		</tr>
			
		<tr>
			<td><b id="address"> 주소</b>
			<input type="text" name="postcode" placeholder=" 우편번호" id="vender-address1-surr">
			<td><input type="button" onclick="sample2_execDaumPostcode()" id="addressbtn" value="검색"></td>
			<td><input type="text" id="vender-address2-surr" name="venderAddress" placeholder=" 주소"></td>
		  <td class="secondLine"><input type="hidden" id="address2" name="address1" placeholder=" 상세주소"></td>
		</tr>

		<tr>
			<td><b id="phone"> 연 락 처</b> 
			<b id="vender-tel">전화번호</b> <input type="tel" name="venderTel" id="vender-tell-surr">
			<b id="vender-fax">팩스번호</b> <input type="tel" name="venderFax" id="vender-fax-surr">
			</td>
			<td></td>
		</tr>
		
		<tr>
			<td><b id="department-incharge"> 담당(부서)사원</b>
<!-- 			<input type="text" id="department-incharge1-surr"> -->
			<input type="text" name="departmentIncharge" id="department-incharge2-surr">
			</td>
		</tr>
		
 		<tr>
 		<div id="totalaccount">
			<td><b id="account-income-num"> 입금 계좌 번호</b>
				<b id="bank">은행</b>
				<input type="text" class="bank-code-surr" id="bankCode" name="bankCode">
				<button type="button" id="searchBtn2"><img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px"></button>
				<input type="text" class="bank-code-name-surr" id="bankName" name="bankName">
			</td>
			
			<td><b id="account-holder"> 예금주 </b><input type="text" name="accountHolder" id="account-holder-surr">
				<b id="account-num">계좌번호</b><input type="text" name="accountNum" id="account-num-surr">
			</td>
		</div>
		</tr>
		
			<script>
			$("#vendertype-surr").change(function(){ 
		
			if($("#vendertype-surr").val()=="2"){
				$("#totalaccount").attr('style', 'display:none;'); 
			}
			
			if($("#vendertype-surr").val()=="1"){
				$("#totalaccount").attr('style','display');
			}
			
			if($("#vendertype-surr").val()=="3"){
				$("#totalaccount").attr('style','display:none;');
			} 

			}); 
			</script>
		
		<tr>
			<td><b id="com-manage-tel"> 업체담당자연락처 </b>
				<input type="text" name="comManagerTel" id="com-manager1-tel-surr" placeholder=" 숫자만 입력">

			</td>
		 <td><input type="hidden" value="${sessionScope.loginCompany.companyCode}" name="comCode" id="comCode"></td> 
			
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

	</main>
	
      <!-- Modal 은행코드 -->
  <div class="modal fade" id="bankModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">은행검색</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <div class="modal-body">
          	<table id="bankTable">
          		<thead>
	          		<tr>
	          			<th>은행코드</th>
	          			<th>은행명</th>
	          		</tr>
          		</thead>
          	<tbody>
          	
          	</tbody>
          	</table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

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
};
</script>

<script>
var bankCode;//출금/입금계정과목
var bankName;
function ccc(value){
	$(value).parent().parent().children().each(function(index){
		console.log($(this).text());
		bankCode+= ","+$(this).text();
	})
	var bank = bankCode.split(",");
	bankCode = bank[1];
	bankName = bank[2];
	
	$("#bankCode").val(bankCode);
	$("#bankName").val(bankName);
	
	$("div#bankModal").modal("hide");
}		

/* 은행모달 */
$("#searchBtn2").click(function(){
	
	$("#bankTable").dataTable({
 	/* 	destroy: true,  */
		 ajax:{
				'url':'bankSearch.vi',
				'type':'get'
			},
		 
		 columns: [

			 {data : "bankCode",
				 "render": function(data, type, row){
		                if(type=='display'){
		                    data = '<a href="#" onclick="ccc(this);">' + data + '</a>';
		                }
		                return data;} 
			 },
			 
			 {data : "bankName",
				 "render": function(data, type, row){
		                if(type=='display'){
		                    data = '<a href="#" onclick="ccc(this);">' + data + '</a>';
		                }
		                return data;}
			 }
		 ]
	});
	
	$(".modal-title").text("은행검색").css("color","white");
	 $("div#bankModal").modal();
});

</script>
</div>

	<jsp:include page="../common/menubar2.jsp" />
	
</body>
</html>