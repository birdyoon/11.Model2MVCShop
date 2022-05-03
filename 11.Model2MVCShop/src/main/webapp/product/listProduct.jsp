<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
<%@ page import="java.util.List"  %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.view.product.*" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	Search search=(Search)request.getAttribute("search");
	String menu = (String)request.getAttribute("menu");
	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%>	
--%>


<html>
<head>

<title>��ǰ �����ȸ</title>

<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
 

<script type="text/javascript">
//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�
<!--
function fncGetList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
	   	document.detailForm.submit();	
}
-->

function fncGetList(currentPage) {
	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?&menu=${menu }").submit();
}

$(function() {
		$( "button.btn.btn-default" ).on("click" , function() {
		fncGetList(1);
	});
	

	if( ${menu.equals("search")} ) {
		
		
	$(  "td.prodname" ).on("click" , function() {
		
		console.log($(this).find("[name='prodNo']").val());
		console.log($(this).find("[name='menu']").val());

	//	var prodNo = $(this).find("[name='prodNo']").val()+"&menu="+$(this).find("[name='menu']").val();
		var prodNo = $(this).find("[name='prodNo']").val();
		console.log(prodNo);
		
		$.ajax(
				{
					url : "/product/json/getProduct/"+prodNo ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
			
					//Debug...
					//alert('����');
					//Debug...
					//alert("JSONData : \n"+JSONData);
					
					var displayValue = "<h3>"
												+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
												+"�� ǰ �� : "+JSONData.prodName+"<br/>"
												+"��ǰ�̹���  : "+JSONData.fileName+"<br/>"
												+"��ǰ������  : "+JSONData.prodDetail+"<br/>"
												+"�������� : "+JSONData.manuDate+"<br/>"
												+"���� : "+JSONData.price+"<br/>"
												+"</h3>";
					//Debug...						 			
				//	alert(displayValue);
					$("h3").remove();
					$( "#"+prodNo+"" ).html(displayValue);	
				}
			});
	
	});
	}
	if(${menu.equals("manage")} ) {
		$(  "td.prodname" ).on("click" , function() {
			console.log($(this).find("[name='prodNo']").val());
			console.log($(this).find("[name='menu']").val());
			
			var prodNo = $(this).find("[name='prodNo']").val();
			var menu = $(this).find("[name='menu']").val();
			location.href = "/product/getProduct?prodNo="+prodNo+"&menu="+menu;
		//	location.href = "/product/updateProductView.jsp?prodNo="+prodNo+"&menu="+menu;
	
		});
	}
	
	/*
	else if( ${menu.equals("manage")} ) {
		$(  "td.prodname" ).on("click" , function() {
			self.location = "/product/updateProductView.jsp";
			
		});
	}
	*/
	
	
	
		$( "td.prodname" ).css("color" , "blue");
		$("h7").css("color" , "blue");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	
	});


</script>

</head>

<body >

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
		<div class="page-header text-info">
					<c:choose>
						<c:when test= "${menu.equals('manage') }" >
							<h3>	��ǰ ���� </h3>
						</c:when>
			 		
			 			<c:when test= "${menu.equals('search') }">
			 				<h3> 	��ǰ �����ȸ </h3>
			 			</c:when>
			 								 	
					 </c:choose>
		</div>
		
		
<!-- <div style="width:98%; margin-left:10px;"> -->

<!--  <form name="detailForm" action="/listProduct.do?&menu=${menu }" method="post"> -->
<!-- <form name="detailForm" action="/product/listProduct?&menu=${menu }" method="post">  -->
	<!-- 	<form name="detailForm"> -->
		
<!--  		
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<%-- 
					<% if(menu.equals("manage")){	%>
									��ǰ ����						
					<% } else {%>	
								��ǰ �����ȸ 	
					<% } %>
					--%>
			<%--		<c:set var="name" value="manage"/>  --%>
					<c:choose>
					
						<c:when test= "${menu.equals('manage') }" >
								��ǰ ���� 
						</c:when>
			 		
			 			<c:when test= "${menu.equals('search') }">
			 					��ǰ �����ȸ
			 			</c:when>
			 								 	
					 </c:choose>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>
-->




 <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <!--  
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<%-- 
		<td colspan="11" >��ü <%= resultPage.getTotalCount() %> �Ǽ�, ���� <%=resultPage.getCurrentPage() %> ������</td>
		--%>
		<td colspan="11" >
			��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		</td>
	</tr>
-->	

	 <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
					<!--  	<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option> -->
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>

<!--  
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
		<%-- 		<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
					<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
					<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
		--%>	
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			
			<input type="text" name="searchKeyword"  <%--  "<%=searchKeyword %>" --%>
					 value="${! empty search.searchKeyword ? search.searchKeyword : ""}"
						 class="ct_input_g" style="width:200px; height:19px" >
						 
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
					<!--  <a href="javascript:fncGetList('1');">�˻�</a> -->	
	<!--  			
					 �˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
-->





 <table class="table table-hover table-striped" >

	<thead>
	<tr>
		<th align="left">No</th>
		<th align="left" >��ǰ��</th>
		<th align="left">����</th>
		<th align="left">��������</th>	
		<th align="left">�������</th>	
	</tr>
	 </thead>
	 
	<!--   
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	-->
	<%-- 	
	<% 
		for(int i=0; i<list.size(); i++) {
			Product vo = list.get(i);
	%>	
	<tr class="ct_list_pop">
		<td align="center"><%= i + 1 %></td>
		<td></td>
				
		<td align="left">
			<a href="/getProduct.do?prodNo=<%=vo.getProdNo() %>&menu=<%=menu%>"><%= vo.getProdName() %></a>
		</td>
		<% System.out.println(vo.getProdNo()); %>
		<td></td>
		<td align="left"><%= vo.getPrice() %></td>
		<td></td>
		<td align="left"><%= vo.getManuDate() %></td>
		<td></td>
		<td align="left">	�Ǹ���	</td>
	--%>	
	
	<tbody>
		
		<c:set var="i" value="0" />
		<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr>
		<!-- 	<td align="center">${product.prodNo }</td>  -->
				<td align="left">${i }</td>
				
			
			<!-- <td align="left"><a href="/getProduct.do?prodNo=${product.prodNo}&menu=${menu}">${product.prodName}</a></td>  -->	
			<td align="left"  name="test"  class="prodname">
			<input type="hidden" name="prodNo" value="${product.prodNo}">
	 	    <input type="hidden" name="menu" value="${menu}"> 
	  			${product.prodName}</td>
			<!--  <a href="/product/getProduct?prodNo=${product.prodNo}&menu=${menu}">${product.prodName}</a></td> -->
							
										
			
			<td align="left">${product.price}</td>
			
			<td align="left">${product.manuDate}</td>
			
			<td align="left">	�Ǹ���	</td>
	</tr>
	<tr>
	  	<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	<%-- 	<% } %> --%>
	
	</c:forEach>
   </tbody>		
</table>


	   	
 
<!--  ������ Navigator �� -->

<!--  </form>-->
</div>
<!-- </div>-->

	<jsp:include page="../common/pageNavigator_new.jsp"/>
	
</body>
</html>