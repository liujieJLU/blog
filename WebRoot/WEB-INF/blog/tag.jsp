<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../main/title.jsp" %>
  
  <body>
    <div id="wrapper">
        <%@ include file="../main/top.jsp" %>
        <%@ include file="../main/left.jsp" %>
	<!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">标签管理</h1>
                        <h1 class="page-subhead-line">你可以为你的任意一个博文添加多个标签，在这里可以增加、删除或者修改标签，</h1>

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
		<div class="col-md-8 col-sm-6 col-xs-12">
            <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a id="addTag" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">新建标签</a>
                        </h4>
                    </div>
                    <div class="panel-body">
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="alert alert-info text-center">
                          <h4> 输入新的标签名</h4> 
                          <hr>
                          <input class="form-control" type="text" id="tagName" name="tags.name">
                          <hr>
                            <button class="btn btn-info" onclick="addTag()">确定</button>
                        </div>
                    </div>
                    </div>
            </div>
        <div class="panel panel-primary">
                 <!-- Default panel contents -->
                    <div class="panel-heading">查看现有标签</div>

                  <!-- Table -->
                  <table class="table">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th class="text-center">序号</th>
                        <th class="text-center">标签名</th>
                        <th class="text-center">创建日期</th>
                        <th class="text-center">操作</th>
                      </tr>
                    </thead>
                    <tbody id="tbTags">
                    <tr class="list-group-item-danger">
                    
                    
                        <td><input type="checkbox" value="" /></td>
                        <td>全选</td>
                        <td>90 Orders To Process</td>
                        <td>2nd December </td>
                        <td><a href="#" class="btn btn-info">In Process</a></td>
                      </tr>
                    </tbody>
                  </table>
					<div id="pageTag"></div>
          </div>
          
                </div>
        </div>
    </div>
    </div>
    </div>
    <!-- /. WRAPPER  -->
    <div id="footer-sec">
        &copy; 2014 YourCompany | More Templateques <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
    </div>
    <script type="text/javascript" src="<%=basePath%>static/js/jquery.js?=<%=js%>"></script>
    <script type="text/javascript" src="<%=basePath%>static/js/bootstrap.js?=<%=js%>"></script>
    <script type="text/javascript" src="<%=basePath%>static/js/jquery.metisMenu.js?=<%=js%>"></script>
    <script type="text/javascript" src="<%=basePath%>static/js/custom.js?=<%=js%>"></script>
    <script type="text/javascript" src="<%=basePath%>static/layui/layui.js?=<%=js%>"></script>
	<script type="text/javascript">
	$(function(){
		showTags("1");
	});
	
	/* 添加标签 */
	function addTag(){
		layui.use(['layer', 'form','laytpl'], function(){
			  var layer = layui.layer;
			  var form = layui.form();
		 $.ajax({
		    	type:"post",
		    	url:"<%=basePath%>admin/tags/addTag",
		    	data:{"tags.name":$("#tagName").val()},
		    	success: function(data){
		    		if(data.code == 0){
		    			layer.msg("添加成功！");
		    			setTimeout("window.location.href ='<%=basePath%>jsp/admin/tag.jsp'", 2000);
		    		}else{
		    			layer.msg("添加失败！"+data.message);
		    		}
		    	}
		    });
		}); 
	}
	
	
	function showTags(page){
		layui.define(['layer', 'form','laytpl','laypage'], function(){
			  var layer = layui.layer;
			  var form = layui.form();
			  var laytpl = layui.laytpl;
			  var $ = layui.jquery;
			  var laypage = layui.laypage;
		$.ajax({
	    	type:"post",
	    	url:"<%=basePath%>admin/tags/findTags",
	    	data:{pageNumber:page},
	    	success: function(element){
	    		if(element.code == 0){
	    			laytpl($("#tagsTemplate").html()).render(element.data.tagsList,function(html){
	    				$("#tbTags").html(html);
	    			});
	    			  laypage({
	    	  			    cont: 'pageTag',
	    	  			    pages: Math.ceil(element.data.pageCount/5), //得到总页数 
	    	  			    groups: '5',
	    	  			    curr: page,
	    	  			    jump: function(obj, first){
	    	  			    	if(!first){
	    	  			    		showTags(obj.curr);
	    	  			    	}
	    	  			    }
	    	  			  });
	    		}else{
	    			layer.msg("添加失败！"+data.message);
	    		}
	    	}
	    });
		});
	}
	
	function layerWindows(tagsId, tagsName){
		layui.use('layer', function(){
			  var layer = layui.layer;
			  
			  layer.open({
				  type: 1,
				  area: ['700px', '300px'],
				  content: '<div class="alert alert-info text-center"><h4> 输入新的标签名</h4><hr><input  type="hidden" id="tagEditId" value="'+tagsId+'">'+
				  '<input class="form-control" type="text" id="tagEditName" name="tags.name" value="'+tagsName+'">'+
				  '<hr><button class="btn btn-info" onclick="editTag()">确定</button></div>'
					  
				}); 
			});   
	}
	/* 修改标签 */
	function editTag(){
	alert("标签Id："+$("#tagEditId").val());
	alert("标签名："+$("#tagEditName").val());
	
	layui.use(['layer', 'form','laytpl'], function(){
		  var layer = layui.layer;
		  var form = layui.form();
	 $.ajax({
	    	type:"post",
	    	url:"<%=basePath%>admin/tags/editTag",
	    	data:{"tags.id":$("#tagEditId").val(), "tags.name":$("#tagEditName").val()},
	    	success: function(data){
	    		if(data.code == 0){
	    			layer.msg(data.message);
	    			setTimeout("window.location.href ='<%=basePath%>jsp/admin/tag.jsp'", 1500);
	    		}else{
	    			layer.msg("修改失败！"+data.message);
	    		}
	    	}
	    });
	}); 
}
	</script>
	<script id="tagsTemplate" type="text/template">
	{{#  layui.each(d.list, function(index, item){ }}
	<tr class="list-group-item-success">
   		<td><input type="checkbox" value="" /></td>
		<td class="text-center">index</td>
   		<td class="text-center">{{item.name}}</td>
		<td class="text-center">{{item.cdate}}</td>
		<td class="text-center">
			<span class="btn-form-span-1">
				<a href="javaScript:layerWindows('{{item.id}}', '{{item.name}}');" class="btn btn-primary"><i class="icon-pencil"></i>修改</a>
			</span>
			<span class="btn-form-span-1">
				<a href="<%=basePath%>admin/tags/delTag/{{item.id}}" class="btn btn-danger ">删除</a>
			</span>
		</td>
 	 </tr>
	{{# }); }}
	
	</script>


</body>
<div id="collapseOne1" class="panel-collapse collapse">
                        <div class="alert alert-info text-center">
                          <h4> 输入新的标签名</h4> 
                          <hr>
                          <input  type="hidden"  value="item.name">
                          <input class="form-control" type="text" name="tags.name" value="item.name">
                          <hr>
                            <button class="btn btn-info" onclick="addTag()">确定</button>
                        </div>
                    </div>
</html>