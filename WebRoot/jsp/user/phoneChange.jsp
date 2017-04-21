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
	
		$("#mphone").blur(function(){
			$.ajax({
				type:'post',
				url:'<%=path%>/user/compareMsg.action',
				data:{mphone:$('#mphone').val()},
				success:function(data){
				data = JSON.parse(data)
					if(!data.success){
						$("#mphone~span").text("与原始手机不一致，请重新输入！");	
					}else{
					$("#mphone~span").text("");	
					}
				}
			});
		});
		
		$("#currentpass").blur(function(){
			$.ajax({
				type:'post',
				url:'<%=path%>/user/compareMsg.action',
				data:{currentpass:$('#currentpass').val()},
				success:function(data){
				data = JSON.parse(data)
					if(!data.success){
						$("#currentpass~span").text("您输的密码有误，请重新输入！");	
					}else{
					$("#currentpass~span").text("");	
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
    <form method="post" class="form-x" action="<%=path%>/user/msgChange.action">
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户学号：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
           ${userCustom.number}
          </label>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">原始手机：</label>
        </div>
        <div class="field">
          <input type="number" class="input w50" id="mphone" name="mphone"  placeholder="请输入原始手机号" data-validate="required:请输入原始手机号" />&nbsp;&nbsp;<span style="color: red;"></span>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">更改手机：</label>
        </div>
        <div class="field">
          <input type="number" class="input w50" name="newphone" size="50" placeholder="请输入新手机号" data-validate="required:请输入手机号,length#>=11:手机号为11位数字" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">您的密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="currentpass" name="courrentpass" size="50" placeholder="请输入您的密码" data-validate="required:请输入您的密码" />&nbsp;&nbsp;<span style="color: red"></span>
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