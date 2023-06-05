<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<style>
        *{box-sizing: border-box;}
        div{border: 1px solid black;}
        .testbox{border: 0px;height: 100px;}
        .btnbox{padding: 1%; padding-left: 0%;border: 0px;}
        .btn{width: 100%; height: 100%;background-color: gray; color: black;}
        .btn:hover{background-color: black; color: gray;}
    </style>
</head>
<body>
	<div class="container-fluid">
        <div class="row gnb">gnb</div>
	    <div class="row lnb">lnb</div>
    </div>
    <div class="container-xl">
		<div class="row chatbox">
            <div class="col-md-8 testbox">
                멘토:abc <br>
                멘티:123
            </div>
            <div class="col-md-2 btnbox">
                <button class="btn">승인</button>
            </div>
            <div class="col-md-2 btnbox">
                <button class="btn">거절</button>
            </div>
		</div>
        <div class="row chatbox">
            <div class="col-md-8 testbox">
                멘토:abc <br>
                멘티:123
            </div>
            <div class="col-md-2 btnbox">
                <button class="btn">승인</button>
            </div>
            <div class="col-md-2 btnbox">
                <button class="btn">거절</button>
            </div>
		</div>
		<div class="row footer">
		
		</div>
	</div>
</body>
</html>