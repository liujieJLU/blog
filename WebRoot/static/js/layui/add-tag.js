/**
  项目JS主入口
  以依赖Layui的layer和form模块为例
**/    
layui.define(['layer', 'form'], function(exports){
  var layer = layui.layer;
  var form = layui.form();
  
  form.on('submit(tagForm)', function(res){
	    layer.msg(JSON.stringify(res.field));
	    console.log("===="+JSON.stringify(res.field));
	    console.log("===="+res.value);
	    console.log("===="+res.elem);
	    $.ajax({
	    	type:"post",
	    	url:"tags/addTag",
	    	data:JSON.stringify(res.field),
	    	success: function(data){
	    		if(data.code == 0){
	    			 layer.msg("添加成功！");
	    		}else{
	    			layer.msg("添加失败！");
	    		}
	    	}
	    });
	    return false;
	  });
  	form.on('tagName', function(data){
  		 layer.msg('Hello World');
		console.log(data);
	});
  exports('add-tag', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
}); 
