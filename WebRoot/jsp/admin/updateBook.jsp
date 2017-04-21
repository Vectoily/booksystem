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
    <title>图书具体信息</title>
    <link rel="stylesheet" href="<%=path%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=path%>/css/admin.css">
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 图书具体信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="<%=path%>/book/updateBookMsg.action?id=<c:out value="${book.id}"/>">
      <div class="form-group">
        <div class="label">
          <label>图书编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="bookidenty" value="<c:out value="${book.bookidenty}"/>" readonly />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书名称：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="bookname" class="input tips" value="<c:out value="${book.bookname }"/>"   />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书作者：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="author" value="<c:out value="${book.author}"/>" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书分类：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="classify" value="<c:out value="${book.classify }"/>"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书价格：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="price" value="<c:out value="${book.price}"/>" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>出版社：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="publisher" value="<c:out value="${book.publisher}"/>"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>上架时间：</label>
        </div>
        <div class="field">
          <input type="date" class="input" name="shelftime" value="<c:out value="${book.shelftime}"/>"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>在馆数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="remain" value="<c:out value="${book.remain }"/>"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书简介：</label>
        </div>
        <div class="field">
          <textarea name="introduct" class="input" style="height:120px;" ><c:out value="${book.introduct}"/></textarea>
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
      <div class="field">
         <button class="button bg-main icon-mail-reply-all" type="submit">修改</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>