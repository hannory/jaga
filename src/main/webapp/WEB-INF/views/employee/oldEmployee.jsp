<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


/* 사각형 테두리 border */

#border{
position: absolute;
width: 1350px;
height: 1500px;
left: 286px;
top: 233px;

border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}

#border2{
position:absolute;
width:330px;
height:1500px;
left:286px;
top:233px;

border:1px solid #C4C4C4;
box-sizing: border-box;
border-radius:5px;
}

/* Line 55 vertical */

/* #vertical{
position: auto;
height: 1800px;
left: 185px;
top: 213px;

border: 1px solid #C4C4C4;
transform: rotate(90.05deg);
}
 */

/*직원관리 employee-manage*/
#employee-manage{
position: absolute;
width: 193px;
height: 42px;
left: 303px;
top: 74px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 30px;
line-height: 35px;

color: #000000;
}

/* 일반근로자 big-employee*/
#big-employee{
position: absolute;
width: 110px;
height: 42px;
left: 304px;
top: 148px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 20px;
line-height: 23px;

color: #000000;
}



/* Line 20 row-employee */

#row-employee{
position: absolute;
width: 90px;
height: 0px;
left: 304px;
top: 180px;

border: 3px solid #24574A;
}
/* 일용근로자 big-one-imployee */

#big-one-imployee{
position: absolute;
width: 100px;
height: 42px;
left: 451px;
top: 148px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 20px;
line-height: 23px;

color: #5A5A5A;
}

/* 사업소득자 big-income-employee */

#big-income-employee{
position: absolute;
width: 101px;
height: 42px;
left: 599px;
top: 148px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 20px;
line-height: 23px;

color: #5A5A5A;

}
/* 일반근로자 - 신규추가 employee */

#employee{
position: absolute;
width: 236px;
height: 30px;
left: 499px;
top: 128px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 20px;
line-height: 23px;

color: #000000;

}
/* 저장하기 save*/

#save{
position: absolute;
width: 82px;
height: 29px;
left: 1228px;
top: 233px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;

}


/* 저장하기버튼 save-surr */

#save-surr{
position: absolute;
width: 90px;
height: 29px;
left: 1228px;
top: 233px;

background: #296355;
border-radius: 5px;
}

/* * 기본 정보 basic-info*/ */
#basic-info{


position: auto;
width: 67px;
height: 25px;
left: 547px;
top: 301px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 16px;
line-height: 19px;

color: #000000;

}

/* 이름 name */
#name{
position: absolute;
width: 104px;
height: 24px;
left: 547px;
top: 340px;

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


/*name-surr */

#name-surr{
position: absolute;
width: 222px;
height: 27px;
left: 661px;
top: 337px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}


/* 주민등록번호 security-num*/
#security-num{

position: absolute;
width: 104px;
height: 24px;
left: 920px;
top: 340px;

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
/* security-num-surr */

#security-num-surr{
position: absolute;
width: 222px;
height: 27px;
left: 1034px;
top: 337px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}

#salary{
/* 월급여  salary*/


position: absolute;
width: 104px;
height: 24px;
left: 547px;
top: 391px;

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

/* salary-surr*/

#salary-surr{
position: absolute;
width: 222px;
height: 27px;
left: 661px;
top: 388px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

#email{
/* 이메일 email*/


position: absolute;
width: 104px;
height: 24px;
left: 920px;
top: 391px;

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


/*  email-surr */

#email-surr{
position: absolute;
width: 222px;
height: 27px;
left: 1034px;
top: 388px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}
/* 식대/자가운전/육아수당/연구수당을 포함한 금액을 입력해주세요. tip*/

#tip{
position: absolute;
width: 225px;
height: 55px;
left: 662px;
top: 420px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 14px;
line-height: 16px;
display: flex;
align-items: center;

color: #888888;
}

/* 입사년월일 enroll-date  */
#enroll-date{

position: absolute;
width: 104px;
height: 24px;
left: 543px;
top: 503px;

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

/* 입사연월일 란 enroll-date-surr*/

#enroll-date-surr{
position: absolute;
width: 222px;
height: 27px;
left: 661px;
top: 504px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 식대 rice */
#rice{

position: absolute;
width: 104px;
height: 24px;
left: 543px;
top: 548px;

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

/* Rectangle 254 식대란 rice-surr */

#rice-surr{
position: absolute;
width: 222px;
height: 27px;
left: 661px;
top: 546px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 식대셀렉트박스란 rice-select-surr*/

