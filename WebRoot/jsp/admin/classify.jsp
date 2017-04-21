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
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 分类列表</strong></div>
  <form method="post" class="form-x" action="<%=path%>/classify/classByMo.action?dangYe=1">
  <div class="padding border-bottom">
    <ul class="search" >
      <li>
        <span style="font-style: oblique">分类名称：</span> <input type="text" placeholder="可输入分类关键字" name="classname" class="input" style="width:170px; line-height:17px;display:inline-block" />
      </li>
      <li>
        <button class="button border-main icon-search" type="submit"> 搜索</button>
      </li>
      <li > <button type="button" class="button border-yellow" onclick="window.location.href='#add'"><span class="icon-plus-square-o"></span> 添加分类</button>
      </li>
    </ul>
  </div>
  </form>
  <table class="table table-hover text-center">
    <tr>
      <th width="20%">分类名称</th>
      <th width="25%">分类说明</th>
      <th width="30%">操作</th>
    </tr>
	<c:forEach items="${classList}" var="classify">
    <tr>
      <td><c:out value="${classify.classname}"/></td>
      <td ><c:out value="${classify.brief}"/></td>
      <td><div class="button-group">
       <a class="button border-main" href="<%=path %>/classify/idtoUpdate.action?id=<c:out value="${classify.id}"/>"><span class="icon-edit"></span> 修改</a>
       <a class="button border-red" href="<%=path %>/classify/delteClassify.action?id=<c:out value="${classify.id}"/>" onclick="return del(1,2)"><span class="icon-trash-o"></span> 删除</a> 
       </div></td>
    </tr>
    </c:forEach>
    <tr>
      <td colspan="8">
        <div class="pagelist">
         <a href="<%=path%>/classify/classByfen.action?dangYe=<c:out value="${shang}"/>">上一页</a> 
       	<a href="<%=path%>/classify/classByfen.action?dangYe=1">1</a> 
       	<a href="<%=path%>/classify/classByfen.action?dangYe=2">2</a>
      	<a href="<%=path%>/classify/classByfen.action?dangYe=<c:out value="${xia}"/>">下一页</a>
        <a href="<%=path%>/classify/classByfen.action?dangYe=<c:out value="${zongYe}"/>">尾页</a> 
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
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="<%=path%>/classify/addClass.action">
      <div class="form-group">
        <div class="label">
          <label>分类标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="classname" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>分类概述：</label>
        </div>
        <div class="field">
          <textarea type="text" class="input w50" name="brief" style="height:150px;" placeholder="多个分类标题请转行"></textarea>
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
</body>
</html>