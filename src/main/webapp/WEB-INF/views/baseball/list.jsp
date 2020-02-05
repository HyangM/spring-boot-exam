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
<title>실습과제2</title>
</head>
<body>
<div class="container">
<table class="table">
	<thead class="thead-dark">
		<tr>
		 <th>팀</th>
		</tr>
	</thead>
	<tbody id="team">
	    <c:forEach var="team" items="${teams}">
		<tr class="team">
		 <td><a href="javascript:void(0)"onclick="player(${team.id})">${team.teamname}</a></td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<table id="tplayer"class="table" style="visibility:hidden;">
	<thead class="thead-dark">
		<tr>
		 <th>선수</th>
		</tr>
	</thead>
	<tbody id="player">
		<tr class="player">
		 <td></td>
		</tr>
	</tbody>
</table>

<table id="tdetail"class="table" style="visibility:hidden;">
	<thead class="thead-dark">
		<tr>
		 <th>상세</th>
		</tr>
	</thead>
	<tbody id="detail">
		<tr class="detail">
		 <td></td>
		</tr>
	</tbody>
</table>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/js/list.js"></script>

</body>
</html>