#rice-select-surr{
position: absolute;
width: 27px;
height: 27px;
left: 856px;
top: 546px;

background: #E4E4E4;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 0px 5px 5px 0px;
}


/* 자가운전 drive */

#drive{
position: absolute;
width: 104px;
height: 24px;
left: 919px;
top: 551px;

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


/* 자가운전란 drive-surr */
#drive-surr{

position: absolute;
width: 222px;
height: 27px;
left: 1034px;
top: 546px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 자가운전셀렉트박스란 drive-select-surr  */

#drive-select-surr{

position: absolute;
width: 27px;
height: 27px;
left: 1229px;
top: 546px;

background: #E4E4E4;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 0px 5px 5px 0px;

}



/* 육아수당 baby */

#baby{
position: absolute;
width: 104px;
height: 24px;
left: 543px;
top: 588px;

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

/*육아수당란 baby-surr */
#baby-surr{

position: absolute;
width: 222px;
height: 27px;
left: 661px;
top: 588px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/*육아수당셀렉트박스란 baby-select-surr*/

#baby-select-surr{
position: absolute;
width: 27px;
height: 27px;
left: 856px;
top: 588px;

background: #E4E4E4;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 0px 5px 5px 0px;

}
/* 4대보험 정보 big4-insurance*/

#big4-insurance{
position: absolute;
width: 95px;
height: 30px;
left: 551px;
top: 673px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 16px;
line-height: 19px;

color: #000000;

}

/* 직급 positon */

#position{
position: absolute;
width: 104px;
height: 24px;
left: 547px;
top: 721px;

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

/* 직급란 position-surr */

#position-surr{
position: absolute;
width: 222px;
height: 27px;
left: 661px;
top: 718px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}
/* 직급셀렉트박스란 position-select-surr*/

#position-select-surr{
position: absolute;
width: 27px;
height: 27px;
left: 856px;
top: 718px;

background: #E4E4E4;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 0px 5px 5px 0px;

}

/* 고용/산재보험 goyong-sanjae*/

#goyong-sanjae{
position: absolute;
width: 110px;
height: 24px;
left: 917px;
top: 721px;

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
/* 고용산재보험란 goyong-sanjae-surr */

#goyong-sanjae-surr{
position: absolute;
width: 222px;
height: 27px;
left: 1031px;
top: 718px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 고용산재보험셀렉트박스 goyong-sanjae-select-surr */

#goyong-sanjae-select-surr{
position: absolute;
width: 27px;
height: 27px;
left: 1226px;
top: 718px;

background: #E4E4E4;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 0px 5px 5px 0px;

}


/* 취득신고 여부  acquisition-status  */
#acquisition-status{


position: absolute;
width: 125px;
height: 24px;
left: 896px;
top: 809px;

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


/* 취득여부란 a-status-surr */

#a-status-surr{
position: absolute;
width: 27px;
height: 27px;
left: 1037px;
top: 806px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 0:부 1:여 zero-one-1*/

#zero-one-1{
position: absolute;
width: 53px;
height: 24px;
left: 1073px;
top: 809px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;

color: #4C4C4C;
}

/* 상실신고 여부  deprivation-status*/

#deprivation-status{
position: absolute;
width: 125px;
height: 24px;
left: 896px;
top: 847px;

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


/*  상실여부란 de-status-surr */

#de-status-surr{
position: absolute;
width: 27px;
height: 27px;
left: 1037px;
top: 845px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 1:부 0:부 zero-one-2*/

#zero-one-2{
position: absolute;
width: 53px;
height: 24px;
left: 1073px;
top: 848px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;

color: #4C4C4C;

}


/* 관리사항 manage*/

#manage{
position: absolute;
width: 90px;
height: 30px;
left: 550px;
top: 903px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 16px;
line-height: 19px;

color: #000000;
}


/* 급여이체 은행 bank */

#bank{
position: absolute;
width: 104px;
height: 24px;
left: 547px;
top: 946px;

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



/* 급여이체은행란 bank-surr */

#bank-surr{
position: absolute;
width: 222px;
height: 27px;
left: 661px;
top: 947px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 급여이체은행셀랙트박스란 bank-select-surr */

#bank-select-surr{
position: absolute;
width: 27px;
height: 27px;
left: 856px;
top: 947px;

background: #E4E4E4;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 0px 5px 5px 0px;

}

/* 계좌번호 account-num */
#account-num{

position: absolute;
width: 104px;
height: 24px;
left: 917px;
top: 946px;

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

/* 계좌번호 란 account-num-surr */

