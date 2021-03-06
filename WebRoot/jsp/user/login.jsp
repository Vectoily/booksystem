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
    <title>登录</title>  
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
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>
            <div style="position: relative;bottom: 24px">
            <form action="<%=path%>/user/loginUser.action" method="post">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>图书信息管理系统</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="name" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div>
						 
					</div>
                </div>
				 <div style="padding:5px 40px 25px 100px;display:inline-block"><input type="radio"  value="学生" name="userIdenty" required>学生</div>
				 <div style="padding:5px 60px 25px 60px;display:inline-block"><input type="radio" value="管理员" name="userIdenty">管理员</div>
                <div style="padding:25px 35px;display:inline-block">
                    <input type="submit" class="button  bg-main" style="width:120px;height:50px" value="登录">
                </div>
                <div style="padding:25px 35px;display:inline-block">
                    <a href="<%=path%>/user/toRegist.action"><input type="button" style="width:120px;height:50px" class="button  bg-main " value="注册"></a>
                </div>
				</div>
            </form>
        </div>
        </div>
    </div>
</div>
</body>
</html>