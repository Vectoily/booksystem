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
  <div class="panel-head"><strong class="icon-reorder"> 分类列表</strong></div>
 	<form action="<%=path%>/admin/multicheckUser.action?dangYe=1" method="post">
 	 <div class="padding border-bottom">
    <ul class="search" style="padding:10px 0px 10px 90px;">
      <li>
        <span style="font-style: oblique">用户姓名：</span> <input type="text" placeholder="可输入分类关键字" name="name" class="input" style="width:170px; line-height:17px;display:inline-block" />
      </li>
      <li>
        <span style="font-style: oblique">用户学号：</span> <input type="text" placeholder="可输入分类关键字" name="number" class="input" style="width:170px; line-height:17px;display:inline-block" />
      </li>
      <li>
        <input type="text" placeholder="请输入手机关键字" name="phone" class="input" style="width:250px; line-height:17px;display:inline-block" />
        <button  class="button border-main icon-search" type="submit"> 搜索</button>
      </li>
      <li><a href="<%=path%>/jsp/admin/addUser.jsp"><button type="button" class="button border-main"><span class="icon-plus-square-o"></span> 添加用户</button></a>
      </li>
    </ul>
  </div>
  </form>
  <table class="table table-hover text-center">
    <tr>
      <th width="5%">用户学号</th>
      <th width="15%">用户姓名</th>
      <th width="10%">用户手机</th>
      <th width="10%">用户密码</th>
      <th width="10%">操作</th>
    </tr>
    <c:forEach items="${userList}" var="user">
    <tr>
      <td><c:out value="${user.number}"/></td>
      <td><c:out value="${user.name}"/></td>
      <td><c:out value="${user.phone}"/></td>
      <td><c:out value="${user.password}"/></td>
      <td><div class="button-group">
        <a class="button border-main" href="<%=path%>/admin/idtoUpdate.action?code=<c:out value="${user.code}"/>"><span class="icon-edit"></span> 修改</a>
        <a class="button border-red" href="<%=path%>/admin/deleteUser.action?code=<c:out value="${user.code}"/>" onclick="return del(1,2)">
          <span class="icon-trash-o"></span> 删除</a>
      </div>
      </td>
    </tr>
    </c:forEach>
    <tr>
      <td colspan="8">
        <div class="pagelist">
        <a href="<%=path%>/admin/userList.action?dangYe=<c:out value="${shang}"/>">上一页</a> 
       	<a href="<%=path%>//admin/userList.action?dangYe=1">1</a> 
       	<a href="<%=path%>//admin/userList.action?dangYe=2">2</a>
      	<a href="<%=path%>//admin/userList.action?dangYe=<c:out value="${xia}"/>">下一页</a>
        <a href="<%=path%>//admin/userList.action?dangYe=<c:out value="${zongYe}"/>">尾页</a> 
        </div>
      </td>
    </tr>
  </table>
</div>
<script type="text/javascript">
function del(id,mid){
	if(confirm("您确定要删除吗?")){			
		
	}
}
</script>
</body>
</html>