#account-num-surr{
position: absolute;
width: 222px;
height: 27px;
left: 1034px;
top: 948px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}

/* 예금주 account-holder-name */

#account-holder-name{
position: absolute;
width: 104px;
height: 24px;
left: 547px;
top: 996px;

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


/*예금주 란 account-holder-surr*/

#account-holder-surr{
position: absolute;
width: 222px;
height: 27px;
left: 661px;
top: 998px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}





/* 부서 department*/
#department{

position: absolute;
width: 104px;
height: 24px;
left: 917px;
top: 996px;

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

/* 부서란 department-surr  */

#department-surr{
position: absolute;
width: 222px;
height: 27px;
left: 1034px;
top: 998px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}


/* 직급 position-code */

#position-code{
position: absolute;
width: 104px;
height: 24px;
left: 547px;
top: 1046px;

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

/* 직급란 position-code-surr */
#position-code-surr{

position: absolute;
width: 222px;
height: 27px;
left: 661px;
top: 1049px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}
/* 증빙 서류 정보 document-info */

#document-info{
position: absolute;
width: 110px;
height: 19px;
left: 550px;
top: 1188px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 16px;
line-height: 19px;
/* identical to box height */


color: #000000;
}



/* 신분증명서류 id-docu*/

#id-docu{

position: absolute;
width: 103px;
height: 24px;
left: 546px;
top: 1245px;

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

/* 신분증명서류1란 id-docu1-surr*/
#id-docu1-surr{

position: absolute;
width: 356px;
height: 27px;
left: 659px;
top: 1242px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}
/* 파일선택란1 chose-file1-surr*/

#chose-file1-surr{
position: absolute;
width: 65px;
height: 27px;
left: 950px;
top: 1242px;

background: #E4E4E4;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 0px 5px 5px 0px;

}
/* 파일선택 chose-file*/

#chose-file{

position: absolute;
width: 57px;
height: 27px;
left: 955px;
top: 1242px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #000000;
}
/* 급여계좌사본 account-docu */

#account-docu{
position: absolute;
width: 103px;
height: 24px;
left: 546px;
top: 1297px;

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
/* 업로드1 upload1 */

#upload1{
position: absolute;
width: 74px;
height: 27px;
left: 1025px;
top: 1242px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;

}

/* 업로드버튼1란 uploadbtn1-surr */

#uploadbtn1-surr{
position: absolute;
width: 74px;
height: 27px;
left: 1025px;
top: 1242px;

background: #296355;
border-radius: 5px;

}


/*급여계좌사본란 account-docu-surr */

#account-docu-surr{
position: absolute;
width: 356px;
height: 27px;
left: 659px;
top: 1294px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

/* 파일선택2 chose-file2-surr */

#chose-file2-surr{
position: absolute;
width: 65px;
height: 27px;
left: 950px;
top: 1294px;

background: #E4E4E4;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 0px 5px 5px 0px;
}

/* 업로드2 upload2 */

#upload2{
position: absolute;
width: 74px;
height: 27px;
left: 1025px;
top: 1293px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;
}

/* 업로드버튼란2 uploadbtn2-surr */
#uploadbtn2-surr{
position: absolute;
width: 74px;
height: 27px;
left: 1025px;
top: 1293px;

background: #296355;
border-radius: 5px;

}

/* 10001 */

#1001{

position: absolute;
width: 52px;
height: 24px;
left: 325px;
top: 314px;

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

#yoo{
position: absolute;
width: 52px;
height: 24px;
left: 480px;
top: 330px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

}

#underline{
position: absolute;
width: 200px;
height: 0px;
left: 330px;
top: 355px;

border: 1px solid #5A5A5A;
}

#search-surr{
position: absolute;
width: 210px;
height: 27px;
left: 330px;
top: 265px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}


#main{
width:1350px;
height:1700px;
}

</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<div id="main">
	<div class="container-fluid">
<!-- 		<h2 class="mt-4">일반근로자 신규등록</h2> -->

<div id="main">
<div id="employee-manage">직원관리</div>
<div id="big-employee">일반근로자</div>
<div id="row-employee"></div>
<div id="big-one-imployee">일용근로자</div>
<div id="big-income-employee">사업소득자</div>
<div id="border2"></div>
<input type="search" id="search-surr">
<div id="yoo">유길동</div>
<div id="underline"></div>
<div id="border">
<div id="vertical"> 

