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
  </body>
</html>
