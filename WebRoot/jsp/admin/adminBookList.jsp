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
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <form method="post" action="<%=path %>/book/multiCheckBook.action?dangYe=1" id="listform">
    <div class="padding border-bottom">
      <ul class="search" style="padding:10px 0px 10px 30px;">
          <li>
              <span style="font-style: oblique">书籍名称：</span> <input type="text" placeholder="可输入书籍关键字" name="bookname" class="input" style="width:170px; line-height:17px;display:inline-block" />
          </li>
          <li>
              <span style="font-style: oblique">作者：</span> <input type="text" placeholder="可输入作者关键字" name="author" class="input" style="width:170px; line-height:17px;display:inline-block" />
          </li>
        <li>
            <select name="classify" class="input w50" style="width: 150px" >
            <c:forEach items="${allclass}" var="classlist">
              <option value="<c:out value="${classlist.classname}"/>" ><c:out value="${classlist.classname}"/></option>
              </c:forEach>
            </select>
          <button class="button border-main icon-search"  type="submit"> 搜索</button>
        </li>
          <li > <a class="button border-main icon-plus-square-o" href="<%=path %>/jsp/admin/bookAdd.jsp"> 添加书籍</a>
          </li>
          <li > <a class="button border-main icon-share" href="upadte.html"> 导出表格</a>
          </li>
      </ul>
    </div>
    </form>
    <table class="table table-hover text-center">
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">图书编号</th>
        <th>书名</th>
        <th>作者</th>
        <th>分类</th>
        <th>价格</th>
        <th>在馆数量</th>
        <th>上架时间</th>
        <th width="310">操作</th>
      </tr>
      <c:forEach items="${bookList}" var="book">
        <tr>
          <td><c:out value="${book.bookidenty}"/></td>
          <td><c:out value="${book.bookname}"/></td>
          <td><c:out value="${book.author}"/></td>
          <td><c:out value="${book.classify}"/></td>
          <td><c:out value="${book.price}"/></td>
          <td><c:out value="${book.remain}"/></td>
          <td><c:out value="${book.shelftime}"/></td>
          <td><div class="button-group">
              <a class="button border-green" href="<%=path%>/book/checkBookMsg.action?id=${book.id}"><span class="icon-eye"></span>查看 </a>
              <a class="button border-main" href="<%=path%>/book/checktoUpdate.action?id=${book.id}"><span class="icon-edit"></span>修改</a>
              <a class="button border-red" href="<%=path%>/book/deleteBookMsg.action?id=${book.id}" onclick="return del(1,1,1)">
                  <span class="icon-trash-o"></span>删除</a>
          </div>
          </td>
        </tr>
        </c:forEach>

      <tr>
        <td colspan="8">
        <div class="pagelist"> 
        <a href="<%=path%>/book/bookByFen.action?dangYe=<c:out value="${shang}"/>">上一页</a> 
       	<a href="<%=path%>/book/bookByFen.action?dangYe=1">1</a> 
       	<a href="<%=path%>/book/bookByFen.action?dangYe=2">2</a>
      	<a href="<%=path%>/book/bookByFen.action?dangYe=<c:out value="${xia}"/>">下一页</a>
        <a href="<%=path%>/book/bookByFen.action?dangYe=<c:out value="${zongYe}"/>">尾页</a> 
        </div>
        </td>
      </tr>
    </table>
  </div>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>