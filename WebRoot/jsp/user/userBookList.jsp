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
    <title></title>
  <link rel="stylesheet" href="<%=path%>/css/pintuer.css">
  <link rel="stylesheet" href="<%=path%>/css/admin.css">
  <script src="<%=path%>/js/jquery.js"></script>
  <script src="<%=path%>/js/pintuer.js"></script>
</head>
<body>
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">图书信息查询</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
      <li>
        <span style="font-style: oblique">书籍名称：</span> <input type="text" placeholder="可输入书籍关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
      </li>
      <li>
        <span style="font-style: oblique">作者：</span> <input type="text" placeholder="可输入作者关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
      </li>
      <li>
        <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
        <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a>
      </li>
    </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="10%">编号</th>
        <th width="10%">书名</th>
        <th>作者</th>
        <th>分类</th>
        <th>价格</th>
        <th>在馆数量</th>
        <th width="120">上架时间</th>
        <th width="20%">操作</th>
      </tr>      
        <tr>
          <td><input type="checkbox" name="id[]" value="1" />
            1</td>
          <td>神夜</td>
          <td>13420925611</td>
          <td>564379992@qq.com</td>  
           <td>深圳市民治街道</td>         
          <td>这是一套后台UI，喜欢的朋友请多多支持谢谢。</td>
          <td>2016-07-01</td>
          <td><div class="button-group"> <a class="button border-blue" href="userBookinfo.html" ><span class="icon-search"></span> 查看详情</a> </div></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="id[]" value="1" />
            1</td>
          <td>神夜</td>
          <td>13420925611</td>
          <td>564379992@qq.com</td>  
           <td>深圳市民治街道</td>         
          <td>这是一套后台UI，喜欢的朋友请多多支持谢谢。</td>
          <td>2016-07-01</td>
          <td><div class="button-group"> <a class="button border-blue" href="userBookinfo.html"><span class="icon-search"></span> 查看详情</a> </div></td>
        </tr>
          <tr>
          <td><input type="checkbox" name="id[]" value="1" />
            1</td>
          <td>神夜</td>
          <td>13420925611</td>
          <td>564379992@qq.com</td>  
           <td>深圳市民治街道</td>         
          <td>这是一套后台UI，喜欢的朋友请多多支持谢谢。</td>
          <td>2016-07-01</td>
            <td><div class="button-group"> <a class="button border-blue" href="userBookinfo.html" ><span class="icon-search"></span> 查看详情</a> </div></td>
        </tr>
          <tr>
          <td><input type="checkbox" name="id[]" value="1" />
            1</td>
          <td>神夜</td>
          <td>13420925611</td>
          <td>564379992@qq.com</td>  
           <td>深圳市民治街道</td>         
          <td>这是一套后台UI，喜欢的朋友请多多支持谢谢。</td>
          <td>2016-07-01</td>
            <td><div class="button-group"> <a class="button border-blue" href="userBookinfo.html"><span class="icon-search"></span> 查看详情</a> </div></td>
        </tr>
          <tr>
          <td><input type="checkbox" name="id[]" value="1" />
            1</td>
          <td>神夜</td>
          <td>13420925611</td>
          <td>564379992@qq.com</td>  
           <td>深圳市民治街道</td>         
          <td>这是一套后台UI，喜欢的朋友请多多支持谢谢。</td>
          <td>2016-07-01</td>
            <td><div class="button-group"> <a class="button border-blue" href="userBookinfo.html" ><span class="icon-search"></span> 查看详情</a> </div></td>
        </tr>
      <tr>
        <td colspan="8">
          <div class="pagelist">
            <a href="">上一页</a> <span class="current">1</span>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">下一页</a>
            <a href="">尾页</a>
          </div>
        </td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

function del(id){
	if(confirm("您确定要删除吗?")){

	}
}

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
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

</script>
</body></html>