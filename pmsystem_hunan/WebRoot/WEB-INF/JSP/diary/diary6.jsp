<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>会见监区值班日志</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="<%=path%>/css/gkzxcss.css" rel="stylesheet" type="text/css" />
	<script src="<%=path%>/scripts/boot.js" type="text/javascript"></script>
	<script src="<%=path%>/scripts/yzDutyDiary.js" type="text/javascript"></script>
	<link href="<%=path%>/scripts/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />
	
	<style type="text/css">

	body{
		   margin:0;padding:0;border:0;width:100%;height:100%; font-size: 12px;background:#efefef;
	}
	
	.trd {
		margin:0;
		padding:0;
		border: 1px solid black;
	}
	
	 .actionIcons span
       {
           width:16px;
           height:16px;
           display:inline-block;
           background-position:50% 50%;
           cursor:pointer;
       }
       
</style>
</head>
<body>
	<div id="form1" class="mini-toolbar"  style="padding:0px;border-bottom: 0px;">
		<input id="flowdraftid" name="flowdraftid" class="mini-hidden" value="${flowdraftid}"/>
		<input id="diarytype" name="diarytype" class="mini-hidden" value="${diarytype}"/> <!-- 日记类型，3：医疗防疫站值班日志 -->
		<input id="saveflag" name="saveflag" class="mini-hidden" value="0"/> <!-- 是否点击过保存按钮 -->
		<table >
             <tr>
                <td style="width:100%;">
                	&nbsp;&nbsp;
                </td>
                <td style="white-space:nowrap;"> 
                	<!--  
                	<a class="mini-button" iconCls="icon-reload" onclick="refreshPage()" plain="true">刷新</a>
                	&nbsp;
                	-->
                	<a class="mini-button" plain="true" iconCls="icon-save"  onclick="saveData();">保存</a>
                	&nbsp;
					<a class="mini-button" iconCls="icon-cancel"  plain="true" onclick="Close();" >关闭</a>
                </td>
             </tr>
        </table>
	</div>  
	
