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
		$("#booknum").blur(function(){
			$.ajax({
				type:'post',
				url:'<%=path%>/book/checkMessage.action',
				data:{booknum:$('#booknum').val()},
				success:function(data){
  				  data = JSON.parse(data);
					if(data.success){
					$("#booknum~p").text("编号不存在，请重新输入！");	
					}else{
					$("#booknum~p").text("");	
					}
				}
			});
		});
		
		$("#usernum").blur(function(){
			$.ajax({
				type:'post',
				url:'<%=path%>/admin/checkMessage.action',
				data:{plusnum:$('#usernum').val()},
				success:function(data){
				data = JSON.parse(data)
					if(data.success){
						$("#usernum~p").text("学号不存在，请重新输入！");		
					}else{
						$("#usernum~p").text("");	
					}
					
				}
			});
		});
		
		
		
		$("#lensubmit").click(function(){	
		var booknum=$('#booknum').val();
		var usernum=$('#usernum').val();
			$.ajax({
				type:'post',
				url:'<%=path%>/borrow/checkReturnMsg.action',
				data:{booknum:$('#booknum').val(),usernum:$('#usernum').val()},
				success:function(data){
				data = JSON.parse(data)
					if(!data.success){
					alert("该同学未借此书或此书已归还，请查实后再行登记！");
					}else{
						if(booknum!="" && usernum!="" ){
					window.location.href="<%=path%>/borrow/addReturntime.action?booknum="+booknum+"&usernum="+usernum;	
					}
				}
				}
			});
		});
	});
	
</script>
</head>
<body>
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">借还登记</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <span >书籍编号：</span> <input type="text" placeholder="可输入书籍关键字" id="booknum" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <p style="color: red"></p>
        </li>
        <li>
          <span >学号：</span> <input type="text" placeholder="可输入作者关键字" id="usernum"  name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
         <p style="color: red"></p>
        </li>
        <li>
        </li>
        <li>
          <button type="submit" id="lensubmit" value="" class="button border-main icon-ok-sign">归还登记</button>
        </li>
      </ul>
    </div>
   <table class="table table-hover text-center">
      <tr>
      	<th>学号</th>
        <th>学生姓名</th>
        <th>图书编号</th>
        <th>图书名称</th>
        <th>应还时间</th>
        <th>归还时间</th>
        <th>应罚金额</th>
      </tr> 
        <c:forEach items="${borrowList}" var="borrow">  
        <tr>
          <td><c:out value="${borrow.number}"/></td>
          <td><c:out value="${borrow.name}"/></td>
          <c:forEach items="${borrow.bookList}" var="book">  
          <td><c:out value="${book.bookidenty}"/></td>
          <td><c:out value="${book.bookname}"/></td>  
          </c:forEach>
          <c:forEach items="${borrow.borrowList}" var="len">
          <td><c:out value="${len.returntime}"/></td>
          <td><c:out value="${len.backtime}"/></td>
          <td><c:out value="${len.money}"/></td>
          </c:forEach>
        </tr>
      </c:forEach>

      <tr>
        <td colspan="8">
          <div class="pagelist">
        <a href="<%=path%>/borrow/borrowByfen2.action?dangYe=<c:out value="${shang}"/>">上一页</a> 
       	<a href="<%=path%>/borrow/borrowByfen2.action?dangYe=1">1</a> 
       	<a href="<%=path%>/borrow/borrowByfen2.action?dangYe=2">2</a>
      	<a href="<%=path%>/borrow/borrowByfen2.action?dangYe=<c:out value="${xia}"/>">下一页</a>
        <a href="<%=path%>/borrow/borrowByfen2.action?dangYe=<c:out value="${zongYe}"/>">尾页</a> 
          </div>
        </td>
      </tr>
    </table>
  </div>
</body></html>