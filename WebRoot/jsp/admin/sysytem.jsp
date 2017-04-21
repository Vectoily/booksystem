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
    <title>网站信息</title>  
    <link rel="stylesheet" href="../../css/pintuer.css">
    <link rel="stylesheet" href="../../css/admin.css">
    <script src="../../js/jquery.js"></script>
    <script src="../../js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
  <table class="table table-hover text-center">
    <tr>
      <th>设置项名称</th>
      <th>设置项值</th>
      <th width="250">操作</th>
    </tr>
   
    <tr>
      <td>17</td>      
      <td>公司简介</td>
      <td>
      <div class="button-group">
      <a type="button" class="button border-main" href="paramChange.html"><span class="icon-edit"></span>修改</a>
      </div>
      </td>
    </tr> 
    
    <tr>
      <td>17</td>      
      <td>产品中心</td>
      <td>
      <div class="button-group">
      <a type="button" class="button border-main" href="#"><span class="icon-edit"></span>修改</a>
      </div>
      </td>
    </tr>  
    
    <tr>
      <td>17</td>      
      <td>新闻资讯</td>
      <td>
      <div class="button-group">
      <a type="button" class="button border-main" href="#"><span class="icon-edit"></span>修改</a>
      </div>
      </td>
    </tr>  
    
    <tr>
      <td>17</td>      
      <td>人才招聘</td>
      <td>
      <div class="button-group">
      <a type="button" class="button border-main" href="#"><span class="icon-edit"></span>修改</a>
      </div>
      </td>
    </tr>  
    
    <tr>
      <td>17</td>      
      <td>联系我们</td>
      <td>
      <div class="button-group">
      <a type="button" class="button border-main" href="#"><span class="icon-edit"></span>修改</a>
      </div>
      </td>
    </tr>
  </table>
</div>
</body></html>