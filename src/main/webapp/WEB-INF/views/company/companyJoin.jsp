<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;
	}
	
	#userPwd{
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;
	}
	
	#userPwd2{
		width:370px;
	    height:25px;
	    background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;
	}
	
	#phone{
		width:370px;
	    height:25px;
	    background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;
	}
	
	#userName{
		width:370px;
		height:25px;		
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;
	}
	

	#email1{
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#email2{
		width:150px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;
	}
	
	#gongsi{
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;
	}
		
	#inputBizNum{
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;
	}
	
	#inputCorpNum{
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#inputCorpName{
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#inputCeoName{
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#postcode{
		width:90px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#address1{
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#address2{
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#empName{ 
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#personalNum{
		width:370px;
		height:25px;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#idCheck{
		width:120px;
		background-color:#1B5748;
		border-color:black;
		border:0;
		height:30px;
		color:white;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#idCheck:hover{
		background-color:lightgray;
		cursor:pointer;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#uploadBtn{
		width:120px;
		background-color:#1B5748;
		border-color:black;
		border:0;
		height:30px;
		color:white;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	
	#uploadBtn:hover{
		background-color:lightgray;
		cursor:pointer;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;
	}

	#emailCheck{
		width:120px;
		background-color:#1B5748;
		border-color:black;
		border:0;
		height:30px;
		color:white;
		background: #FFFFFF;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;
	}
	
	#emailCheck:hover{
		background:lightgray;
		cursor: pointer;
	}
	
	
	#location-btn{
		width:120px;
		background-color:#1B5748;
		border-color:black;
		border:0;
		height:30px;
		color:white;
		border: 1px solid #C4C4C4;
		box-sizing: border-box;
		border-radius: 5px;		
	}
	#location-btn:hover{
		background:lightgray;
		cursor: pointer;
	}

#datepicker{
		width:150px;
		height:25px;
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
</style>
</head>
<body>
<%--  	<jsp:include page="../common/menubar.jsp" />   --%>
	<div id="main">
	
			<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>


	
	<div class="main">
	
	<div id="imglogo" align="center">
	<img src="${contextPath}/resources/images/logo_vertical.PNG" width="350px">
<!-- 		<h2 class="mt-4">회원가입</h2> -->
	</div>

<!-- 	<div id="line"> -->
<!-- 
		<div class="innerLine"></div> -->
		<br>
		
		<form id="joinForm" method="post" action="insert.co" encType="multipart/form-data">
		<div align="center">
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
        	<td class="firstLine"><b>전화번호</b></td>
        	<td class="secondLine">
        	<input type="tel" maxlength="30" name="phone" id="phone">
        	</td>
        	<td class="thirdLine"></td>
        </tr>
        
		<tr class="licenseTriger">
		
            <td class="firstLine"><b>사업자 등록증</b></td>
               		
<!--             <td class="secondLine">
             <div id="licenseImgArea">
             <img id="fake-fileUp" name="upload" width="150" height="200">
             </div>
            </td> -->
               		
            <td class="thirdLine">
             
              <input type="file" id="input-fileUp" name="photo" onchange="loadImg(this, 2);">
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
               <input type="text" id="inputBizNum" maxlength="13" name="bizNum" placeholder="사업자 등록번호를 입력해주세요">
               </td>
               <td class="thirdLine"><label id="nnResult"></label></td>
         </tr>
         
                  <tr class="licenseTriger">
               <td class="firstLine"><b>개업년월일</b></td>
               <td class="secondLine">
               <input type="text" id="datepicker" maxlength="13" name="gaeup" placeholder="">
<!--                 <button onclick="dateSearch();">검색</button>  -->
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
        
                  <tr class="licenseTriger"></tr>
                  <tr class="licenseTriger"></tr>
                  <tr class="licenseTriger"></tr>                          
          <tr class="licenseTriger">
          
               <td class="firstLine"><b>회사/점포주소</b></td>
               <td class="secondLine">
               <input type="text" id="postcode" name="postcode" placeholder="우편번호">
               <input type="text" id="address1" name="bizLocation" placeholder="주소">
               </td>
               
               <td class="thirdLine">
               <input type="button" onclick="sample2_execDaumPostcode()" id="location-btn" value="주소 검색">
               </td>
          </tr>
            
           <tr class="licenseTriger">
               <td class="firstLine"></td>
               <td class="secondLine"><input type="hidden" id="address2" name="address1" placeholder="상세주소"></td>
               <td class="thirdLine"></td>
           </tr>
            
            
            <tr class="hidesub">
				<td></td>
				<td></td>
				<td></td>
			</tr>
		
 		    <tr class="licenseTriger">
