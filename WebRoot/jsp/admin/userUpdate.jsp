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
<title></title>
<link rel="stylesheet" href="<%=path%>/css/pintuer.css">
<link rel="stylesheet" href="<%=path%>/css/admin.css">
<script src="<%=path%>/js/jquery.js"></script>
<script src="<%=path%>/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改会员密码</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="<%=path%>/admin/updateUser.action?code=<c:out value="${user.code}"/>">
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户学号：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
            <input type="number" class="input" name="number" value="<c:out value="${user.number}"/>"  readonly/>
          </label>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户姓名：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
            <input type="text" class="input" name="name" value="<c:out value="${user.name}"/>"  />
          </label>
        </div>
      </div>    
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户手机：</label>
        </div>
        <div class="field">
          <input type="number" class="input w50" name="phone" value="<c:out value="${user.phone}"/>" size="50" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户密码：</label>
        </div>
        <div class="field">
          <input type="text" value="y7hfduahsdj" class="input w50" name="<c:out value="${user.password}"/>" size="50" readonly/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户邮箱：</label>
        </div>
        <div class="field">
          <input type="email" value="<c:out value="${user.email}"/>" class="input w50" name="email" size="50"  />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>   
        </div>
      </div>      
    </form>
  </div>
</div>
</body></html>