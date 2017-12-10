/**
 * summernote 上传文件
 * @param file
 */
function sendFile(files, editor, $editable) {  
        var data = new FormData();  
        data.append("ajaxTaskFile", files[0]);  
        $.ajax({  
            data : data,  
            type : "POST",  
            url : "<%=basePath%>user/saveBlog", //图片上传出来的url，返回的是图片上传后的路径，http格式  
            cache : false,  
            contentType : false,  
            processData : false,  
            dataType : "json",  
            success: function(data) {//data是返回的hash,key之类的值，key是定义的文件名  
                $('#summernote').summernote('insertImage', data.data);  
            },  
            error:function(){  
                alert("上传失败");  
            }  
        });  
    } 