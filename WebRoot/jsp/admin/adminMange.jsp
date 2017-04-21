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
		$(".updateAdmin").each(function(i){
			$(".updateAdmin")[i].addEventListener('click',
				(function(i){
					return function(){
					var temp = $('.updateAdmin')[i].value;
					$.ajax({
						type:'post',
						url:'<%=path%>/admin/checkAccess.action',
						data:{access:temp},
						success:function(data){
							data = JSON.parse(data)
							if(!data.success){
								alert("您没有修改的权限，请联系超级管理员进行此操作！")	;
							}else{
								if(temp=="10001"){
								alert("此账号禁止修改！请选择其他管理账户！");
								}else{
								window.location.href="<%=path%>/admin/toUpdateAdmin.action?id="+temp;	
								}	
							}
						}
					});
				}
				})(i)
			
			);
		})
		$(".deleteAdmin").each(function(i){
			$(".deleteAdmin")[i].addEventListener('click',
				(function(i){
					return function(){
					var temp = $('.deleteAdmin')[i].value;
					$.ajax({
						type:'post',
						url:'<%=path%>/admin/checkAccess.action',
						data:{access:temp},
						success:function(data){
							data = JSON.parse(data)
							if(!data.success){
								alert("您没有修改的权限，请联系超级管理员进行此操作！")	;
							}else{	
								if(temp=="10001"){
								alert("此账号禁止修改！请选择其他管理账户!");
								}else{
								window.location.href="<%=path%>/admin/deleteAdmin.action?id="+temp;	
								}
							}
						}
					});
				}
				})(i)
			
			);
		})
	});
	
	
</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 分类列表</strong></div>
  <div class="padding border-bottom">
  <form action="<%=path%>/admin/adminByMo.action?dangYe=1" method="post">
    <ul class="search" style="padding:10px 0px 10px 90px;">
      <li>
        <span style="font-style: oblique">管理员编号：</span> 
        <input type="text" placeholder="可输入编号关键字" name="adminnumber" class="input" style="width:170px; line-height:17px;display:inline-block" />
      </li>
      <li>
        <span style="font-style: oblique">管理员姓名：</span> <input type="text" placeholder="可输入姓名关键字" name="name" class="input" style="width:170px; line-height:17px;display:inline-block" />
      </li>
      <li>
        <input type="text" placeholder="请输入手机关键字" name="adminphone" class="input" style="width:250px; line-height:17px;display:inline-block" />
        <button  class="button border-main icon-search" type="submit"> 搜索</button>
      </li>
      <li >
      <a href="<%=path%>/jsp/admin/addAdmin.jsp">
      <button type="button" class="button border-main">
      <span class="icon-plus-square-o"></span> 添加管理员</button></a>
      </li>
    </ul>
    </form>
  </div>
  <table class="table table-hover text-center">
    <tr>
      <th width="5%">管理员编号</th>
      <th width="15%">管理员姓名</th>
      <th width="10%">管理员手机</th>
      <th width="10%">管理员密码</th>
      <th width="10%">操作</th>
    </tr>
    <c:forEach items="${adminList}" var="admins">
    <tr>
      <td><span class="adminnum"><c:out value="${admins.adminnumber}"/></span></td>
      <td><c:out value="${admins.name}"/></td>
      <td><c:out value="${admins.adminphone}"/></td>
      <td><c:out value="${admins.password}"/></td>
      <td>
      <div class="button-group">
       <button class="button border-main updateAdmin" value="<c:out value='${admins.adminid}'/>"><span class="icon-edit"></span>修改</button>
       <button class="button border-red  deleteAdmin"  value="<c:out value='${admins.adminid}'/>"><span class="icon-trash-o"></span> 删除</button>
       </div></td>
    </tr>
    </c:forEach>
    <tr>
      <td colspan="8">
        <div class="pagelist">
           <a href="<%=path%>/admin/adminList.action?dangYe=<c:out value="${shang}"/>">上一页</a> 
       	<a href="<%=path%>/admin/adminList.action?dangYe=1">1</a> 
       	<a href="<%=path%>/admin/adminList.action?dangYe=2">2</a>
      	<a href="<%=path%>/admin/adminList.action?dangYe=<c:out value="${xia}"/>">下一页</a>
        <a href="<%=path%>/admin/adminList.action?dangYe=<c:out value="${zongYe}"/>">尾页</a> 
        </div>
      </td>
    </tr>
  </table>
</div>
</body>
</html>