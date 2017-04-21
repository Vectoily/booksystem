<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>图书信息管理中心</title>
    <link rel="stylesheet" href="<%=path%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=path%>/css/admin.css">
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/js/pintuer.js"></script>  
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="<%=path%>/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />图书信息管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 前台首页</a>
      &nbsp;&nbsp;<a class="button button-little bg-red" href="<%=path%>/jsp/user/login.jsp"><span class="icon-power-off"></span> 退出登录</a>
  </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>图书信息查询</h2>
  <ul style="display:block">
    <li><a href="<%=path %>/book/bookByFen.action?dangYe=1" target="right"><span class="icon-caret-right"></span>图书查询</a></li>
      <li><a href="<%=path%>/borrow/borrowByfen3.action?dangYe=1" target="right"><span class="icon-caret-right"></span>借阅信息查询</a></li>
  </ul>
  <h2><span class="icon-pencil-square-o"></span>账号</h2>
  <ul>
      <li><a href="<%=path%>/jsp/user/passChange.jsp" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
      <li><a href="<%=path%>/jsp/user/phoneChange.jsp" target="right"><span class="icon-caret-right"></span>修改手机</a></li>
  </ul>  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="<%=path%>/jsp/admin/adminBookList.jsp" target="right" class="icon-home"> 首页</a></li>
  <li>网站信息</li>
  <li><b>当前用户：</b><span style="color:green;">${userCustom.name}</php></span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户身份：<span style="color: green">${identy}</span></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0"  src="<%=path%>/jsp/admin/adminBookList.jsp" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>