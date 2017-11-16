<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>监外执行移交管理</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="<%=path%>/css/gkzxcss.css" rel="stylesheet" type="text/css" />
    <link href="<%=path%>/css/pmisystem.css" rel="stylesheet" type="text/css" />
    <script src="<%=path%>/scripts/boot.js" type="text/javascript"></script>
    <link href="<%=path%>/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" /> 
     <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }  
    </style>
    <script type="text/javascript">
     	var confirmMessage = "请选中一条记录！";
     	var confirmMessages = "请至少选中一条记录！";
    </script>
</head>
<body onload="init('10159')">  
    <div class="mini-toolbar"  style="padding:0px;border-bottom: 0px;">
   	 <input id="menuid" name="menuid" type="hidden" value="${menuid}"/>
    <jsp:include page="/WEB-INF/JSP/form/buttoncontrol.jsp"></jsp:include>
        <table >
             <tr>
                <td style="width:100%;">
                  	 <a class="mini-button" style="display:none;" id="12755" iconCls="" plain="true" onclick="chooseAll('10159_01');">批量处理</a>
                </td>
                <td style="white-space:nowrap;"> 
                   <input id="key" class="mini-textbox" vtype="maxLength:50;" emptyText="请输入罪犯编号、姓名、拼音" style="width:130px;" onenter="onKeyEnter"/>   
                   <a class="mini-button" iconCls="icon-search"  plain="true" onclick="search()">快速查询</a>
                   <a class="mini-button" plain="true" iconCls="icon-help" onclick="chakanshuoming('${menuid}')"></a>
                 </td>
             </tr>
        </table>
    </div>
    <div class="mini-fit" id="div_two">
        <div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" allowResize="false" sizeList="[10,20,50,100]" pageSize="20"
        	 url="getTemporaryProbationHandedManagementBasicInfoList.action?1=1" idField="spid" multiSelect="true" allowAlternating="true" virtualScroll="false" 
        	 showLoading="false" onbeforeload="myloading" onload="myunmask">
          <div property="columns">
             <div type="checkcolumn" width="30"></div>
	            <div field="crimid" width="60" headerAlign="center" align="center"  allowSort="true">罪犯编号</div>    
	            <div field="name" width="60" headerAlign="center" align="center"  allowSort="true">姓名</div>
	            <div field="gender" width="40" headerAlign="center" align="center"  allowSort="true">性别</div>
	            <div field="birthday" width="60" headerAlign="center" align="center"  allowSort="true" renderer="onDateRenderer">出生日期</div>
	            <div field="nation" width="60" headerAlign="center" align="center"  allowSort="true">民族</div> 
	            <div field="familyaddress" width="120" headerAlign="center" align="left"  allowSort="true">家庭住址</div>
	            <div field="accent" width="60" headerAlign="center" align="center"  allowSort="true">所在监区</div>  
	            <div field="identity" width="40" headerAlign="center" align="center"  allowSort="true">处理状态</div>
	            <div id="action" width="50" headerAlign="center" align="center" allowSort="false" renderer="onActionRenderer">操作</div>
          </div>
        </div>
    </div>
    <script type="text/javascript">
        mini.parse();
        var grid = mini.get("datagrid1");
        	grid.sortBy("crimid","desc");
        	grid.load();
        // 渲染日期
        function onDateRenderer(e) {
        	if(e && e.value){
        		return mini.formatDate ( new Date(e.value), "yyyy-MM-dd" );
        	}
            return "";
        }
        
          function onActionRenderer(e) {
	        var record = e.record;
	        var s = '';
	        if(record.duty=='0'){
        		s += ' <a class="Edit_Button"  href="javascript:chooseOne(\'10159_01\');" >处理</a>';
        	}else if(record.duty=='1'){
        		s += ' <a class="Edit_Button"  href="javascript:chooseOne(\'10159_01\');" >修改</a>';
        		s += ' <a class="Edit_Button"  href="javascript:chooseOne(12828);" >查看</a>';
        	}
            return s;
        }
        function onStatusRenderer(){
        	var s = "";
        	var row = grid.getSelected();
        	s ='未处理&nbsp;&nbsp';
        	/*if(){
        		s ='未处理&nbsp;&nbsp';
        	}else if(){
        		s ='已处理&nbsp;&nbsp';
        	}else if(){
        		s ='正在处理&nbsp;&nbsp';
        	}*/
            return s;
        }
        
        function chooseOne(menuid) {
        	var row = grid.getSelected();
        	var url = "temporaryProbationHandedManagementAdd.action?1=1&crimid="+row.crimid+"&menuid="+menuid+"&tempid=GDSJ_JWZX_JWZXYJGL";
			self.location.href=url;
        }
         function chooseAll(menuid){
	    	var tempid = mini.get("tempid").getValue();
	    	var rows = grid.getSelecteds();
	   		if (rows.length > 0) {
	                if (confirm("确定批量处理选中记录？")) {
	                    var ids = [];
	                    for (var i = 0; i < rows.length; i++) {
	                        var r = rows[i];
	                        ids.push(r.crimid);
	                    }
	                    var id = ids.join(',');
	                   	var url = "temporaryProbationHandedManagementAdd.action?1=1&id="+id+"&menuid="+menuid;
						window.location.href=url;
	                }
	            } else {
	                alert(confirmMessages);
	            }
	     }
        
       
        //快速查询
        function onKeyEnter(e) {
            search();
        }
        function search() {
            var key = mini.get("key").getValue();
        	grid.sortBy("crimid","desc");
            grid.load({ key: key });
        }
        function myloading(){
			var myform = new mini.Form("div_two");
			myform.loading();
		}
		function myunmask() {
			var myform = new mini.Form("div_two");
			myform.unmask();
		}
    </script>    
</body>  
</html>