<form action="">
	<div align="center" >
	<table width="60%"  border=0 cellspacing=0 cellpadding=0  style='border-collapse:collapse;'>
		<tr>
			<td colspan="18" style="height:40px;"><span style="font-size:16px;color:#ADADAD">细节决定成败&nbsp;&nbsp;&nbsp;&nbsp;责任重于泰山</span></td>
		</tr>
		
		<tr>
			<td colspan="18"><span style="font-size:24px;font-weight:bold;">${departname}会见监区值班日志</span></td>
		</tr>
		
		
		<tr height="5px">
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
			<td width="5.56%" style="border:0">&nbsp;</td>
		</tr>
		
		<tr >
			<td colspan="4" style="border:0">日期：<input id="diarydate" name="diarydate" value="${diarydate}" class="mini-datepicker" style="width:100px;" value="" /></td>
			<td colspan="4" style="border:0">
				<input class="mini-combobox" id="weekday" name="weekday" value="${weekday}" style="width:80px;" textField="text" valueField="id" 
    				data="[{id:'星期日',text:'星期日'},{id:'星期一',text:'星期一'},{id:'星期二',text:'星期二'},{id:'星期三',text:'星期三'},{id:'星期四',text:'星期四'},{id:'星期五',text:'星期五'},{id:'星期六',text:'星期六'}]"/>
			</td>
			<td colspan="4" style="border:0">天气：
				<input class="mini-combobox" id="weather" name="weather" value="${weather}" style="width:80px;" textField="text" valueField="id" 
    				data="[{id:'晴',text:'晴'},{id:'晴转多云',text:'晴转多云'},{id:'多云',text:'多云'},{id:'阴',text:'阴'},{id:'雾',text:'雾'},{id:'雨夹雪',text:'雨夹雪'},
    				{id:'雷阵雨',text:'雷阵雨'},{id:'小雨',text:'小雨'},{id:'中雨',text:'中雨'},{id:'大雨',text:'大雨'},
    				{id:'暴雨',text:'暴雨'},{id:'小雪',text:'小雪'},{id:'大雪',text:'大雪'},{id:'冰雹',text:'冰雹'}]" />
			</td>
			<td colspan="6" style="border:0">交接班时间：
				<input id="transferhour" name="transferhour" value="${transferhour}" type="text" style="width:30px" onchange="validateNum(this);"/>&nbsp;时&nbsp;
				<input id="transferminute" name="transferminute" value="${transferminute}" type="text" style="width:30px" onchange="validateNum(this);" />&nbsp;分
			</td>
		</tr>
		
		<tr>
			<td class="trd" style="border-left:solid black 1.5pt;border-top:solid black 1.5pt;">带班<br/>监区<br/>领导</td>
			<td class="trd" colspan="6" style="border-top:solid black 1.5pt;">
				<textarea id="leader" name="leader" style="width:97%;height:60px;overflow-x:hidden;overflow-y:hidden;">${leader}</textarea>
			</td>
			<td class="trd" style="border-top:solid black 1.5pt;">值班<br/>警察</td>
			<td class="trd" colspan="10" align="left" style="border-top:solid black 1.5pt;border-right:solid black 1.5pt;">
				<textarea id="policemen" name="policemen" style="width:98.5%;height:60px;overflow-x:hidden;overflow-y:hidden;">${policemen}</textarea>
			</td>
		</tr>
		
		<tr height="150px">
			<td class="trd" style="border-left:solid black 1.5pt;">会见<br/>情况<br/>记录</td>
			<td class="trd" colspan="17" style="border-right:solid black 1.5pt;" id="td1">
				<div class="mini-fit" height="60px"  id="trid1" style="overflow:hidden;">
				     <div id="datagrid1" class="mini-datagrid" style="height:100%;" idField="id" multiSelect="true"
				     	allowCellEdit="true" allowCellSelect="true" allowAlternating="true" virtualScroll="false" allowCellValid="true"
				     	url="<%=path%>/getDiaryDetailData.json?1=1" showPager="false" onload="onGrid1Load();">
				         <div property="columns">
				         	<div type="checkcolumn" width="0"></div>
				         	<div field="id"  width="0" headerAlign="center"  visible="false" align="center"></div>  
				         	<div field="type"  width="0" headerAlign="center"  visible="false" align="center"></div>
				            <div field="orgid" vtype="required" displayField="orgname"  width="20%" headerAlign="center"  align="center">会见监区
				                <input property="editor" class="mini-combobox"  style="width:100%;"url="<%=path%>/getDepartList.action?1=1&qtype=jianqu&type=all" valueField="ORGID" textField="NAME"/> 
				            </div>
				            
				            <div field="meetnum"  vtype="required;int" width="10%" headerAlign="center"  align="center">会见人数
				            	<input property="editor" class="mini-textbox"  allowInput="true"  style="width:100%;"/> 
				            </div>  
				            <div field="spolicemen" vtype="required" width="20%" headerAlign="center"  align="center" >带领警察
				            	<input property="editor" class="mini-textbox"  allowInput="true"  style="width:100%;"/> 
				            </div> 
				            <div header="会见时间" headerAlign="center">
                				<div property="columns">
                					 <div field="smeethour" vtype="int" width="10%" headerAlign="center"   align="center"  >起始时
						                <input property="editor" class="mini-textbox"  allowInput="true"  style="width:100%;"/> 
						            </div>   
						            <div field="smeetminute" vtype="int" width="10%" headerAlign="center"   align="center"  >起始分
						                <input property="editor" class="mini-textbox"  allowInput="true"  style="width:100%;"/> 
						            </div>
						            <div field="emeethour" vtype="int" width="10%" headerAlign="center"   align="center"  >结束时
						                <input property="editor" class="mini-textbox"  allowInput="true"  style="width:100%;"/> 
						            </div>
						            <div field="emeetminute" vtype="int" width="10%" headerAlign="center"   align="center"  >结束分
						                <input property="editor" class="mini-textbox"  allowInput="true"  style="width:100%;"/> 
						            </div>     
                				</div>
                			</div>
                			
                			<div width="10%" cellCls="actionIcons" name="action"  headerAlign="center" align="center" renderer="onActionRenderer1" cellStyle="padding:0;">
				            	<span class="icon-new" title="增加记录" onclick="newRow1()"　align="center">&nbsp;&nbsp;&nbsp;&nbsp;</span>
				            </div>     
				        </div>
				    </div>   
				</div>
			</td>
		</tr>
		
		
		<tr height="150px">
			<td class="trd" style="border-left:solid black 1.5pt;">当日<br/>要事<br/>记载<br/>及<br/>处理<br/>情况</td>
			<td class="trd" colspan="17" style="border-right:solid black 1.5pt;" align="left">
				<table style="width:100%;height:100%;">
					<tr>
						<td>
							<textarea id="businessrecord" name="businessrecord"  style="width:99%;height:150px;overflow-x:hidden;overflow-y:hidden;">${businessrecord}</textarea>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr height="80px" valign="top">
			<td class="trd" valign="center" style="border-left:solid black 1.5pt;">交接<br/>提示</td>
			<td class="trd" colspan="17" style="border-right:solid black 1.5pt;" align="left">
			
				<table style="width:100%;height:100%;">
					<tr>
						<td colspan="2">
							<textarea id="handovertips" name="handovertips"  style="width:99%;height:50px;overflow-x:hidden;overflow-y:hidden;">${handovertips}</textarea>
						</td>
					</tr>
					<tr align="center">
						<td>
							交班警察：<input id="submitpolice" name="submitpolice" value="${submitpolice}" type="text" style="width:120px" />
						</td>
						<td>
							接班警察：<input id="receivepolice" name="receivepolice" value="${receivepolice}" type="text" style="width:120px" />
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
		
		<tr height="80px">
			<td class="trd" style="border-left:solid black 1.5pt;border-bottom:solid black 1.5pt;">巡查<br/>督察</td>
			<td class="trd" colspan="17" style="border-right:solid black 1.5pt;border-bottom:solid black 1.5pt;" align="left">
				<table style="width:100%;height:100%;">
					<tr>
						<td>
							<textarea id="inspector" name="inspector"  style="width:99%;height:75px;overflow-x:hidden;overflow-y:hidden;">${inspector}</textarea>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
	</table>
	
	<p>&nbsp;</p>
 </div>
 </form>
 
