<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>激活</title>
    <link rel="stylesheet" href="<%=path%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=path%>/css/admin.css">
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/js/pintuer.js"></script>  
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:90px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>
            <div>
            <div class="panel loginbox" style="height: 300px;width: 600px;position: relative;left: -100px">
                <div style="padding: 30px">
                    <img src="<%=path%>/images/wrong.png"style=" width:25%;display: inline-block" >
                    <p style="font-size:20px;color:#ff4c33;display: inline-block;position: relative;bottom: 10px" >${msg}</p>
                </div>
                <div style="position: relative;left: 120px;top: 20px">
                <a style="padding: 35px;font-size: 18px;color: #00aa00" href="<%=path%>/jsp/user/login.jsp"">首页</a>
                <a style="padding: 35px;font-size: 18px;color: #00aa00" href="<%=path%>/jsp/user/login.jsp"">登陆</a>
                <a style="padding: 35px;font-size: 18px;color: #00aa00" href="<%=path%>/user/toRegist.action">注册</a>
                </div>
        </div>
        </div>
    </div>
	</div>
</div>
</body>
</html>