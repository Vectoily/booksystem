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
<script type="text/javascript">

	$(document).ready(function(){
		$("#usernum").blur(function(){
			$.ajax({
				type:'post',
				url:'<%=path%>/admin/checkMessage.action',
				data:{plusnum:$('#usernum').val()},
				success:function(data){
				data = JSON.parse(data)
					if(data.success){
						$("#usernum~span").text("学号不存在，请重新输入！");	
					}else{
						$("#usernum~span").text("");	
					}
				}
			});
		});
		
		$("#adminpass").blur(function(){
			$.ajax({
				type:'post',
				url:'<%=path%>/user/checkAdminPass.action',
				data:{adminpass:$('#adminpass').val()},
				success:function(data){
				data = JSON.parse(data)
					if(!data.success){
						$("#adminpass~span").text("密码不正确，请重新输入！");	
					}else{
						$("#adminpass~span").text("");	
					}
				}
			});
		});
		
	});
	
	
</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改会员密码</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="<%=path%>/admin/changeUserPass.action">
      <div class="form-group">
        <div class="label">
          <label for="sitename">当前用户：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
           <c:out value="${admin.name}"></c:out>
          </label>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户类型：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
            ${identy}
          </label>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="adminpass" name="adminpassword" size="50" placeholder="请输入管理员密码" data-validate="required:请输入管理员密码" />
       	<span style="color: red;"></span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户账号：</label>
        </div>
        <div class="field">
          <input type="number" class="input w50" id="usernum" name="number" size="50" placeholder="请输入用户账号" data-validate="required:请输入用户账号" />
       	 <span style="color: red"></span>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="password" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">再次输入密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="repassword" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码" />
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