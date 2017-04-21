<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="<%=path%>/images/x.jpg" class="radius-circle rotate-hover" height="50" alt="" />图书信息管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 前台首页</a>
      &nbsp;&nbsp;<a class="button button-little bg-red" href="<%=path%>/jsp/user/login.jsp"><span class="icon-power-off"></span> 退出登录</a>
  </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-book"></span>图书管理</h2>
  <ul style="display:block">
      <li><a href="<%=path %>/book/bookByFen.action?dangYe=1" target="right"><span class="icon-caret-right"></span>书籍信息</a></li>
      <li><a href="<%=path %>/classify/classByfen.action?dangYe=1" target="right"><span class="icon-caret-right"></span>分类管理</a></li>
      <li><a href="<%=path %>/borrow/borrowByfen.action?dangYe=1" target="right"><span class="icon-caret-right"></span>借阅登记</a></li>
      <li><a href="<%=path %>/borrow/borrowByfen2.action?dangYe=1" target="right"><span class="icon-caret-right"></span>归还登记</a></li>
      <li><a href="<%=path %>/borrow/borrowByfen3.action?dangYe=1" target="right"><span class="icon-caret-right"></span>借阅查询</a></li>
  </ul>
  <h2><span class="icon-user"></span>账号管理</h2>
  <ul>
      <li><a href="<%=path %>/admin/userList.action?dangYe=1" target="right"><span class="icon-caret-right"></span>用户账号管理</a></li>
      <li><a href="<%=path %>/jsp/admin/adminChangePass.jsp" target="right"><span class="icon-caret-right"></span>用户密码管理</a></li>
      <li><a href="<%=path %>/admin/adminList.action?dangYe=1" target="right"><span class="icon-caret-right"></span>管理员账号管理</a></li>
  </ul>
    <h2><span class="icon-wrench"></span>系统设置</h2>
    <ul>
        <li><a href="<%=path %>/jsp/admin/sysytem.jsp" target="right"><span class="icon-caret-right"></span>借阅权限管理</a></li>
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
  <li><a href="<%=path%>/jsp/user/login.jsp" target="right" class="icon-home"> 首页</a></li>
  <li>网站信息</li>
  <li><b>当前用户：</b><span style="color:green;"><c:out value="${admin.name}"/></span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户身份：<span style="color: green">${identy}</span></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="<%=path%>/jsp/admin/adminBookList.jsp" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>