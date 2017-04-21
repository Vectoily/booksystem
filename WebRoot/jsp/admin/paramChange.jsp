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
    <form method="post" class="form-x" action="">
      <div class="form-group">
        <div class="label">
          <label for="sitename">当前用户：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
           admin
          </label>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户类型：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
            管理员
          </label>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">设置项：</label>
        </div>
        <div class="field">
          <input  class="input w50"  name="mpass" value="sudhfsdjk" />
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">设置值：</label>
        </div>
        <div class="field">
          <input type="number" class="input w50" name="newpass" size="50"  value="3" />
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