</div>
<tr>
<td> <b id="employee"> 일반근로자-신규추가 </b></td> 
</tr>
<form action="insert.emp" method="post" >
<tr>
<td> <button id="save-surr" style="color:white" type="submit">저장하기 </button>
<td><input type="hidden" value="${sessionScope.loginCompany.companyCode}" name="comCode"></td> 
</tr> 

<tr>
<td>
<b id="name"> 이름</b>
<input type="text" id="name-surr" name="employeeName" > 
<b id="security-num">주민등록번호</b>
<input type="text" id="security-num-surr" name="securityNum">
</td>
</tr>

<tr>
<td>
<b id="salary">월급여</b>
<input type="text" id="salary-surr" name="salary">
<b id="email">이메일</b>
<input type="text" id="email-surr" name="email">
</td>
</tr>

<tr>
<td>
<b id="tip">식대/자가운전/육아수당/연구수당을 포함한 금액을 입력해주세요.</b>
</td>
</tr>

<tr>
<td><b id="enroll-date">입사년월일</b>
<input type="text" id="enroll-date-surr" name="enrollDate">
</td>
</tr>

<tr>
<td><b id="rice">식대</b>
<select id="rice-surr" name="meals">
<option value="1"selected disabled hidden>적용</option>
<option value="1">적용</option>
<option value="2">적용안함</option>
</select>
</td>
</tr>

<tr>
<td><b id="drive">자가운전</b>
<select id="drive-surr" name="drivingSubsidies">
<option value="2" selected disabled hidden>적용안함</option> 
<option value="1">적용</option>
<option value="2">적용안함</option>
</select>
</tr>

<tr>
<td><b id="baby">육아수당</b>
<select id="baby-surr" name="childcareAllowance">
<option value="2" selected disabled hidden>적용안함</option>
<option value="1">적용</option>
<option value="2">적용안함</option>
</select>
</tr>

<tr>
<td>
<b id="big4-insurance">4대보험 정보</b>
</td>
</tr>

<tr>
<td><b id="position">직급</b>
<select id="position-surr" name="positionCode">
<option value="1" selected disabled hidden>사원</option>
<option value="1">사원</option>
<option value="2">등기이사</option>  
<option value="3">대표</option>
</select>
</tr>

<tr>
<td><b id="goyong-sanjae">고용/산재보험</b>
<select id="goyong-sanjae-surr" name="goyongSanjae">
<option value="1" selected disabled hidden>적용</option>
<option value="1">적용</option>  
<option value="2">비적용</option>
</select>
</tr>

<tr>
<td>
<b id="acquisition-status">취득신고 여부</b>
<input type="text" id="a-status-surr" name="acquisitionStatus">
<b id="zero-one-1">Y:부 N:여</b>
</td>
</tr>

<tr>
<td>
<b id="deprivation-status">상실신고 여부</b>
<input type="text" id="de-status-surr"  name="deprivationStatus">
<b id="zero-one-2">Y:부 N:여</b>
</td>
</tr>

<tr>
<td>
<b id="manage">관리사항</b>
</td>
</tr>

<tr>
<td><b id="bank">급여이체은행</b>
<select id="bank-surr" name="bankCode">
<option></option>
<option value="1">기업은행</option>   
<option value="2">국민은행</option>
<option value="3">외환은행</option>
<option value="4">농협</option>
<option value="5">우리은행</option>
<option value="6">sc제일은행</option>
<option value="7">신한은행</option>
<option value="8">씨티은행</option>
<option value="9 ">대구은행</option>
</select>
</tr>


<tr>
<td>
<b id="account-num">계좌번호</b>
<input type="text" id="account-num-surr" name="accountNum">
</td>
</tr>

<tr>
<td>
<b id="account-holder-name">예금주</b>
<input type="text" id="account-holder-surr" name="accountHolder">
<b id="department">부서</b>
<input type="text" id="department-surr" name="department">
</td>
</tr>

<tr>
<td>
<b id="position-code">직급</b>
<input type="text" id="position-code-surr" name="big4PositionCode">
</td>
</tr>

<tr>
<td>
<b id="document-info">증빙 서류 정보</b>
</td>
</tr>



<tr>
<td>
<b id="id-docu">신분증명서류</b>
<input type="file" id="id-docu1-surr" name="idDocument">
<button id="uploadbtn1-surr" style="color:white">업로드</button> 
</td>
</tr>

<tr>
<td>
<b id="account-docu">급여계좌사본</b>
<input type="file" id="account-docu-surr" name="accountDocument">
<button id="uploadbtn2-surr" style="color:white">업로드</button> 
</td>
</tr>
</form>
</div>
</div>
<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />


</body>
</html>                   


