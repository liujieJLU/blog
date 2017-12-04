<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>管理员登录</title>

    <link href="<%=basePath%>static/css/common/bootstrap.css" rel="stylesheet" />
    <link href="<%=basePath%>static/css/common/font-awesome.css" rel="stylesheet" />
    <link href='<%=basePath%>static/css/common/fonts.css' rel='stylesheet' type='text/css' />
	<script type="text/javascript" src="<%=basePath%>static/js/jquery.js"></script>
  </head>
  
  <body style="background-color: #E2E2E2;">
    <div class="container">
        <div class="row text-center " style="padding-top:100px;">
            <div class="col-md-12">
                <img src="static/images/logo-invoice.png" />
            </div>
        </div>
         <div class="row ">
               
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                           
                            <div class="panel-body">
                                <form role="form" id="loginForm" action="<%=basePath%>admin/user/login" method="post">
                                    <hr />
                                    <h5>Enter Details to Login</h5>
                                       <br />
                                      
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-tag"  ></i></span>
                                            <input type="text" name="user.username" class="form-control" placeholder="Your Username " />
                                     </div>
                                     <div class="form-group input-group">
                                          	<span class="input-group-addon"><i class="fa fa-lock"  ></i></span>
                                            <input type="password" name="user.password" class="form-control"  placeholder="Your Password" />
                                 	 </div>
                                 	 
                                    <div class="form-group">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" /> Remember me
                                            </label>
                                            <span class="pull-right">
                                                   <a href="index.html" >Forget password ? </a> 
                                            </span>
                                    </div>
                                     
                                    <input type="submit" class="btn btn-primary " value="Login Now">
                                    <hr />
                                    Not register ? <a href="index.html" >click here </a> or go to <a href="index.html">Home</a> 
                                </form>
                            </div>
                           
                        </div>
                
                
        </div>
    </div>

</body>
</html>
