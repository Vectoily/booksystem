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
    <title>注册</title>
    <link rel="stylesheet" href="<%=path%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=path%>/css/admin.css">
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/js/pintuer.js"></script>
    <script src="<%=path%>/js/jquery.validate.min.js"></script>
    <script src="<%=path%>/js/messages_zh.js"></script>
    <script>   
	$(document).ready(function(){
	
		$("#plusnum").blur(function(){
			$.ajax({
				type:'post',
				url:'<%=path%>/admin/checkMessage.action',
				data:{plusnum:$('#plusnum').val()},
				success:function(data){
				data = JSON.parse(data)
					if(!data.success){
						alert("学号已存在，请重新输入！");	
					}else{
					}
				}
			});
		});
	});
</script>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <div style="position: relative;bottom: 128px">

                <form action="<%=path%>/user/registUser.action" id="commentForm" method="post">
                    <div class="panel loginbox">
                        <div class="text-center margin-big padding-big-top"><h1>读者信息注册</h1></div>
                        <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="text" class="input input-big" name="name" placeholder="姓名（请填写真实姓名）" data-validate="required:请输入姓名" />
                                    <span class="icon icon-user margin-small"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="number"  class="input input-big" id="plusnum" name="number" placeholder="注册账号（只包含数字的学号）" minlength="10" data-validate="required:请输入学号,length#>=10:学号为10位数字" />
                                    <span class="icon icon-qrcode margin-small"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <span class="icon icon-envelope margin-small"></span>
                                    <input type="text" class="input input-big" name="email" placeholder="邮箱"  data-validate="required:请输入邮箱,email:请输入正确的邮箱形式" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="password" class="input input-big"  name="password" placeholder="请输入登录密码" minlength="6" data-validate="required:请输入您的密码,length#>=6:新密码不能小于6位"  />
                                    <span class="icon icon-key margin-small"></span>
                                </div>
                            </div>
							 <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="password" class="input input-big" name="repassword" placeholder="请再次输入登录密码" minlength="6" data-validate="required:请再次输入您的密码,repeat#password:两次输入的密码不一致"  />
                                    <span class="icon icon-key margin-small"></span>
                                </div>
                            </div>
							
                            <div class="form-group">
                                <div class="field field-icon-right">
                                    <input type="number"  class="input input-big" name="phone" placeholder="联系方式" required  />
                                    <span class="icon icon-phone margin-small"></span>
                                </div>
                            </div>

                        </div>
                        <div style="padding:30px">
                            <input type="submit"  class="button button-block bg-main text-big input-big" value="注册">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- <script type="text/javascript">
	$(document).ready(function(){
	$("#commentForm").validate();
	});
</script> -->
</body>
</html>