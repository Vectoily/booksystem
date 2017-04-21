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
<script type="text/javascript">

	$(document).ready(function(){
		$("#plusnum").blur(function(){
			$.ajax({
				type:'post',
				url:'<%=path%>/admin/checkMessage.action',
				data:{plusnum:$('#plusnum').val()},
				success:function(data){
				data = JSON.parse(data)
					if(!data.success){
						$("#plusnum~span").text("学号已存在，请重新输入！");	
					}else{
						$("#plusnum~span").text("");	
					}
				}
			});
		});
		
		$("#mail").blur(function(){
			$.ajax({
				type:'post',
				url:'<%=path%>/admin/checkMessage2.action',
				data:{mail:$('#mail').val()},
				success:function(data){
				data = JSON.parse(data)
					if(!data.success){
						$("#mail~span").text("提交后请前往邮箱进行激活操作！");	
					}else{
						$("#mail~span").text("");	
					}
				}
			});
		});
	});
	
	
</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span>添加新用户</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="<%=path%>/admin/addUser.action">
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户姓名：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
            <input type="text" class="input w50"  name="name" size="50" placeholder="请输入用户姓名" data-validate="required:请输入用户姓名" />
          </label>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户账号(学号):</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
            <input type="text" class="input w50" id="plusnum"  name="number" size="50" placeholder="请输入用户账号" data-validate="required:请输入学号,length#>=10:学号为10位数字" />
            <span style="color: red;"></span>
          </label>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="password" name="password" size="50" placeholder="请输入用户密码"data-validate="required:请输入您的密码,length#>=6:新密码不能小于6位"  />
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label for="sitename">再次输入密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="mpass" name="repassword" size="50" placeholder="请再次输入用户密码" data-validate="required:请再次输入您的密码,repeat#password:两次输入的密码不一致" />
        </div>
      </div>        
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户手机：</label>
        </div>
        <div class="field">
          <input type="number" class="input w50" name="phone" size="50" placeholder="请输入手机号"  />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户邮箱：</label>
        </div>
        <div class="field">
          <input type="email" id="mail" class="input w50 userMsg" name="email" size="50" placeholder="请输入邮箱" data-validate="required:请输入邮箱,email:请输入正确的邮箱形式"  />
        &nbsp;&nbsp;<span></span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" id="add" type="submit">添加</button>
        </div>
      </div>      
    </form>
  </div>
</div>
</body></html>