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
					if(!data.success){
					$("#booknum~span").text("编号不允许重复，请重新输入！");
					}else{
					$("#booknum~span").text("");	
					}
				}
			});
		});
	});
	
</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加图书信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="<%=path%>/book/addBook.action">  
      <div class="form-group">
        <div class="label">
          <label>图书编号：</label>
        </div>
        <div class="field">
          <input type="text" id="booknum" class="input w50" name="bookidenty"  placeholder="请输入图书编号" data-validate="required:请输入图书编号"/>
         &nbsp;&nbsp; <span style="color: red;"></span>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="bookname"  placeholder="请输入图书名称" data-validate="required:请输入图书名称" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>作者：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="author" placeholder="请输入作者名称" data-validate="required:请输入作者名称"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>出版社：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="publisher" placeholder="请输入出版社名称"   />
          <div class="tips"></div>
        </div>
      </div>
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>图书分类：</label>
          </div>
          <div class="field">
            <select name="classify" class="input w50"   data-validate="required:请输入作者名称" >
             <c:forEach items="${allclass}" var="classlist">
              <option value="<c:out value="${classlist.classname}"/>" ><c:out value="${classlist.classname}"/></option>
              </c:forEach>
            </select>
            <div class="tips"></div>
          </div>
        </div>
      </if>
      <div class="form-group">
        <div class="label">
          <label>价格：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="price"   />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>在馆数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="remain"   />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>上传图片：</label>
        </div>
        <div class="field">
          <input type="file" id="upload" class="input w50" name="picname"   />
          <input type="button" class="button bg-blue margin-left" id="image1" value="+ 上传" >
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书简介：</label>
        </div>
        <div class="field">
          <textarea name="introduct" class="input" style="height:250px; width: 60%; border:1px solid #ddd;"></textarea>
          <div class="tips"></div>
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