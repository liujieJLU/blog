<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../main/title.jsp" %>
  
  <body>
    <div id="wrapper">
        <%@ include file="../main/top.jsp" %>
        <%@ include file="../main/left.jsp" %>
        
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">类别管理</h1>
                        <h1 class="page-subhead-line">你可以为你的任意一个博文添加到一个类别，在这里可以增加、删除或者修改分类，</h1>

                    </div>
                </div>
                <!-- /. ROW  -->
                <div class="row">
		<div class="col-md-8 col-sm-6 col-xs-12">
            <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a id="addCateGory" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">新建类别</a>
                        </h4>
                    </div>
                    <div class="panel-body">
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="alert alert-info text-center">
                          <h4> 输入新的类别名：</h4> 
                          <hr>
                          <input class="form-control" type="text" id="categoryName" name="category.name">
                          <hr>
                            <button class="btn btn-info" onclick="addCategory()">确定</button>
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
                        <th class="text-center">操作${category.totalRow}</th>
                      </tr>
                    </thead>
                    <tbody id="tbcategory">
                    
			<c:forEach items = "${category.list}" var="list">
				<tr class="list-group-item-danger">
					<td><input type="checkbox" value="" /></td>
					<td class="text-center">index</td>
 			  		<td class="text-center">${list.name}</td>
					<td class="text-center">${list.cdate}</td>
					<td class="text-center">
						<span class="btn-form-span-1">
							<a href="javaScript:layerWindows('${list.id}', '${list.name}');" class="btn btn-primary"><i class="icon-pencil"></i>修改</a>
						</span>
						<span class="btn-form-span-1">
							<a href="<%=basePath%>admin/category/delCategory/${list.id}" class="btn btn-danger ">删除</a>
						</span>
					</td>
				</tr>
			</c:forEach>        
                    </tbody>
                  </table>
			<div id="pageCategory"></div>
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
		showPage("${category.pageNumber}");
	});
	
	function showPage(page){
		layui.use(['layer', 'laypage'], function(){
			var laypage = layui.laypage;
			laypage({
			    cont: 'pageCategory',
			    pages: "${category.totalPage}", //得到总页数 
			    groups: '5',
			    curr: page,
			    jump: function(obj, first){
			    	if(!first){
			    		window.location.href ='<%=basePath%>admin/category/'+ obj.curr;
			    		/* showPage(obj.curr); */
			    	}
			    }
			  });
		});
	}
	
	/* 添加标签 */
	function addCategory(){
		layui.use(['layer', 'form','laytpl'], function(){
			  var layer = layui.layer;
			  var form = layui.form();
		 $.ajax({
		    	type:"post",
		    	url:"<%=basePath%>admin/category/addCategory",
		    	data:{"category.name":$("#categoryName").val()},
		    	success: function(data){
		    		if(data.code == 0){
		    			layer.msg("添加成功！");
		    			setTimeout("window.location.href ='<%=basePath%>admin/category'", 2000);
		    		}else{
		    			layer.msg("添加失败！"+data.message);
		    		}
		    	}
		    });
		}); 
	}
	
	
	function showCategory(page){
		layui.define(['layer', 'form','laytpl','laypage'], function(){
			  var layer = layui.layer;
			  var form = layui.form();
			  var laytpl = layui.laytpl;
			  var $ = layui.jquery;
			  var laypage = layui.laypage;
		$.ajax({
	    	type:"post",
	    	url:"<%=basePath%>admin/category/getCateList",
	    	data:{pageNumber:page},
	    	success: function(element){
	    		if(element.code == 0){
	    			laytpl($("#categoryTemplate").html()).render(element.data.categoryList,function(html){
	    				$("#tbcategory").html(html);
	    			});
	    			  laypage({
	    	  			    cont: 'pageCategory',
	    	  			    pages: Math.ceil(element.data.pageCount/5), //得到总页数 
	    	  			    groups: '5',
	    	  			    curr: page,
	    	  			    jump: function(obj, first){
	    	  			    	if(!first){
	    	  			    		showcategory(obj.curr);
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
	
	function layerWindows(categoryId, categoryName){
		console.log("分类：========：" + categoryName);
		layui.use('layer', function(){
			  var layer = layui.layer;
			  
			  layer.open({
				  type: 1,
				  area: ['700px', '300px'],
				  content: '<div class="alert alert-info text-center"><h4> 输入新的标签名</h4><hr><input  type="hidden" id="categoryEditId" value="'+categoryId+'">'+
				  '<input class="form-control" type="text" id="categoryEditName" name="category.name" value="'+categoryName+'">'+
				  '<hr><button class="btn btn-info" onclick="editCategory()">确定</button></div>'
					  
				}); 
			});   
	}
	/* 修改标签 */
	function editCategory(){
	
	layui.use(['layer', 'form','laytpl'], function(){
		  var layer = layui.layer;
		  var form = layui.form();
	 $.ajax({
	    	type:"post",
	    	url:"<%=basePath%>admin/category/editCategory",
	    	data:{"category.id":$("#categoryEditId").val(), "category.name":$("#categoryEditName").val()},
	    	success: function(data){
	    		if(data.code == 0){
	    			layer.msg(data.message);
	    			setTimeout("window.location.href ='<%=basePath%>admin/category'", 1500);
	    		}else{
	    			layer.msg("修改失败！"+data.message);
	    		}
	    	}
	    });
	}); 
}
	</script>



</body>
<div id="collapseOne1" class="panel-collapse collapse">
                        <div class="alert alert-info text-center">
                          <h4> 输入新的标签名</h4> 
                          <hr>
                          <input  type="hidden"  value="item.name">
                          <input class="form-control" type="text" name="category.name" value="item.name">
                          <hr>
                            <button class="btn btn-info" onclick="addCategory()">确定</button>
                        </div>
                    </div>
</html>