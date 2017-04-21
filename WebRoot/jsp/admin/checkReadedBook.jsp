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
    <div class="panel-head"><strong class="icon-reorder"> 借阅信息查询</strong></div>
   <form method="post" action="<%=path%>/borrow/multicheckBorow.action?dangYe=1">
    <div class="padding border-bottom">
      <ul class="search">
        <li >
          <span style="font-style: oblique">书籍编号：</span> <input type="text" placeholder="可输入书籍编号关键字" name="bookidenty" class="input" style="width:250px; line-height:17px;display:inline-block" />
        </li>
        <li >
          <span style="font-style: oblique">书籍名称：</span> <input type="text" placeholder="可输入书籍关键字" name="bookname" class="input" style="width:250px; line-height:17px;display:inline-block" />
        </li>
        <li >
          <span style="font-style: oblique">作者：</span> <input type="text" placeholder="可输入作者关键字" name="author" class="input" style="width:250px; line-height:17px;display:inline-block" />
        </li>
        <li >
          &nbsp;&nbsp;
          <button class="button border-main icon-search"  onclick="changesearch()" > 搜索</button>
        </li>
      </ul>
    </div>
    </form>
     <table class="table table-hover text-center">
      <tr>
      	<th>学号</th>
        <th>学生姓名</th>
        <th>图书编号</th>
        <th>图书名称</th>
        <th>作者</th>
        <th>价格</th>
         <th>借阅时间</th>
        <th>应还时间</th>
      </tr> 
        <c:forEach items="${borrowList}" var="borrow">  
        <tr>
          <td><c:out value="${borrow.number}"/></td>
          <td><c:out value="${borrow.name}"/></td>
          <c:forEach items="${borrow.bookList}" var="book">  
          <td><c:out value="${book.bookidenty}"/></td>
          <td><c:out value="${book.bookname}"/></td>  
          <td><c:out value="${book.author}"/></td>         
          <td><c:out value="${book.price}"/></td>
          </c:forEach>
          <c:forEach items="${borrow.borrowList}" var="len">
          <td><c:out value="${len.lentime}"/></td>
          <td><c:out value="${len.returntime}"/></td>
          </c:forEach>
        </tr>
      </c:forEach>

      <tr>
        <td colspan="8">
          <div class="pagelist">
        <a href="<%=path%>/borrow/borrowByfen3.action?dangYe=<c:out value="${shang}"/>">上一页</a> 
       	<a href="<%=path%>/borrow/borrowByfen3.action?dangYe=1">1</a> 
       	<a href="<%=path%>/borrow/borrowByfen3.action?dangYe=2">2</a>
      	<a href="<%=path%>/borrow/borrowByfen3.action?dangYe=<c:out value="${xia}"/>">下一页</a>
        <a href="<%=path%>/borrow/borrowByfen3.action?dangYe=<c:out value="${zongYe}"/>">尾页</a> 
          </div>
        </td>
      </tr>
    </table>
  </div>
</body></html>