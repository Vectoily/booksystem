<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$("#plusname").blur(function(){
			$.ajax({
				type:'post',
				url:'<%=path%>/admin/checkadminName.action',
				data:{name:$('#plusname').val()},
				success:function(data){
				data = JSON.parse(data)
					if(data.success){
						$("#plusname~span").text("用户名不允许为admin，请重新输入！");	
					}else{
						$("#plusname~span").text("");	
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
  <div class="panel-head"><strong><span class="icon-key"></span>更改管理员信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="<%=path%>/admin/updateAdminMsg.action?id=<c:out value="${updateAdmin.adminid}"/>">
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员姓名：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
            <input type="text" class="input w50" id="plusname" name="name" size="50" value="<c:out value="${updateAdmin.name}"/>" data-validate="required:请输入姓名" />
          	&nbsp;&nbsp;<span style="color: red"></span>
          </label>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员编号:</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
            <input type="text" class="input w50" id="mpass" name="adminnumber" size="50" value="<c:out value="${updateAdmin.adminnumber}"/>" readonly/>
          </label>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员手机：</label>
        </div>
        <div class="field">
          <input type="number" class="input w50" id="mpass" name="adminphone" size="50" value="<c:out value="${updateAdmin.adminphone}"/>" data-validate="required:请输入手机号" />
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员邮箱：</label>
        </div>
        <div class="field">
          <input type="email" class="input w50" id="mpass" name="adminemail" size="50" value="<c:out value="${updateAdmin.adminemail}"/>" required data-validate="email: 请输入有效的电子邮件地址"  />
        </div>
      </div>

      <div class="form-group">
      <div class="label">
        <label for="sitename">管理员密码：</label>
      </div>
      <div class="field">
        <input type="text" class="input w50" name="password" size="50" value="<c:out value="${updateAdmin.password}"/>"   data-validate="required:请输入密码" />
      </div>
    </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">当前管理员密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="adminpass" name="newpass" size="50"  data-validate="required:请输入当前用户密码" />
        &nbsp;&nbsp;<span style="color: red"></span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">添加</button>
        </div>
      </div>      
    </form>
  </div>
</div>
</body></html>