<!--                <td class="firstLine" ><b>업종코드</b></td>
               <td class="secondLine"><input type="text" id="address2" name="bizType" placeholder="업종코드"></td>
                <td>  <button type="button" class="thirdLine" data-dismiss="modal">&times;</button>
                <button type="button">하하하..</button>
                </td> -->
                  <div class="modal fade" id="typeofbizModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">업종검색</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          	<table id="typeofbizTable">
          		<thead>
	          		<tr>
	          			<th>업종코드</th>
	          			<th>업종명</th>
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
                
                
           </tr>	
			
			
			
		   <tr class="hidesub">
				<td></td>
				<td></td>
				<td></td>
			</tr>

		</table>
		</div>
		<div style="margin-left:500px; margin-top:80px">
			<button type="reset">작성취소</button>
			<button type="submit">가입하기</button>
		</div>
		</form>
		</div>
		</div>
		
	
	<script>
	/*아이디 비밀번호 비밀번호 확인 이메일 전화번호 사업자 등록증 사업자등록번호 개업년월일 회사명(상호) 대표자명 주민등록번호 회사주소 업종코드 
/* 	"6~12자 영문 소문자, 숫자 입력" */

	$("#userId").keyup(function(){
		var msg ='';
		var regId=/^[a-z][a-z,0-9]{5,11}$/
		var val = this.value;
		
		if(!regId.test($("#userId").val())){
			msg='6-12자 영문 소문자, 숫자를 입력해주세요';
			$("userIdCheck").css("color","red");
		}else{
			msg="중복확인을 해주세요."
			$("#userIdCheck").css("color","green");
		};
		
		$("#userIdCheck").text(msg);
		
	});
	
	//중복 확인하러 고우고우
	$("#idCheck").click(function(){
		var userId = $("#userId").val();
	
		//드디어 에이작스
		$.ajax({
			url: "doubleCheck.co",
			type:"post",
			data:{userId:userId},
			
			success:function(data){
			swal({
				title:data,
				text:"",
				icon:"warning"
			})
			var msg = data;
			},
			error: function(error){
				alert(error);
			}
				
			});
	});
	
	
	
	//비밀번호 제한 
 	
	
				$("#userPwd").keyup(function(){
					var msg = '';
					var pw = $("#userPwd").val(); 
					var num = pw.search(/[0-9]/g); 
					var eng = pw.search(/[a-z]/ig); 
					var spe = pw.search(/[`~!@@#$%^&*|₩₩₩;:₩/?]/gi); 
					
					if(pw.length<6||pw.length>16){ 
						msg = "6자리 ~ 16자리 이내로 입력해주세요."; 
						$("#userPwdCheck").css("color", "red");
					}else if(pw.search(/\s/) != -1){
						msg = "비밀번호는 공백 없이 입력해주세요."; 
						$("#userPwdCheck").css("color", "red");
					}else if(num < 0 || eng < 0 || spe < 0 ){ 
						msg = "영문,숫자, 특수문자를 혼합하여 입력해주세요."; 
						$("#userPwdCheck").css("color", "red");
					}else { 
						msg = "유효한 비밀번호 입니다."; 
						$("#userPwdCheck").css("color", "green");
					}
					$("#userPwdCheck").text(msg);
		
					
				});
				
	 //비밀번호 일치하는지 
	 
	$("#userPwd2").keyup(function(){
		var pw=$("#userPwd").val();
		var pw2=$("#userPwd2").val();
		var msg='';
		
		if(pw==pw2){
			msg="비밀번호가 일치합니다.";
			$("#pwdResult").css("color","green");
		}else{
			msg="비밀번호가 일치하지 않습니다."
			$("#pwdResult").css("color","red");
			
		}
		$("#pwdResult").text(msg);
	});

	
		//달력 
		
		
		
	$.datepicker.setDefaults({
		showOn:"both",
		buttonImageOnly:true,
		buttonImage :"${contextPath}/resources/images/calendar.png",
		dateFormat: 'yy-mm-dd'
	});
	
	$(function(){
		$("#datepicker").datepicker({});
		$("img.ui-datepicker-trigger")
		.attr("style","margin-left:10px; vertical-align:middle; cursor:Pointer; width:22px; height:20px");
	});
	
/* 	function dataSearch(){
		var date1 = $("#datepicker").val();

		$.ajax({
			url:"gaeupSearch.co",
			type:"get",
			data:{
				date1:date1,
			},
			success:function(data){
				
			}
		})
	}; */

	</script>
	
	
	
	
		
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
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address1").value = addr;
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
		
		/*업종*/
		var typeofbizC = "";
		var typeofbizN;
		function aaa(value){
			$(value).parent().parent().children().each(function(index){
				console.log($(this).text());
				typeofbizC += ","+$(this).text();
			})
			var typeofbiz = typeofbizC.split(",");
			typeofbizC = typeofbiz[1];
			typeofbizN = typeofbiz[2];
			
			$("#typeofbizCode").val(typeofbizC);
			$("#typeofbizName").val(typeofbizN);
			
			$("div#typeofbizModal").modal("hide");
			
		}		
		
		//업종 모달
			$("#searchBtn3").click(function(){
				/* $("#venderTable td").remove(); */
				/* var $tbody = $("#venderTable tbody"); */
				$("#typeofbizTable").dataTable({
					destroy: true,
					 ajax:{
							'url':'typeofbizSearch.rp',
							'type':'get'
						},
					 
					 columns: [
						 {data : "bizType",
							 "render": function(data, type, row){
					                if(type=='display'){
					                    data = '<a href="#" onclick="aaa(this);">' + data + '</a>';
					                }
					                return data;}},
						 {data : "bizName",
										 "render": function(data, type, row){
								                if(type=='display'){
								                    data = '<a href="#" onclick="aaa(this);">' + data + '</a>';
								                }
								                return data;}}
						 
					 ]
				});
				 $("div#typeofbizModal").modal();
			});
			
		
		
	</script>

	</main>
</body>
</html>