<script type="text/javascript">

    mini.parse();
    var grid1 = mini.get("datagrid1");
    
   function reLoadGrid(flowdraftid, operatetype){
    	if(flowdraftid){
    		grid1.load({flowdraftid:flowdraftid, type:"60", operatetype:operatetype});
    	}
    }
   
   /*
   function onGrid1Load(){
	   var num1 = grid1.getData().length;
	   	if(num1 >3){
	   		addHeight(25 *(num1 - 3) , "trid1", "datagrid1");
	   	}else{
	   		var saveflag = mini.get("saveflag").getValue();
	   		if(0 == saveflag){
	   			addHeight(20 , "trid1", "datagrid1");
	   		}
	   	}
   }
   
   function onGrid2Load(){
	   var num2 = grid2.getData().length;
	   	if(num2 >3){
	   		addHeight(25 *(num2 - 3) , "trid2", "datagrid2");
	   	}else{
	   		var saveflag = mini.get("saveflag").getValue();
	   		if(0 == saveflag){
	   			addHeight(20 , "trid2", "datagrid2");
	   		}
	   	}
   }
   
   function onGrid3Load(){
	   var num3 = grid3.getData().length;
	   	if(num3 >3){
	   		addHeight(25 *(num3 - 3) , "trid3", "datagrid3");
	   	}else{
	   		var saveflag = mini.get("saveflag").getValue();
	   		if(0 == saveflag){
	   			addHeight(20 , "trid3", "datagrid3");
	   		}
	   	}
   }
   */
    
    function saveData(){
    	//先验证表单数据是否附合（如：小时范围0-24，分范围：0-60），后继再处理
    	
    	var formMap = getFormMapData();//获取form数据
    	var diarytype = mini.get("diarytype").getValue();
    	formMap["diarytype"] = diarytype;
    	
    	var flowdraftid = mini.get("flowdraftid").getValue();
    	if(flowdraftid){
    		formMap["flowdraftid"] = flowdraftid;
    	}
    	var formdata = mini.encode([formMap]);
    	//grid1.validate();
    	var flag = grid1.isValid();
    	if(false == flag){
    		alert("会见情况记录，数据有错！");
    		return;
    	}
    	
		var rows1Data = grid1.getChanges();
        var grid1data = mini.encode(rows1Data);
    	
        $.ajax({
            url: "<%=path %>/saveDiaryData.json?1=1",
            data: {formdata:formdata, grid1data:grid1data},
            dataType:"text",
            type:"POST",
            success: function (text){
            	var data = mini.decode(text);
            	if('success' == data.status){
            		mini.get("flowdraftid").setValue(data.flowdraftid);
            		mini.get("saveflag").setValue(1);
            		reLoadGrid(data.flowdraftid, 'edit'); //保存后，只查询保存后的数据
            		alert("操作成功！");
            	}else{
            		alert("操作失败！");
            	}
            	//Close();
            }
        });
    	
    }
    
    function newRow1(){
    	newRow(grid1, "trid1", "datagrid1", "60");
    }
    function delRow1(row_uid){
    	delRow(row_uid, grid1, "trid1", "datagrid1");
    }
    
     //
    var operatetype = '${operatetype}';
     var flowdraftid = '${flowdraftid}';
     if(operatetype && 'new' == operatetype){
    	initial(); //初始化日期、星期
    	reLoadGrid(null, operatetype);
     }else if(operatetype && 'edit' == operatetype){
     	reLoadGrid(flowdraftid, operatetype);
     }
 	
    function SetData(data){
    	//data = mini.clone(data);
    	//mini.get("svtype").setValue(data.svtype);
    }
    
</script>
</body>
</html>