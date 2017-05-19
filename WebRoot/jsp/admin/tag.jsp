<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String css = (String)this.getServletContext().getAttribute("token.css");
String js = (String)this.getServletContext().getAttribute("token.js");
%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>blog admin for backend systems</title>
     <!-- BOOTSTRAP STYLES-->
    <link href="<%=basePath%>static/css/common/bootstrap.css?t=<%=css%>" rel="stylesheet" />
    <link href="<%=basePath%>static/css/common/font-awesome.css?t=<%=css%>" rel="stylesheet" />
    <link href="<%=basePath%>static/css/common/fonts.css?t=<%=css%>" rel="stylesheet" />
    <link href="<%=basePath%>static/css/common/summernote.css?t=<%=css%>" rel="stylesheet" />
    <link href="<%=basePath%>static/css/style/basic.css?t=<%=css%>" rel="stylesheet" />
    <link href="<%=basePath%>static/css/style/custom.css?t=<%=css%>" rel="stylesheet" />
    <link href="<%=basePath%>static/css/style/common.css?t=<%=css%>" rel="stylesheet" />
    <link href="<%=basePath%>static/layui/css/layui.css?t=<%=css%>" rel="stylesheet" />
    


  </head>
  
  <body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">COMPANY NAME</a>
            </div>

            <div class="header-right">

                <a href="message-task.html" class="btn btn-info" title="New Message"><b>30 </b><i class="fa fa-envelope-o fa-2x"></i></a>
                <a href="message-task.html" class="btn btn-primary" title="New Task"><b>40 </b><i class="fa fa-bars fa-2x"></i></a>
                <a href="login.html" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x"></i></a>

            </div>
     </nav>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <div class="user-img-div">
                            <img src="<%=basePath%>static/images/user.png" class="img-thumbnail" />

                            <div class="inner-text">
                                Max Ma Chao
                            <br />
                                <small>Last Login : 2 Weeks Ago </small>
                            </div>
                        </div>

                    </li>


                    <li class="active">
                        <a  href="index.html"><i class="fa fa-dashboard "></i>博客管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=basePath%>jsp/admin/main.jsp"><i class="fa fa-edit"></i>新建博文</a>
                            </li>
                            <li>
                                <a class="active-menu" href="<%=basePath%>jsp/admin/tag.jsp"><i class="fa fa-edit"></i>标签管理</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-desktop "></i>UI Elements <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="panel-tabs.html"><i class="fa fa-toggle-on"></i>Tabs & Panels</a>
                            </li>
                            <li>
                                <a href="notification.html"><i class="fa fa-bell "></i>Notifications</a>
                            </li>
                             <li>
                                <a href="progress.html"><i class="fa fa-circle-o "></i>Progressbars</a>
                            </li>
                             <li>
                                <a href="buttons.html"><i class="fa fa-code "></i>Buttons</a>
                            </li>
                             <li>
                                <a href="icons.html"><i class="fa fa-bug "></i>Icons</a>
                            </li>
                             <li>
                                <a href="wizard.html"><i class="fa fa-bug "></i>Wizard</a>
                            </li>
                             <li>
                                <a href="typography.html"><i class="fa fa-edit "></i>Typography</a>
                            </li>
                             <li>
                                <a href="grid.html"><i class="fa fa-eyedropper "></i>Grid</a>
                            </li>
                            
                           
                        </ul>
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-yelp "></i>Extra Pages <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="invoice.html"><i class="fa fa-coffee"></i>Invoice</a>
                            </li>
                            <li>
                                <a href="pricing.html"><i class="fa fa-flash "></i>Pricing</a>
                            </li>
                             <li>
                                <a href="component.html"><i class="fa fa-key "></i>Components</a>
                            </li>
                             <li>
                                <a href="social.html"><i class="fa fa-send "></i>Social</a>
                            </li>
                            
                             <li>
                                <a href="message-task.html"><i class="fa fa-recycle "></i>Messages & Tasks</a>
                            </li>
                            
                           
                        </ul>
                    </li>
                    <li>
                        <a href="table.html"><i class="fa fa-flash "></i>Data Tables </a>
                        
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-bicycle "></i>Forms <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                           
                             <li>
                                <a href="form.html"><i class="fa fa-desktop "></i>Basic </a>
                            </li>
                             <li>
                                <a href="form-advance.html"><i class="fa fa-code "></i>Advance</a>
                            </li>
                             
                           
                        </ul>
                    </li>
                      <li>
                        <a href="gallery.html"><i class="fa fa-anchor "></i>Gallery</a>
                    </li>
                     <li>
                        <a href="error.html"><i class="fa fa-bug "></i>Error Page</a>
                    </li>
                    <li>
                        <a href="login.html"><i class="fa fa-sign-in "></i>Login Page</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap "></i>Multilevel Link <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="#"><i class="fa fa-bicycle "></i>Second Level Link</a>
                            </li>
                             <li>
                                <a href="#"><i class="fa fa-flask "></i>Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link<span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#"><i class="fa fa-plus "></i>Third Level Link</a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-comments-o "></i>Third Level Link</a>
                                    </li>

                                </ul>

                            </li>
                        </ul>
                    </li>
                   
                    <li>
                        <a href="blank.html"><i class="fa fa-square-o "></i>Blank Page</a>
                    </li>
                </ul>

            </div>
		</nav>
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
	
	$(function(){
		showTags("1");
	});
	
	function showTags(page){
		layui.define(['layer', 'form','laytpl','laypage'], function(){
			  var layer = layui.layer;
			  var form = layui.form();
			  var laytpl = layui.laytpl;
			  var $ = layui.jquery;
			  var laypage = layui.laypage;
		$.ajax({
	    	type:"post",
	    	url:"<%=basePath%>admin/tags",
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

	
	</script>
	<script id="tagsTemplate" type="text/template">
	{{#  layui.each(d.list, function(index, item){ }}
	<tr class="list-group-item-success">
   		<td><input type="checkbox" value="" /></td>
		<td class="text-center">index</td>
   		<td class="text-center">{{item.name}}</td>
		<td class="text-center">{{item.cdate}}</td>
		<td class="text-center"><span class="btn-form-span-1"><a href="#" class="btn btn-primary"><i class="icon-pencil"></i>修改</a></span><span class="btn-form-span-1"><a href="#" class="btn btn-danger ">删除</a></span></td>
 	 </tr>
	{{# }); }}
	
	</script>


</body>
</html>