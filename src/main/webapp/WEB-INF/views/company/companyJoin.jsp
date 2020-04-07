<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼 view </title>
<style>

	.main{
		height:1900px;
		width:1360px;
		background-color:white;
		margin-left:auto;
		margin-right:auto;
	}

	#line{
		width:900px;
		height:1360px;
		background:white;
		color:black;
		margin-left:auto;
		margin-right:auto;
		border:1px;	
	}

	.innerLine{
		width:800px;
		height:1px;
		background-color:black;
	}

	.tableJoin{
 		width:800px;
 		height:600px;
	}

	.firstLine{
		width:125px;
		height:50px;
		font-size:15px;
	}

	.secondLine{
		width: 300px;
		height:50px;
		font-size:20px;
	}
	
	.thirdLine{
		width: 125px;
		height:50px;
		font-size:15px;
	}
	
	.subLine{
		height:25px;
	}


	#userId{
		width:370px;
		height:25px;
	}
	
	#userPwd{
		width:370px;
		height:25px;
	}
	
	#userPwd2{
		width:370px;
	    height:25px;
	}
	
	#phone{
		width:370px;
	    height:25px;
	}
	
	#userName{
		width:370px;
		height:25px;		
	}
	

	#email1{
		width:370px;
		height:25px;		
	}
	
	#email2{
		width:150px;
		height:30px;
	}
	
	#gongsi{
		width:370px;
		height:25px;
	}
		
	#inputBizNum{
		width:370px;
		height:25px;
	}
	
	#inputCorpNum{
		width:370px;
		height:25px;
	}
	
	#inputCorpName{
		width:370px;
		height:25px;
	}
	
	#inputCeoName{
		width:370px;
		height:25px;
	}
	
	#postcode{
		width:90px;
		height:25px;
	}
	
	#address1{
		width:370px;
		height:25px;
	}
	
	#address2{
		width:370px;
		height:25px;
	}
	
	#empName{ 
		width:370px;
		height:25px;
	}
	
	#personalNum{
		width:370px;
		height:25px;
	}
	
	#idCheck{
		width:150px;
		background-color:#1B5748;
		border-color:black;
		border:0;
		height:30px;
		color:white;
	}
	
	#idCheck:hover{
		background-color:lightgray;
		cursor:pointer;
	}
	
	#uploadBtn{
		width:150px;
		background-color:#1B5748;
		border-color:black;
		border:0;
		height:30px;
		color:white;
	}
	
	#uploadBtn:hover{
		background-color:lightgray;
		cursor:pointer;
	}

	#emailCheck{
		width:150px;
		background-color:#1B5748;
		border-color:black;
		border:0;
		height:30px;
		color:white;
	}
	
	#emailCheck:hover{
		background:lightgray;
		cursor: pointer;
	}
	
	
	#location-btn{
		width:150px;
		background-color:#1B5748;
		border-color:black;
		border:0;
		height:30px;
		color:white;
	}
	#location-btn:hover{
		background:lightgray;
		cursor: pointer;
	}

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	
	<div class="main">
	
	<div id="imglogo" align="center">
	<img src="${contextPath}/resources/images/jagalogo.PNG" width="350px">
	</div>

	<div id="line">

		<div class="innerLine"></div>
		<br>
		
		<form id="joinForm" method="post" action="insert.co" encType="multipart/form-data">
		<table class="tableJoin" align="center">
		<tr>
			<td class="subLine">
			<td></td>
			<td></td>
			<td></td>
		</tr>
		
		<tr>
			<td class="firstLine"><b>아이디</b></td>
			<td class="secondLine"><input type="text" maxlength="12" name="companyId" id="userId" placeholder="6~12자 영문 소문자, 숫자 입력"></td>
			<td class="thirdLine"><button type="button" id="idCheck">중복확인</button></td>
			<td></td>
		</tr>
		
		<tr>
			<td class="subLine">
			<td></td>
			<td><span style="color:red; font-size:15px;" id="userIdCheck"></span></td>
			<td></td>
		</tr>
		
		<tr> 
			<td class="firstLine"><b>비밀번호</b></td>
			<td class="secondLine">
			<input type="password" maxlength="13" name="companyPwd" id="userPwd" placeholder="6~16자 영문, 숫자, 특수문자 입력">
			</td>
			<td class="thirdLine"></td>	
		</tr>
		
		<tr class="subline">
			<td></td>
			<td><span style="color:red; font-size:15px;" id="userPwdCheck"></span></td>
			<td></td>
			
		<tr>
            <td class="firstLine"><b>비밀번호확인</b></td>
            <td class="secondLine">
           	<input type="password" maxlength="13" name="companyPwd2" id="userPwd2"></td>
            <td class="thirdLine"></td>
       </tr>
        
        <tr class="subLine">
			<td></td>
			<td><span style="color:red; font-size:15px;" id="pwdResult"></span></td>
			<td></td>
		</tr> 
		
		<tr>
            <td class="firstLine"><b>이메일</b></td>
            
            <td class="secondLine">
           	<input type="text" maxlength="13" name="email" id="email1">
           	</td>
           	
          	<td> 
          	<select name="email2" id="email2">
            <option value="1">@yaho.co.kr</option>
            <option value="2">@naver.com</option>
            <option value="3">@daum.net</option>
            <option value="4">@gmail.com</option>
            </select>
            </td>
        </tr>
        
        <tr>
        	<td class="firstLine">전화번호</td>
        	<td class="secondLine">
        	<input type="tel" maxlength="30" name="phone" id="phone">
        	</td>
        	<td class="thirdLine"></td>
        </tr>
        
		<tr class="licenseTriger">
		
            <td class="firstLine"><b>사업자 등록증</b></td>
               		
            <td class="secondLine">
             <div id="licenseImgArea">
             <img id="fake-fileUp" name="upload" width="150" height="200">
             </div>
            </td>
               		
            <td class="thirdLine">
              <input type="file" id="input-fileUp" name="photo" onchange="loadImg(this, 2);">
              <button type="button" id="uploadBtn">등록증 인증</button>
            </td>
        </tr>
        
        <tr class="hidesub">
				<td></td>
				<td></td>
				<td></td>
		</tr>
            	
         <tr class="licenseTriger">
               <td class="firstLine"><b>사업자 등록번호</b></td>
               <td class="secondLine">
               <input type="text" id="inputBizNum" maxlength="13" name="bizNum" placeholder="사업자 등록증을 인증해주세요">
               </td>
               <td class="thirdLine"><label id="nnResult"></label></td>
         </tr>
         
         <tr class="hidesub">
				<td></td>
				<td></td>
				<td></td>
		</tr>
            	
        <tr class="hidesub">
				<td></td>
				<td></td>
				<td></td>
		</tr>
			
        <tr class="licenseTriger">
               <td class="firstLine"><b>회사명(상호) </b></td>
               <td class="secondLine"><input type="text" id="inputCorpName" name="bizName" placeholder="회사명(상호)을 입력해주세요"></td>
               <td class="thirdLine"></td>
        </tr>
            
        <tr class="hidesub">
				<td></td>
				<td></td>
				<td></td>
		</tr>
			
         <tr class="licenseTriger">
               <td class="firstLine"><b>대표자명</b></td>
               <td class="secondLine"><input type="text" id="inputCeoName" name="bossName" placeholder="대표자명을 입력해주세요"></td>
               <td class="thirdLine"></td>
        </tr>
            
         <tr class="hidesub">
				<td></td>
				<td></td>
				<td></td>
		</tr>
			
		 <tr class="hidesub">
				<td></td>
				<td></td>
				<td></td>
		</tr>
			
		 <tr>
            <td class="firstLine"><b>주민등록번호</b></td>
            <td class="secondLine">
           	<input type="text" maxlength="30" name="personalNum" id="personalNum"></td>
            <td class="thirdLine"></td>
         </tr>
        
        
          <tr class="licenseTriger">
               <td class="firstLine"><b>회사/점포주소</b></td>
               <td class="secondLine">
               <input type="text" id="postcode" name="postcode" placeholder="우편번호">
               <input type="text" id="address1" name="address1" placeholder="주소">
               </td>
               
               <td class="thirdLine">
               <input type="button" onclick="sample2_execDaumPostcode()" id="location-btn" value="주소 검색">
               </td>
          </tr>
            
           <tr class="licenseTriger">
               <td class="firstLine"></td>
               <td class="secondLine"><input type="text" id="address2" name="bizLocation" placeholder="상세주소"></td>
               <td class="thirdLine"></td>
           </tr>
            
            <tr class="hidesub">
				<td></td>
				<td></td>
				<td></td>
			</tr>
		
		    <tr class="licenseTriger">
               <td class="firstLine">업종코드</td>
               <td class="secondLine"><input type="text" id="address2" name="bizType" placeholder="업종코드"></td>
               <td class="thirdLine"></td>
           </tr>	
			
			
		   <tr class="hidesub">
				<td></td>
				<td></td>
				<td></td>
			</tr>

		</table>
		
		<div align="center">
			<button type="reset">작성취소</button>
			<button type="submit">가입하기</button>
		</div>
		</form>
	</div>
	
	</div>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>