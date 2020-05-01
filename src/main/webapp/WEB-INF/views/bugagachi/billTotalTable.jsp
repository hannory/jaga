<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가 경리</title>
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <style>
       *{
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        #titleArea{
            width: 50%;
        }
        #middleMenu{
            background-color: #24574A;
            color: white;
            height: 40px;
        }
        #middleMenu>h4{
            padding: 8px;
        }
        .totalSum{
            text-align: center;
            margin-top: 15px;
            margin-bottom:40px;
        }
        .totalSum td{
            border: 1px solid #C9CACE; 
        }
        #green{
            background-color: #D9EAD3;
            font-weight: 700;
        }
        #cho_nav1{
            background-color: #1B5748;
            color: white;
        }   
        .Tex_bill_detailList{
            margin-top: 25px;
            margin-bottom: 25px;
            margin-left: auto;
            margin-right: auto;
            width: 98%;
            text-align: center;
        }
        .Tex_bill_detailList td{
            border: 1px solid #C9CACE; 
        }
        #Tex_bill_th{
            background-color:#E7E6E6;
        }
        #Text_billNo{
            background-color:#E7E6E6;
            height: 25px;
        }
        #loading {
		    width: 100%;  
		    height: 100%;  
		    top: 0px;
		    left: 0px;
		    position: fixed;  
		    display: block;  
		    opacity: 0.7;  
		    background-color: #fff;  
		    z-index: 99;  
		    text-align: center; 
		    display: none;
		 } 
     
   		#loading-image {  
		    position: absolute;  
		    top: 50%;  
		    left: 50%; 
		    z-index: 100;
		 }
        #Tex_bill_code{
            border: 1px solid black;
            height: 100px; 
            margin-left: auto; 
            margin-right: auto; 
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .breadcrumb>li{
        	margin: auto auto;
        }
        /* td{ border: 1px solid red;} */
        .cho_nav{
        	height: 35px;
        	border: 1px solid #C9CACE;
        	border-radius: 5pt;
        	background-color:#8DABA3;
        	color: white;
        }
        .cho_nav>p{
        	margin-left:5px;
        	margin-right: 5px;
        	margin-top:3px;
        }
        .sumTableSales{
        	width: 100%;
        	padding-left:5%;
        }
   		#List_detail td{
   			border:1px solid #D2D2D6;
   		}
   		#List_detail{
   			text-align: center;
   		}
   		/* td{
   			border:1px solid red;
   		} */
   		.cho_sumTableMainTable{
   			width:100%;
   		}
   		.Tex_bill_code_p{
   			font-size:14px;
   		}
   		.tdSalesPur{
	   		width: 8%;
   		}
   		#deadlineCen{
			display: none;
			border:1px solid red; 
			color:red;
		}
		#termDiv{
   			width:80px; 
   			height: 30px;
   		}
   		.cc_year{
   			width:50px;
   			height: 30px;
   		}
   		.cc_month{
   			width:50px; 
   			height: 30px;
   		}
   	
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />

	<main>
	<div class="container-fluid">
	<h2 class="mt-4">계산서 합계표</h2>
	<form action="deadLine.soi" method="post">
	<ol class="breadcrumb mb-4">
			<li><button id="deadlineBtn" type="submit">마감</button></li>
			<li><button id="deadlineCen" onclick="cencelDeadline()">마감 취소</button></li>
			<li><input type="text" readonly  id="termDiv" name="termDiv"></li>
            <li>조회기간:
            	<input type="text" id="search_ye" class="cc_year" name="yearOfAttr" maxlength="4">
            	<select class="cc_month" id="search_mon1">
            		<option value="">월</option>
            		<option value="01">1</option>
            		<option value="07">7</option>
            	</select> 
            	~
            	<select class="cc_month" id="search_mon2">
            		<option value="">월</option>
            		<option value="06">6</option>
            		<option value="12">12</option>
            	</select> 
            </li>
			<li><input type="button" onclick="search_cis()" value="조회"></li>
			<li><input type="button" name="report" value="신고서미리보기" onclick="print()"></li>	
		</ol>
		
		<!-- 로딩? -->
   <div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
    

		<!-- 인풋모음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1 -->
	<c:set var="comCode" value="${ sessionScope.loginCompany.companyCode }"/>
   	<input type="hidden" value="${comCode}" name="comCode">
   	<input type="hidden" name="taxinvCode" id="taxinvCode">
   	
   	
   	
     <script>
        $(function(){
          $("#purchase").css("display","none");
          
            $(".cho_nav").click(function(){
            	$(".cho_nav").css("background","#8DABA3")
            	$(this).css("background","#1B5748");
            	$(this).css("color","white");
            });

        	$("#showsumTable_purchase").css("border-bottom","5px solid #1B5748 ");

        	$("#showsumTable_sales").css("border-bottom","5px solid #1B5748 ");
        });
    </script>
    
    <!-- ajax영역!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <script type="text/javascript">
		function cencelDeadline(){
			$("form").attr("action", "updatdDeadLineCen.soti");
		}
		/* 조회버튼 */
	    function search_cis(){
	    	 $("#loading").show();
	    	 
	    	var search_ye= $("#search_ye").val();
	 		var search_mon1= $("#search_mon1").val();
	 		var search_mon2= $("#search_mon2").val();
	 		var comCode=${comCode}
	 		console.log(search_ye);
	 		console.log(search_mon1);
	 		console.log(search_mon2);
	 		console.log(comCode);
	    	
	 		$.ajax({
	 			url:"billTotal.soi",
	 			type:"post",
	 			data:{search_ye:search_ye,search_mon1:search_mon1,search_mon2:search_mon2,comCode:comCode},
	 			success: function (data){
	 				 $("#loading").hide();
	 				var sDto=data.sDto;
	 				var sDtoDivSales=data.sDto.sumOfTaxInvDivSales;
	 				var sDtoDetailSales=data.sDto.sumTaxInvDetailSales;
	 				
	 				$("#termDiv").val(sDto.reportTerm);
	 				$("#taxinvCode").val(sDto.taxinvCode);
	 				
	 				console.log(data.sDto);
	 				console.log("상세: "+sDtoDetailSales[0].tax);
	 				console.log(sDto.deadline);
	 				
	 				
	 				/* 구분영역 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!111 */
	 				//소계랑 합계변수 선언//
	 				var tSAvc=0; //전체 매출(입) 처수
	 				var tSAdc=0;//전체매수
	 				var tSAvol=0;//전체공급차액
	 				var ssAvc=0;//11일 이전 매출(입) 처수 소계
	 				var ssAdc=0;//11일 이전 매수소계
	 				var ssAvol=0;//11일 이전 공급가액 소계
	 				var OssAvc=0;//12일 이후 매출(입) 처수 소계
	 				var OssAdc=0;//12일 이후 매수소계
	 				var OssAvol=0;//12일 이후 공급가액 소계
	 				for(var key in sDtoDivSales){
                        /* 11일 이전 세금계산서 사업자번호*/
                       	console.log("구분: "+sDtoDivSales[key].divisionCode)
	 					if(sDtoDivSales[key].divisionCode=="11"){
	 						$("#bAvc").text(sDtoDivSales[key].acctCodeCt);
	 						$("#bAdc").text(sDtoDivSales[key].dealCount);
	 						$("#bAvol").text(sDtoDivSales[key].valOfSupply);
	 					}else if(sDtoDivSales[key].divisionCode=="12"){/* 11일 이전 세금계산서 주민번호*/
	 						$("#pAvc").text(sDtoDivSales[key].acctCodeCt);
	 						$("#pAdc").text(sDtoDivSales[key].dealCount);
	 						$("#pAvol").text(sDtoDivSales[key].valOfSupply);
	 					}else if(sDtoDivSales[key].divisionCode=="13"){/* 11일 이전 세금계산서 소계*/
	 						$("#ssAvc").text(sDtoDivSales[key].acctCodeCt);
	 						$("#ssAdc").text(sDtoDivSales[key].dealCount);
	 						$("#ssAvol").text(sDtoDivSales[key].valOfSupply);
	 						ssAvc=sDtoDivSales[key].acctCodeCt;
	 						ssAdc=sDtoDivSales[key].dealCount;
	 						ssAvol=sDtoDivSales[key].valOfSupply;
	 					}else if(sDtoDivSales[key].divisionCode=="21"){/* 12일 이후 세금계산서 사업자번호*/
	 						$("#ObAvc").text(sDtoDivSales[key].acctCodeCt);
	 						$("#ObAdc").text(sDtoDivSales[key].dealCount);
	 						$("#ObAvol").text(sDtoDivSales[key].valOfSupply);
	 					}else if(sDtoDivSales[key].divisionCode=="22"){/* 12일 이후 세금계산서 주민번호*/
	 						$("#OpAvc").text(sDtoDivSales[key].acctCodeCt);
	 						$("#OpAdc").text(sDtoDivSales[key].dealCount);
	 						$("#OpAvol").text(sDtoDivSales[key].valOfSupply);
	 					}else if(sDtoDivSales[key].divisionCode=="23"){/* 12일 이후 세금계산서 소계*/
	 						$("#OssAvc").text(sDtoDivSales[key].acctCodeCt);
	 						$("#OssAdc").text(sDtoDivSales[key].dealCount);
	 						$("#OssAvol").text(sDtoDivSales[key].valOfSupply);
	 						OssAvc=sDtoDivSales[key].acctCodeCt;
	 						OssAdc=sDtoDivSales[key].dealCount;
	 						OssAvol=sDtoDivSales[key].valOfSupply;
	 					}
	 				}
	 				 tSAvc=ssAvc+OssAvc;
		 			 tSAdc=ssAdc+OssAdc;
		 			 tSAvol=ssAvol+OssAvol;
		 		     $("#sAvc").text(tSAvc);
		 		     $("#sAdc").text(tSAdc);
		 		     $("#sAvol").text(tSAvol);
		 		    /* 구분영역 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!111 */
		 		    
		 		    /* 상세리스트 영역 */
		 		    var $Tex_bill_detailList=$("#Tex_bill_detailList2");
		 		    var $Tex_bill_detailList3=$("#Tex_bill_detailList3");
		 		    var dealCount=0;
		 		    var volCount=0;
		 		    var index=0;
		 		    
		 		    /* 매출_12일 이후 */
		 		    for(var key in sDtoDetailSales ){
		 		    	index++;
		 		    	var $tr= $("<tr onclick='PopModalTexList()'>");
		 		    	var $noTd = $(" <td id='Text_billNo'>").text(index);
						var $bizRegNumTd = $("<td>").text(sDtoDetailSales[key].bizRerNum);
						var $venderTd = $("<td>").text(sDtoDetailSales[key].venderCode);
						var $venderNameTd = $("<td>").text(sDtoDetailSales[key].venderName);
						var $dealCountTd = $("<td>").text(sDtoDetailSales[key].deal_count);
						var $valOfSupplyTd = $("<td>").text(sDtoDetailSales[key].valOfSupply);
						var $bossNameTd = $("<td>").text(sDtoDetailSales[key].bossName);
						var $sellWayTd = $("<td>").text(sDtoDetailSales[key].sellWay);
						var $sellTargetTd = $("<td>").text(sDtoDetailSales[key].sellTarget);
						
						
						dealCount=dealCount+sDtoDetailSales[key].deal_count;
						volCount=volCount+sDtoDetailSales[key].valOfSupply;
						
						
						$tr.append($noTd);
						$tr.append($bizRegNumTd);
						$tr.append($venderTd);
						$tr.append($venderNameTd);
						$tr.append($dealCountTd);
						$tr.append($valOfSupplyTd);
						$tr.append($bossNameTd);
						$tr.append($sellWayTd);
						$tr.append($sellTargetTd);
						
						
						$Tex_bill_detailList.append($tr);
		 		    }
		 		    
		 		    /* 매출_전체 데이터 */
		 		    var dealCount3=0;
		 		    var volCount3=0;
		 		    var index3=0
		 		   for(var key in sDtoDetailSales ){
		 		    	index3++;
		 		    	var $tr= $("<tr onclick='PopModalTexList()'>");
		 		    	var $noTd = $(" <td id='Text_billNo'>").text(index3);
						var $bizRegNumTd = $("<td>").text(sDtoDetailSales[key].bizRerNum);
						var $venderTd = $("<td>").text(sDtoDetailSales[key].venderCode);
						var $venderNameTd = $("<td>").text(sDtoDetailSales[key].venderName);
						var $dealCountTd = $("<td>").text(sDtoDetailSales[key].deal_count);
						var $valOfSupplyTd = $("<td>").text(sDtoDetailSales[key].valOfSupply);
						var $bossNameTd = $("<td>").text(sDtoDetailSales[key].bossName);
						var $sellWayTd = $("<td>").text(sDtoDetailSales[key].sellWay);
						var $sellTargetTd = $("<td>").text(sDtoDetailSales[key].sellTarget);
						
						
						dealCount3=dealCount3+sDtoDetailSales[key].deal_count;
						volCount3=volCount3+sDtoDetailSales[key].valOfSupply;
						
						
						$tr.append($noTd);
						$tr.append($bizRegNumTd);
						$tr.append($venderTd);
						$tr.append($venderNameTd);
						$tr.append($dealCountTd);
						$tr.append($valOfSupplyTd);
						$tr.append($bossNameTd);
						$tr.append($sellWayTd);
						$tr.append($sellTargetTd);
						
						
						$Tex_bill_detailList3.append($tr);
		 		    }
		 		    console.log("dealCount: "+dealCount);
		 		    console.log("volCount: "+volCount);
		 		   
		 		   /* 합계 */
		 		   //12일
		 		   $Tex_bill_detailList3.append("<tr id='Tex_bill_th' style=;font-weight: 600;'><td id='Text_billNo' style='height: 50px;'> </td><td colspan='3'> 합   계 </td><td id='dealCount1'> </td><td id='volCount1'> <td> </td><td> </td><td> </td></tr>");
		 		   //전체
		 		   $Tex_bill_detailList.append("<tr id='Tex_bill_th' style=;font-weight: 600;'><td id='Text_billNo' style='height: 50px;'> </td><td colspan='3'> 합   계 </td><td id='dealCount2'> </td><td id='volCount2'> <td> </td><td> </td><td> </td></tr>");
		 		   
		 		  
		 		 
		 		 //12일
		 		   $("#dealCount1").text(dealCount);
		 		   $("#volCount1").text(volCount);
		 		   //전체
		 		   $("#dealCount2").text(dealCount3);
		 		   $("#volCount2").text(volCount3);
		 		    
	 			
	 				
	 				
	 				
	 				
	 				
	 				
	 				
	 				
	 				
	 				
	 			/* 매입역역!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */
	 			
	 			var sDtoDivPur=data.sDto.sumOfTaxInvDivPur;
	 			var sDtoDetailPur=data.sDto.sumTaxInvDetailPur;
	 			
	 			/* 매입 구분표 */
	 			var ptSAvc=0; //전체 매출(입) 처수
 				var ptSAdc=0;//전체매수
 				var ptSAvol=0;//전체공급차액
 				var pssAvc=0;//11일 이전 매출(입) 처수 소계
 				var pssAdc=0;//11일 이전 매수소계
 				var pssAvol=0;//11일 이전 공급가액 소계
 				var pOssAvc=0;//12일 이후 매출(입) 처수 소계
 				var pOssAdc=0;//12일 이후 매수소계
 				var pOssAvol=0;//12일 이후 공급가액 소계
 				
 				for(var key in sDtoDivPur){
                    /* 11일 이전 세금계산서 사업자번호*/
 					if(sDtoDivPur[key].divisionCode=="11"){
 						$("#pbAvc").text(sDtoDivPur[key].acctCodeCt);
 						$("#pbAdc").text(sDtoDivPur[key].dealCount);
 						$("#pbAvol").text(sDtoDivPur[key].valOfSupply);
 					
 					}else if(sDtoDivPur[key].divisionCode=="21"){/* 12일 이후 세금계산서 사업자번호*/
 						$("#pObAvc").text(sDtoDivPur[key].acctCodeCt);
 						$("#pObAdc").text(sDtoDivPur[key].dealCount);
 						$("#pObAvol").text(sDtoDivPur[key].valOfSupply);
 					}
 				}
 				 ptSAvc=ssAvc+OssAvc;
	 			 ptSAdc=ssAdc+OssAdc;
	 			 ptSAvol=ssAvol+OssAvol;
	 		     $("#psAvc").text(ptSAvc);
	 		     $("#psAdc").text(ptSAdc);
	 		     $("#psAvol").text(ptSAvol);
	 			/* 매입 구분표 부분 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1 */
	 			
	 			
	 			/* 매입 상세 리스트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11 */
	 			var $Tex_bill_detailListPur2=$("#Tex_bill_detailList_pur2");
	 			var $Tex_bill_detailListPur3=$("#Tex_bill_detailList_pur3");
	 				var dealCountPur11=0;
		 		    var volCountPur11=0;
		 		    var taxCountPur11=0;
		 		    var indexPur11=0
	 		    for(var key in sDtoDetailPur ){
	 		    	indexPur11++;
	 		    	var $tr= $("<tr onclick='PopModalTexList()'>");
	 		    	var $noTd = $(" <td id='Text_billNo'>").text(index3);
					var $bizRegNumTd = $("<td>").text(sDtoDetailPur[key].bizRerNum);
					var $venderTd = $("<td>").text(sDtoDetailPur[key].venderCode);
					var $venderNameTd = $("<td>").text(sDtoDetailPur[key].venderName);
					var $dealCountTd = $("<td>").text(sDtoDetailPur[key].deal_count);
					var $valOfSupplyTd = $("<td>").text(sDtoDetailPur[key].valOfSupply);
					var $taxTd = $("<td>").text(sDtoDetailPur[key].tax);
					var $bossNameTd = $("<td>").text(sDtoDetailPur[key].bossName);
					var $sellWayTd = $("<td>").text(sDtoDetailPur[key].sellWay);
					var $sellTargetTd = $("<td>").text(sDtoDetailPur[key].sellTarget);
					
					
					dealCountPur11=dealCountPur11+sDtoDetailPur[key].deal_count;
					volCountPur11=volCountPur11+sDtoDetailPur[key].valOfSupply;
					taxCountPur11=taxCountPur11+sDtoDetailPur[key].tax;
					
					
					$tr.append($noTd);
					$tr.append($bizRegNumTd);
					$tr.append($venderTd);
					$tr.append($venderNameTd);
					$tr.append($dealCountTd);
					$tr.append($valOfSupplyTd);
					$tr.append($taxTd);
					$tr.append($bossNameTd);
					$tr.append($sellWayTd);
					$tr.append($sellTargetTd);
					
					
					$Tex_bill_detailListPur2.append($tr);
	 		    }
		 		    
		 		   $Tex_bill_detailListPur2.append("<tr id='Tex_bill_th' style=;font-weight: 600;'><td id='Text_billNo' style='height: 50px;'> </td><td colspan='3'> 합   계 </td><td id='dealCountPur1'> </td><td id='volCountPur1'> </td><td id='taxCountPur1'> </td><td> </td><td> </td><td> </td></tr>");
	 			
		 		   
		 		   
		 		   $("#dealCountPur1").text(dealCountPur11);
		 		   $("#volCountPur1").text(volCountPur11);
		 		   $("#taxCountPur1").text(taxCountPur11);
	 			
		 		   /* 전체데이터 테이블 */
		 		  var dealCountPur3=0;
		 		    var volCountPur3=0;
		 		    var taxCountPur3=0;
		 		    var indexPur3=0
	 		    for(var key in sDtoDetailPur ){
	 		    	indexPur3++;
	 		    	var $tr= $("<tr onclick='PopModalTexList()'>");
	 		    	var $noTd = $(" <td id='Text_billNo'>").text(index3);
					var $bizRegNumTd = $("<td>").text(sDtoDetailPur[key].bizRerNum);
					console.log("사업자번호: "+sDtoDetailPur[key].bizRegNum)
					var $venderTd = $("<td>").text(sDtoDetailPur[key].venderCode);
					var $venderNameTd = $("<td>").text(sDtoDetailPur[key].venderName);
					var $dealCountTd = $("<td>").text(sDtoDetailPur[key].deal_count);
					console.log("거래건수: "+sDtoDetailPur[key].dealCount)
					var $valOfSupplyTd = $("<td>").text(sDtoDetailPur[key].valOfSupply);
					var $taxTd = $("<td>").text(sDtoDetailPur[key].tax);
					var $bossNameTd = $("<td>").text(sDtoDetailPur[key].bossName);
					var $sellWayTd = $("<td>").text(sDtoDetailPur[key].sellWay);
					var $sellTargetTd = $("<td>").text(sDtoDetailPur[key].sellTarget);
					
					
					dealCountPur3=dealCountPur3+sDtoDetailPur[key].deal_count;
					volCountPur3=volCountPur3+sDtoDetailPur[key].valOfSupply;
					taxCountPur3=taxCountPur3+sDtoDetailPur[key].tax;
					
					
					$tr.append($noTd);
					$tr.append($bizRegNumTd);
					$tr.append($venderTd);
					$tr.append($venderNameTd);
					$tr.append($dealCountTd);
					$tr.append($valOfSupplyTd);
					$tr.append($taxTd);
					$tr.append($bossNameTd);
					$tr.append($sellWayTd);
					$tr.append($sellTargetTd);
					
					
					$Tex_bill_detailListPur3.append($tr);
	 		    }
		 		    
		 		   $Tex_bill_detailListPur3.append("<tr id='Tex_bill_th' style=;font-weight: 600;'><td id='Text_billNo' style='height: 50px;'> </td><td colspan='3'> 합   계 </td><td id='dealCountPur3'> </td><td id='volCountPur3'> </td><td id='taxCountPur3'> </td><td> </td><td> </td><td> </td></tr>");
	 			
		 		   $("#dealCountPur3").text(dealCountPur3);
		 		   $("#volCountPur3").text(volCountPur3);
		 		   $("#taxCountPur3").text(taxCountPur3);
	 			
	 			
		 		  if(sDto.deadline == 'Y'){
						console.log("마감된 애임")
						$("#deadlineCen").show();
						$("#deadlineBtn").hide();
					} 
	 			
	 			
	 			
	 			/* 매입 상세 리스트  끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11 */
	 			},
	 			error:function(error){
	 				console.log(error);
	 			}
	 			
	 		});
	    	
	    	
	    	   
	    }
			
		
		
	</script>
	<!-- ajax영역 끝!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	
	
	<!-- 상세표 영역 -->
	<script>
        $(function(){
          $("#purchase").css("display","none");
          $("#cho_div2").css("display","none");
          $("#cho_div3").css("display","none");
          $("#cho_div5").css("display","none");
          $("#cho_div6").css("display","none");
          
            $(".cho_nav").click(function(){
            	$(".cho_nav").css("background","#8DABA3")
            	$(this).css("background","#1B5748");
            	$(this).css("color","white");
            });
            $("#showsumTable_purchase").css("border-bottom","5px solid #1B5748 ");

        	$("#showsumTable_sales").css("border-bottom","5px solid #1B5748 ");
        });
    </script>
	
	<!-- 상세표 영역 끝!!!!!!!!!!-->
	
	
	
	
	
	
	<script type="text/javascript">
	function showsumTable_purchase(){
    	$("#sales").hide();
    	$("#purchase").show();
    };
    function showsumTable_sales(){
    	$("#sales").show();
    	$("#purchase").hide();
    }
	
	</script>
	<div id="sales">
    <table class="cho_sumTableMainTable" align="center">
        
        <tr>
            <td class="tdSalesPur"><div class="sumTableSales" onclick="showsumTable_sales()" id="showsumTable_sales"><h4>매출</h4></div></td>            
            <td class="tdSalesPur"><div class="sumTableSales" onclick="showsumTable_purchase()" ><h4>매입</h4></div></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
       
        <tr>
            <td colspan="10">
                <div id="middleMenu">
                    <h4>2.매출계산서 총합계</h4>
                </div>
            </td>
        </tr>
        <!-- 매출세금계산서 총합계 표 -->
        <tr>
            <td colspan="10">
                <table align="center" class="totalSum" style="width: 99%;">
                    <tr style="background-color: #E7E6E6;font-weight: 700;">
                        <td colspan="2" style="width: 45%;">구  분</td>
                        <td style="width: 15%;">매출처수</td>
                        <td style="width: 10%;">매   수</td>
                        <td style="width: 15%;">공급가액</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 45%;" id="green">합  계</td>
                        <td style="width: 15%;" id="sAvc"> </td>
                        <td style="width: 10%;" id="sAdc"> </td>
                        <td style="width: 15%;" id="sAvol"> </td>
                    </tr>
                    <tr>
                        <td rowspan="3" style="width: 25%;" id="green">과세기간 종료일 다음달<br>11일 까지 전송된<br>
                        전자세금계산서 발급분</td>
                        <td style="width: 25%;" id="green">사업자 번호 발급분</td>
                        <td style="width: 15%;" id="bAvc"> </td>
                        <td style="width: 10%;" id="bAdc"> </td>
                        <td style="width: 15%;" id="bAvol"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">주민등록 번호 발급분</td>
                        <td style="width: 15%;" id="pAvc"> </td>
                        <td style="width: 10%;" id="pAdc"> </td>
                        <td style="width: 15%;" id="pAvol"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">소계</td>
                        <td style="width: 15%;" id="ssAvc"> </td>
                        <td style="width: 10%;" id="ssAdc"> </td>
                        <td style="width: 15%;" id="ssAvol"> </td>

                    </tr>

                    <tr>
                        <td rowspan="3" style="width: 25%;" id="green">위 전자세금계산서 외의<br>발급분(종이발급분+과세기간<br>
                        종료일 다움달 12일 이후분)</td>
                        <td style="width: 25%;" id="green">사업자 번호 발급분</td>
                        <td style="width: 15%;" id="ObAvc"> </td>
                        <td style="width: 10%;" id="ObAdc"> </td>
                        <td style="width: 15%;" id="ObAvol"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">주민등록 번호 발급분</td>
                        <td style="width: 15%;" id="OpAvc"> </td>
                        <td style="width: 10%;" id="OpAdc"> </td>
                        <td style="width: 15%;" id="OpAvol"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">소계</td>
                        <td style="width: 15%;" id="OssAvc"> </td>
                        <td style="width: 10%;" id="OssAdc"> </td>
                        <td style="width: 15%;" id="OssAvol"> </td>

                    </tr>
                </table>
            </td>
            
        </tr>
        <!-- 매출세금계산서 총합계 표 끝 -->
         <!-- 매출세금계산서 총합계 표 끝 -->
        
        <script>
        function change_div1(){        	
        	$("#cho_div1").show();
        	$("#cho_div2").hide();
        	$("#cho_div3").hide();
        }
        function change_div2(){        	
        	$("#cho_div2").show();
        	$("#cho_div1").hide();
        	$("#cho_div3").hide();
        }
        function change_div3(){        	
        	$("#cho_div3").show();
        	$("#cho_div2").hide();
        	$("#cho_div1").hide();
        }
        function change_div4(){
        	$("#cho_div4").show();
        	$("#cho_div5").hide();
        	$("#cho_div6").hide();
        }
        function change_div5(){       
        	$("#cho_div5").show();
        	$("#cho_div4").hide();
        	$("#cho_div6").hide();
        }
        function change_div6(){       
        	$("#cho_div6").show();
        	$("#cho_div5").hide();
        	$("#cho_div4").hide();
        }
        </script>
        <tr>
            <td colspan="10">
                <div>
                    <ul class="nav nav-pills">
                       <li class="click_li"><div class="cho_nav" onclick="change_div1();" id="cho_nav1"><p>과세기간 종료일 다음달 11일까지(전자분)</p></div></li>
                       <li class="click_li"><div class="cho_nav" onclick="change_div2();" id="cho_nav2"><p>과세기간 종료일 다음달 12일이후 (전자분분) ,그외</p></div></li>
                       <li class="click_li"><div class="cho_nav" onclick="change_div3();" id="cho_nav3"><p>전체데이터</p></div></li>
                         
                        
                    </ul>
                </div>
            </td>
        </tr>
        <!-- 상세리스트 -->
        <tr>
            <td colspan="10">
                <div id="cho_div1">
                   <table class="Tex_bill_detailList" id="Tex_bill_detailList">
                        <tr id="Tex_bill_th" style="font-weight: 800;">
                            <td id="Text_billNo">no</td>
                            <td>사업자등록번호</td>
                            <td>거래처명</td>
                            <td>매수</td>
                            <td>공급가액</td>
                            <td>대표자성명</td>
                            <td>업   태</td>
                            <td>종   목</td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                          
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        <tr id="Tex_bill_th" style="font-weight: 600;">
                            <td id="Text_billNo" style="height: 50px;"> </td>
                            <td colspan="2"> 합   계 </td>
                            <!-- <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                    </table>
                </div>
                 <div id="cho_div2">
                    <table class="Tex_bill_detailList" id="Tex_bill_detailList2">
                        <tr id="Tex_bill_th" style="font-weight: 800;">
                            <td id="Text_billNo">no</td>
                            <td>사업자등록번호</td>
                            <td>거래처명</td>
                            <td>매수</td>
                            <td>공급가액</td>
                            <td>대표자성명</td>
                            <td>업   태</td>
                            <td>종   목</td>
                        </tr>
                    </table>
                </div>
                  <div id="cho_div3">
                    <table class="Tex_bill_detailList" id="Tex_bill_detailList3">
                        <tr id="Tex_bill_th" style="font-weight: 800;">
                            <td id="Text_billNo">no</td>
                            <td>사업자등록번호</td>
                            <td>거래처명</td>
                            <td>매수</td>
                            <td>공급가액</td>
                            <td>대표자성명</td>
                            <td>업   태</td>
                            <td>종   목</td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <!-- 상세리스트끝 -->
        <tr>
            <td colspan="9">
            <!-- 코드영역 -->
                <div id="Tex_bill_code">
                    <p class="Tex_bill_code_p">[확인]전성일자가 없는 거래는 전자세금계산서 발급분으로 반영 되므로 국세청 e세로 전송 세금계산서와 반드시 확인합니다.</p>
                </div>
            </td>
        </tr>
        
    </table>
    </div>
    <!-- 매출영역 끝 -->
    <script>
      function PopModalTexList(){
    	  console.log("모달확인");
    	  $("div#detailList_detail").modal();
      }

    </script>

    <!-- 모달 시작-->
      <!-- 세부거래내역 -->
  <div class="modal fade" id="detailList_detail" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1B5748">
          <h4 class="modal-title" style="color:white;">전표조회</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        <table style="margin-left:auto; margin-right: auto;">
        	<tr>
        		<td ><p>거래처코드</p></td>
        		<td><input style="width:100px;" type="text" readonly></td>
        		<td><p>거래처명</p></td>
        		<td><input style="width:150px;" name="companyName" type="text" readonly></td>
        		<td><input style="width:150px;" name="personName" type="text" readonly></td>
        		<td><input style="width:150px;" name="companyCode" type="text" readonly></td>
        	</tr>
        </table>
        <div>
        	<table id="List_detail" style=" width:100%; margin-left:auto; margin-right: auto;">
        		<tr class="modal_detailList" style="background-color:#E7E6E6;">
        			<td>월/일</td>
        			<td>유형</td>
        			<td>품목</td>
        			<td>수량</td>
        			<td>단가</td>
        			<td>매수</td>
        			<td>공급가액</td>
        			<td>분개</td>
        			<td>예정누락분</td>
        			<td>전자여부</td>
        		</tr>
        		<tr class="modal_detail" style="height: 25px;">
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        		</tr>
        		<tr class="modal_detailList" style="background-color:#E7E6E6;">
        			<td colspan="3">합계</td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        		</tr>
        	</table>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" value="인쇄">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 모달 끝-->
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 매입영역 -->
	<div id="purchase">
	<table class="cho_sumTableMainTable" align="center">
        
        <tr>
            <td class="tdSalesPur"><div class="sumTableSales" onclick="showsumTable_sales()" ><h4>매출</h4></div></td>            
            <td class="tdSalesPur"><div class="sumTableSales" onclick="showsumTable_purchase()" id="showsumTable_purchase"><h4>매입</h4></div></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        
        <tr>
            <td colspan="10">
                <div id="middleMenu">
                    <h4>2.매입계산서 총합계</h4>
                </div>
            </td>
        </tr>
        <!-- 매입세금계산서 총합계 표 -->
        <tr>
            <td colspan="10">
                <table align="center" class="totalSum" style="width: 99%;">
                    <tr style="background-color: #E7E6E6;font-weight: 700;">
                        <td colspan="2" style="width: 45%;">구  분</td>
                        <td style="width: 15%;">매출처수</td>
                        <td style="width: 10%;">매   수</td>
                        <td style="width: 15%;">공급가액</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 45%;" id="green">합  계</td>
                        <td style="width: 15%;" id="psAvc"> </td>
                        <td style="width: 10%;" id="psAdc"> </td>
                        <td style="width: 15%;" id="psAvol"> </td>
                    </tr>
                    <tr style="height: 75px;">
                        <td style="width: 25%;" id="green">과세기간 종료일 다음달<br>11일 까지 전송된<br>
                        전자세금계산서 발급분</td>
                        <td style="width: 25%;" id="green">사업자 번호 발급분</td>
                        <td style="width: 15%;" id="pbAvc"> </td>
                        <td style="width: 10%;" id="pbAdc"> </td>
                        <td style="width: 15%;" id="pbAvol"> </td>

                    </tr>

                    <tr style="height: 75px;">
                        <td style="width: 25%;" id="green">위 전자세금계산서 외의<br>발급분(종이발급분+과세기간<br>
                        종료일 다움달 12일 이후분)</td>
                        <td style="width: 25%;" id="green">사업자 번호 발급분</td>
                        <td style="width: 15%;" id="pObAvc"> </td>
                        <td style="width: 10%;" id="pObAdc"> </td>
                        <td style="width: 15%;" id="pObAvol"> </td>

                    </tr>
               
                </table>

            </td>
            
        </tr>
        <!-- 매출세금계산서 총합계 표 끝 -->
        <tr>
            <td colspan="10">
                <div>
                    <ul class="nav nav-pills">
                        <li class="click_li" clicked><div class="cho_nav" id="cho_nav4" onclick="change_div4();"><p>과세기간 종료일 다음달 11일까지(전자분)</p></div></li>
                        <li class="click_li"><div class="cho_nav" id="cho_nav5" onclick="change_div5();"><p>과세기간 종료일 다음달 12일이후 (전자분분) ,그외</p></div></li>
                        <li class="click_li"><div class="cho_nav" id="cho_nav6" onclick="change_div6();"><p>전체데이터</p></div></li>
                        
                    </ul>
                </div>
            </td>
        </tr>
        <!-- 상세리스트 -->
        <tr>
            <td colspan="10">
               <div id="cho_div4">
                    <table class="Tex_bill_detailList" id="Tex_bill_detailList_pur1">
                        <tr id="Tex_bill_th" style="font-weight: 800;">
                            <td id="Text_billNo">no</td>
                            <td>사업자등록번호</td>
                            <td>거래처명</td>
                            <td>매수</td>
                            <td>공급가액</td>
                            <td>대표자성명</td>
                            <td>업   태</td>
                            <td>종   목</td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                       
                        <tr id="Tex_bill_th" style="font-weight: 600;">
                            <td id="Text_billNo" style="height: 50px;"> </td>
                            <td colspan="2"> 합   계 </td>
                            <!-- <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                        
                    </table>
                </div>
                 <div id="cho_div5">
                    <table class="Tex_bill_detailList" id="Tex_bill_detailList_pur2">
                        <tr id="Tex_bill_th" style="font-weight: 800;">
                            <td id="Text_billNo">no</td>
                            <td>사업자등록번호</td>
                            <td>거래처명</td>
                            <td>매수</td>
                            <td>공급가액</td>
                            <td>대표자성명</td>
                            <td>업   태</td>
                            <td>종   목</td>
                        </tr>
                    </table>
                </div>
                <div id="cho_div6">
                     <table class="Tex_bill_detailList" id="Tex_bill_detailList_pur3">
                        <tr id="Tex_bill_th" style="font-weight: 800;">
                            <td id="Text_billNo">no</td>
                            <td>사업자등록번호</td>
                            <td>거래처명</td>
                            <td>매수</td>
                            <td>공급가액</td>
                            <td>대표자성명</td>
                            <td>업   태</td>
                            <td>종   목</td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <!-- 상세리스트끝 -->
        <tr>
            <td colspan="9">
            <!-- 코드영역 -->
                 <div id="Tex_bill_code">
                    <p class="Tex_bill_code_p">[확인]전성일자가 없는 거래는 전자세금계산서 발급분으로 반영 되므로 국세청 e세로 전송 세금계산서와 반드시 확인합니다.</p>
                </div>
            </td>
        </tr>
        
    </table>
	</div>
	<!-- 매입영역끝 -->
	<script>
	/* 날짜 input jquery ui */
		$.datepicker.setDefaults({
			showOn : "both",
			buttonImageOnly : true,
			buttonImage : "${contextPath}/resources/images/calendar.png",
			dateFormat : 'yy-mm-dd'

		});
		$(function() {
			$(".datepicker").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");

		});
	 </script>
	</main>
	<jsp:include page="../common/menubar2.jsp" />

</body>
</html>