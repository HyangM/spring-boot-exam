<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>실습과제1</title>
</head>
<body>
<div class="container"> <br/>
<button id="all" class="btn btn-primary">전체보기</button>
<button id="type1" class="btn btn-primary">욕실용품</button>
<button id="type2" class="btn btn-primary">음식</button>
<button id="pricesort" class="btn btn-success">가격순</button>
<button id="ordersort" class="btn btn-warning">주문순</button> 
<br/><br/>
  <table class="table">
    <thead class="thead-dark">
      <tr id="title">
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>OrderCount</th>
        <th>Type</th>
      </tr>
    </thead>
    <tbody id="box">

		<c:forEach var="prod" items="${prods}">	    
		<tr class="item">
			<td>${prod.id}</td>
			<td>${prod.name}</td>
			<td>${prod.price}</td>
			<td>${prod.orderCount}</td>
			<td>${prod.type}</td>
		</tr>
		</c:forEach>
	
    </tbody>
  </table>
</div>
<input id="btn"type="hidden" value="1"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

	// 전체보기
	$('#all').on('click', function(){	
		let btn = '1';
		$('#btn').val(btn);
		
		$('.item').remove();
		$.ajax({
			type:'GET',
			url:'/prod/all/'+btn,
			dataType:'json'	
		}).done(function(result){			
			for(var i of result){
				let item_el = "<tr class='item'><td>"+ i.id +"</td><td>"+i.name+"</td><td>"+i.price+"</td><td>"+i.orderCount+
				"</td><td>"+i.type+"</td></tr>"
	
				$('#title').after(item_el);
			}
			
		}).fail(function(result){
	
		});
	});
	// 욕실용품
	$('#type1').on('click', function(){
		let type = $('#type1').text();
		let btn = '2';
		$('#btn').val(btn);

		$('.item').remove();
		$.ajax({
			type:'GET',
			url:'/prod/type/'+type,
			dataType:'json'	
		}).done(function(result){
			/* 
			console.log("result : " + result);
			console.log("result.length : " + result.length);
			console.log("result.id : " + result[0].id);
 */
			for(var i of result){
				let item_el = "<tr class='item'><td>"+ i.id +"</td><td>"+i.name+"</td><td>"+i.price+"</td><td>"+i.orderCount+
				"</td><td>"+i.type+"</td></tr>"

				$('#title').after(item_el);
			}
			
		}).fail(function(result){

		});
	});
	// 음식
	$('#type2').on('click', function(){
		let type = $('#type2').text();
		let btn = '3';
		$('#btn').val(btn);

		$('.item').remove();
		$.ajax({
			type:'GET',
			url:'/prod/type/'+type,
			dataType:'json'	
		}).done(function(result){
						
			for(var i of result){
				let item_el = "<tr class='item'><td>"+ i.id +"</td><td>"+i.name+"</td><td>"+i.price+"</td><td>"+i.orderCount+
				"</td><td>"+i.type+"</td></tr>"

				$('#title').after(item_el);
			}
			
		}).fail(function(result){

		});
	});

	// 가격순
	$('#pricesort').on('click', function(){	

		let btn = $('#btn').val();
		var type;
		if(btn == ''){
			btn = 1;
		}
		if(btn == 1){
			type = 'type';	
		}else if(btn == 2){
			type = $('#type1').text();
		}else if(btn == 3){
			type = $('#type2').text();
		}
		
		$('.item').remove();
		$.ajax({
			type:'GET',
			url:'/prod/price/'+btn+'/'+type,
			dataType:'json'	
		}).done(function(result){			
			for(var i of result){
				let item_el = "<tr class='item'><td>"+i.id+
							  "</td><td>"+i.name+
							  "</td><td>"+i.price+
							  "</td><td>"+i.orderCount+
							  "</td><td>"+i.type+"</td></tr>"
	
				$('#box').append(item_el);
			}
			
		}).fail(function(result){
	
		});
	});	
	
	// 주문순
	$('#ordersort').on('click', function(){	

		let btn = $('#btn').val();
		var type;
		if(btn == ''){
			btn = 1;
		}
		if(btn == 1){
			type = 'type';	
		}else if(btn == 2){
			type = $('#type1').text();
		}else if(btn == 3){
			type = $('#type2').text();
		}
		
		$('.item').remove();
		$.ajax({
			type:'GET',
			url:'/prod/orderCount/'+btn+'/'+type,
			dataType:'json'	
		}).done(function(result){			
			for(var i of result){
				let item_el = "<tr class='item'><td>"+i.id+
							  "</td><td>"+i.name+
							  "</td><td>"+i.price+
							  "</td><td>"+i.orderCount+
							  "</td><td>"+i.type+"</td></tr>"
	
				$('#box').append(item_el);
			}
			
		}).fail(function(result){
	
		});
	});	
</script>
</body>
</html>  

