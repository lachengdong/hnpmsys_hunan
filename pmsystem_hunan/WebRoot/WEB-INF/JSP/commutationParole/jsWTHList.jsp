<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>委托函（假释）1</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="<%=path%>/css/gkzxcss.css" rel="stylesheet" type="text/css" />
    <script src="<%=path%>/scripts/boot.js" type="text/javascript"></script> 
     <link href="<%=path%>/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" /> 
     <script src="<%=path%>/scripts/validate.js" type="text/javascript"></script> 
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }   
    </style>
</head>
<body onload="init('${menuid}');">
       <div class="mini-toolbar"  style="padding:2px;border-bottom: 0px;">
       <jsp:include page="/WEB-INF/JSP/form/buttoncontrol.jsp"></jsp:include>
            <table >
               <tr>
                <td style="width:100%;">
       	 			<a class="mini-button" iconCls="icon-add" plain="true" style="display:none;"  id="11762" onclick="add('11762');">新增</a>
<!--           			<a class="mini-button" iconCls="icon-remove" plain="true" style="display:none;" id="11764" onclick="shanchu();">批量删除</a>-->
           			<a class="mini-button" iconCls="icon-download" plain="true" style="display:none;" id="12858" onclick="saveNext()">下一个</a>
    				<a class="mini-button" style="" id="" iconCls="icon-close" plain="true" onclick="onCanle();">关闭</a>
    				<span style="padding-left:40px;">罪犯编号：${crimid}</span>
       			    <span style="padding-left:10px;">姓名：${name}</span>
                </td>
                <td style="white-space:nowrap;">
<!--                	<input id="key" class="mini-textbox" vtype="maxLength:50;" emptyText="文书简介" style="width:130px;" onenter="onKeyEnter"/>   -->
<!--                    <a class="mini-button" iconCls="icon-search"  plain="true" onclick="search()">快速查询</a>-->
					<!-- 操作说明 -->
		 			<a class="mini-button" plain="true" iconCls="icon-help" onclick="chakanshuoming('10179')"></a>
                </td>
               </tr>
		</table>
		 
    </div>
   <div class="mini-fit">
	    <div id="datagrid" allowMoveColumn="false" onrowdblclick="rowdblclickfunction" style="width:100%;height:100%;" class="mini-datagrid"  allowResize="false" 
	    url="getJSWTHList.action?1=1&tempid=SZXF_JSWTH&crimid=${crimid}" idField="" multiSelect="true" allowAlternating="true" sizeList="[10,20,50,100]" pageSize="20" showLoading="true">
	        <div property="columns">
<!--        		<div type="checkcolumn" width="15px"></div>-->
	    	    <div field="introduction" headerAlign="center" align="left" allowSort="true" width="100px;">文书简介</div>
	    	    <div field="departid" headerAlign="center" align="center" allowSort="true" width="30px;">部门</div>
	    	    <div field="opid" headerAlign="center"  align="center" allowSort="true" width="30px">操作人</div>
	    	    <div field="optime" headerAlign="center"  align="center" allowSort="true" renderer="onDateRenderer" width="30px">操作时间</div>             
               	<div name="action" width="60px" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
	        </div>
	    </div>
    </div>
	<script type="text/javascript"> 
	 mini.parse();
     var datagrid = mini.get("datagrid");
     datagrid.load();
     datagrid.sortBy("docid", "desc");
     function onActionRenderer() {
     	var s = document.getElementById("middlebtns").value;// 资源resid 中间逗号隔开
	    return s;
     }
 	function add(menuid){
 		var crimid=mini.get("crimid").getValue();
 		mini.open({
 	        url: "toJSWTHAdd.action?1=1&tempid=SZXF_JSWTH&menuid="+menuid+"&crimid="+crimid,
 	        showMaxButton: true,
 	        allowResize: false,
 	        title: "委托函（假释）", width: 900, height: 500,
 	        onload: function () {
 	            var iframe = this.getIFrameEl();
 	            var data = { action: "new"};
 	            iframe.contentWindow.SetData(data);
 	        },
 	        ondestroy: function (action) {
 	        	datagrid.reload();
 	        }
 	    });	
 	 }
    //查看
	function chakan(menuid) {
		var row =datagrid.getSelected();//获取选中记录
    	mini.open({
            url: "editJSWTH.action?1=1&docid="+row.docid+"&menuid="+menuid,
            showMaxButton: true,
         	allowResize: false, 
            title: "委托函（假释）", width: 900, height: 500,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action:"show" };
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (text){
            	datagrid.reload();
            }
        });
	}     
	 //修改
	function xiugai(menuid) {
		var row = datagrid.getSelected();//获取选中记录
		var crimid = mini.get("crimid").getValue();
    	mini.open({
            url: "editJSWTH.action?1=1&docid="+row.docid+"&crimid="+crimid+"&menuid="+menuid,
            showMaxButton: true,
         	allowResize: false, 
            title: "委托函（假释）", width: 900, height: 500,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action:"edit" };
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action){
            	datagrid.reload();
            }
        });
	}        
	//删除
    function shanchu(){
    	var row = datagrid.getSelected();
        if (row) {
            if (confirm("确定删除选中记录？")) {
                datagrid.loading("操作中，请稍后......");
                $.ajax({
                    url: "deleteJSWTH.action?1=1&docid="+row.docid,
                    type: "post",
                    success: function (text) {
                	datagrid.reload();
                    },
                    error: function () {
                    alert("操作失败!");
                    }
                });
            }
        } else {
            alert("请选中一条记录");
        }
	}
	 function saveNext (){
	    	var id = mini.get("id").getValue();
	        var index = id.indexOf(",");
	        id = id.substring(index+1,id.length);
	        var idname = '${idname}';
	        var indexname = idname.indexOf(",");
	        idname = idname.substring(indexname+1,idname.length);
	        var url= "toJSWTHPage.action?1=1&id="+id+"&menuid=${menuid}&idname="+idname;
	        if(index>0){
	            self.location.href=url;
	        }else{
	        	//alert("批量处理已完成！");
	        	onCanle();
	        }
	    }
	//关闭列表页返回到罪犯处理
	function onCanle(){
		var url = "DoJSWTHPage.action?1=1";
		self.location.href=url;
	}
	//快速查询
    function onKeyEnter(e) {
        search();
    }
    function search() {
        var key = mini.get("key").getValue();
    	grid.sortBy("docid","desc");
        grid.load({ key: key });
    }
</script>
</body>
</html>