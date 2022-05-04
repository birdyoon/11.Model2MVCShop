<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head>
<title>상품등록</title>

	
<!-- 
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script type="text/javascript" src="../javascript/calendar.js">
	</script>
 -->
 	
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">

<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	
	 <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
	<script type="text/javascript">

	
	$(function() {
		$('#manuDate').datepicker({
			dateFormat: "yy-mm-dd"
		});
	});	
	
	$(function() {
		 $( "#check" ).on("click" , function() {
			 fncAddProduct();
		 });
	});
	
	$(function() {
		 $( "a[href='#' ]" ).on("click" , function() {
			 $("form")[0].reset();
		 });
	});
	
function fncAddProduct(){
	//Form 유효성 검증
//	var name = document.detailForm.prodName.value;
//	var detail = document.detailForm.prodDetail.value;
//	var manuDate = document.detailForm.manuDate.value;
//	var price = document.detailForm.price.value;

	var name=$("input[name='prodName']").val();
	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();
	
	
	
	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}

//	document.detailForm.action='/addProduct.do';
//	document.detailForm.action='/product/addProduct';
//	document.detailForm.submit();
	$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
}



/*
function resetData(){
	document.detailForm.reset();
}
*/


</script>
</head>

<body>

<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	
   	<div class="container">
   	
   		<h1 class="bg-primary text-center">상품등록</h1>
   		
		<form class="form-horizontal" enctype="multipart/form-data">
		
  
	 <div class="form-group">
    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label" >상품명</label>
    <div class="col-sm-4">
      <input class="form-control" type="text" name="prodName"  placeholder="상품명">
    </div>
  </div>
		
	 <div class="form-group">
    <label class="col-sm-offset-1 col-sm-3 control-label" for="prodDetail">상품상세정보</label>
    <div class="col-sm-4">
      <input class="form-control" type="text" name="prodDetail" placeholder="상품상세정보">
    </div>
  </div>

	 <div class="form-group">
    <label for="text" class="col-sm-offset-1 col-sm-3 control-label" >제조일자</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자">
    </div>
  </div>
  
   <div class="form-group">
    <label class="col-sm-offset-1 col-sm-3 control-label" for="formGroupInputSmall">가 격</label>
    <div class="col-sm-4">
      <input class="form-control" type="text" name="price"  placeholder="가 격">
    </div>
  </div>
  
   <div class="form-group">
    <label class="col-sm-offset-1 col-sm-3 control-label" for="formGroupInputSmall">상품이미지</label>
    <div class="col-sm-4">
       <input multiple="multiple" class="form-control" type="file" id ="uploadFile"  name="uploadFile"  placeholder="상품이미지">
  <!--   <input multiple="multiple" class="form-control" type="file" id ="fileName"  name="fileName"  placeholder="상품이미지">-->
    </div>
  </div>


	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="check" >등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>

</form>
</div>
</body>
</html>