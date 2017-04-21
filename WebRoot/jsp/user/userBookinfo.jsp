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
    <form method="post" class="form-x" action="">
      <div class="form-group">
        <div class="label">
          <label>图书编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="stitle" value="图书编号" readonly />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书名称：</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="slogo" class="input tips" value="图书名称" readonly  />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书作者：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="surl" value="图书作者" readonly />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书分类：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="sentitle" value="图书分类" readonly/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书价格：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="sentitle" value="图书价格" readonly />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>出版社：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_name" value="出版社" readonly />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>上架时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_phone" value="上架时间" readonly />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>在馆数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="s_tel" value="在馆数量" readonly />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>图书简介：</label>
        </div>
        <div class="field">
          <textarea name="scopyright" class="input" style="height:120px;" readonly></textarea>
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
      <div class="field">
         <button class="button bg-main icon-mail-reply-all" onclick="javascript:history.back(-1)">返回</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>