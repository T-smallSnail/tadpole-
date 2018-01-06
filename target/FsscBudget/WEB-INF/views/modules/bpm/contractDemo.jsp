<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib uri="http://eos.primeton.com/tags/workflow/base" prefix="wfBase" %>
<html>
<head>
    <title>processInstance</title>
    <meta name="decorator" content="default"/>
    <link href="${ctxStatic}/jqGrid/4.6/css/ui.jqgrid.css" rel="stylesheet" type="text/css" />
    <script src="${ctxStatic}/jqGrid/4.6/i18n/grid.locale-cn.js" type="text/javascript"></script>
    <script src="${ctxStatic}/jqGrid/4.6/js/jquery.jqGrid.min.js"></script>
    <script src="${ctxStatic}/jqGrid/4.6/plugins/grid.complexHeaders.js" type="text/javascript"></script>
    <script src="${ctxStatic}/../workflow/wfcomponent/web/js/Graphic.js" type="text/javascript"></script>

    <script>
         /**** 获取流程定义信息并提交启动流程 begin ****/
        function collectProcessDefInfo() {
            //起草合同人
            var propesorId = $("#propesor").val();

            /*******  获取选择部门 begin **********/
            var departmentItems = document.getElementsByName("department");
            var departmentIds = "";
            for(i = 0; i < departmentItems.length; i++) {
                if(departmentItems[i].checked) {
                    departmentIds = departmentIds + departmentItems[i].value + ",";
                }
            }
            departmentIds = departmentIds.substring(0, departmentIds.length-1);
            /*******  获取选择部门 end **********/

            /*******  获取选择领导 begin **********/
            var leaderItems = document.getElementsByName("leader");
            var leaderIds = "";
            for(i = 0; i < leaderItems.length; i++) {
                if(leaderItems[i].checked) {
                    leaderIds = leaderIds + leaderItems[i].value + ",";
                }
            }
            leaderIds = leaderIds.substring(0, leaderIds.length-1);
            /*******  获取选择领导 end **********/

            /*******  提交流程 begin **********/
            $.jBox.tip("正在提交流程......");
            $.ajax({
                async:true,
                url: ctx + "/contractDemo/startContractProcess",
                type: "POST",
                dataType: "json",
                data: {
                    'userId' : propesorId,
                    'leadersId' : leaderIds,
                    'departmentIds' : departmentIds
                },
                success: function(data){
                    if(data.result == '1') {
                        $.jBox.tip('创建成功，流程id:'+data.message, 'success');
                    } else {
                        $.jBox.tip('创建失败'+data.message, 'success');
                    }

                }
            });
        }
         /**** 获取流程定义信息并提交启动流程 end ****/

         /**** 查询流程工作项与执行流程工作项相关 begin ****/
        $(function () {
            //初始化列表
            AlreadyworkPageInit();
        });

        //列表定义
        function AlreadyworkPageInit() {
            $("#workflowInfo").jqGrid(
                {
                    datatype: "json",
//                    datatype : "local",
                    colNames: [
                        '任务Id',
                        '任务名称',
                        '任务详情',
                        '所属流程',
                        '所属流程Id',
                        '所属业务流程',
                        '所属业务流程定义名称',
                        '开始时间',
                        '是否超时',
                        '活动定义Id',
                        '活动实例Id',
                        '活动定义名称',
                        '操作'
                    ],
                    colModel: [
                        {name: 'workItemId', index: 'workItemId', width: 100, hidden:true},
                        {name: 'workItemName', index: 'workItemName', width: 100,align: "center"},
                        {name: 'workItemDesc', index: 'workItemDesc', width: 200},
                        {name: 'processInstName', index: 'processInstName', width: 200},
                        {name: 'processInstID', index: 'processInstID', width: 100, hidden: true},
                        {name: 'processChName', index: 'processChName', width: 200, align: "center"},
                        {name: 'processDefName', index: 'processDefName', width: 200, hidden: true},
                        {name: 'startTime', index: 'startTime', width: 150, sortable: false, align: "center"},
                        {name: 'isTimeOut', index: 'isTimeOut', width: 120, align: "center"},
                        {name: 'activityDefID', index: 'activityDefID', width: 120, align: "center", hidden: true},
                        {name: 'activityInstID', index: 'activityInstID', width: 120, align: "center", hidden: true},
                        {name: 'activityInstName', index: 'activityInstName', width: 120, align: "center", hidden: true},
                        {name: 'operation', index: 'operation', width: 200,
                            formatter: function (cellValue, options, rowObject) {
                                var selectHtml="<a href=\"javascript:void(0)\" onclick='showDetail("+ rowObject.processInstID +")'>查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp;";
                                if(rowObject.activityDefID == 'commit_contract' || rowObject.activityDefID == 'enterpriseLawer_approval'
                                    || rowObject.activityDefID == 'propesor_fixing' || rowObject.activityDefID == 'manualActivity' ) {
                                    selectHtml += "<a href=\"javascript:void(0)\" onclick=\"approval("+rowObject.workItemId+",\'"
                                        +rowObject.activityInstName+"\',\'"
                                        +rowObject.activityDefID+"\',"
                                        +rowObject.activityInstID+","
                                        +rowObject.processInstID +")\">"
                                        + "执行</a>&nbsp;&nbsp;&nbsp;&nbsp;";
                                } else {
                                    selectHtml += "<a href=\"javascript:void(0)\" onclick=\"approval("+rowObject.workItemId+",\'"
                                        +rowObject.activityInstName+"\',\'"
                                        +rowObject.activityDefID+"\',"
                                        +rowObject.activityInstID+","
                                        +rowObject.processInstID +")\">"
                                        + "审批</a>&nbsp;&nbsp;&nbsp;&nbsp;";
                                }

                                return selectHtml;
                            }}
                    ],
                    rowNum: 20,
                    pager: '#workflowPage',
                    sortname: 'id',
                    mtype: "post",
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "<a href='javascript:void(0)' onclick='reloadWorkflowData()'><b>刷新</b></a>" +
                    "<span style='color: red;padding-left: 45%'><b>个人待办任务</b></span>" +
                    "<span id='userIdtemp' style='color: tomato'>(用户Id:" +$("#userId").val()+ ")</sapn>"
                });
            $("#workflowInfo").jqGrid('navGrid', '#workflowPage', {edit: false, add: false, del: false});
        }

        function queryWorks() {
            reloadWorkflowData();
        }

        //点击查看详情查看信息，在实际业务系统中，应该查看相关的业务数据
         function showDetail(processInstID) {
             $.jBox.info("要查看详情的流程Id为："+processInstID, 'success');
         }

         //重加载工作流工作项列表数据
         function reloadWorkflowData() {
             $.ajax({
                 async: true,
                 url: ctx + "/contractDemo/queryPersonWorks",
                 type: "POST",
                 dataType: "json",
                 data: {
                     'personId': $("#userId").val(),
                     'userId': $("#userId").val()
                 },
                 success: function (data) {
                     $("#workflowInfo").clearGridData();
                     var grid = $("#workflowInfo")[0];
                     grid.addJSONData(data);
                     $("#userIdtemp").html("(用户Id:" +$("#userId").val() + ")");
                 }
             });
         }

         //完成工作项
         function singelFinishWork(workItemId, processInstID) {
             $.jBox.tip("处理中......");
             $.ajax({
                 async:true,
                 url: ctx + "/contractDemo/singelFinishWork",
                 type: "POST",
                 dataType: "json",
                 data: {
                     'userId' : $("#userId").val(),
                     'workItemId' : workItemId,
                     'processInsId' : processInstID

                 },
                 success: function(data){
                     $.jBox.tip('处理成功','success');
                     reloadWorkflowData();
                 }
             });
         }

        //跳转审批页面
         function approval(workItemId, activityInstName, activityDefId, activityInstId, processInsId) {
             var userId = $("#userId").val();
             $.jBox("iframe:"+ ctx + "/contractDemo/approval?"
                 + "processInsId=" + processInsId
                 + "&workItemId=" + workItemId
                 + "&activityInstName=" + activityInstName
                 + "&activityDefID=" + activityDefId
                 + "&activityInstId=" + activityInstId
                 + "&userId=" + userId,
                 {
                     title: "审批",
                     buttons: { '关闭': true}
                 });
         }
         /**** 查询流程工作项与执行流程工作项相关 end ****/

         /**** 查看流程图 begin ****/
         function showProcessGraph() {
             var processInsId = $("#processInsId").val();
             if(processInsId == 'undefine' || processInsId == '') {
                 $.jBox.info('流程ID不能为空');
                 return false;
             }
             parent.$.jBox("iframe:"+ ctx + "/contractDemo/showProcessGraph?"
                 + "processInsId=" + processInsId,
                 {
                     title: "流程图详情",
                     width: 800,
                     height: 600,
                     buttons: { '关闭': true}
                 });
         }
         /**** 查看流程图 end ****/
    </script>
</head>
<body>
<div id="wrapper" style="width: 100%; margin: 20px auto;">
    <!-- 流程启动定义 -->
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <label style="font-style: oblique"><b>流程启动定义</b></label>
            </div>
            <div class="panel-body" style="padding: 20px;">
               <!--选择合同起草人-->
                <div id="pickPropesor">
                    <label>a.合同起草人选择：</label>
                    <select id="propesor" style="width: 150px">
                        <option value="123456">起草人1</option>
                        <option value="02812201501">起草人2</option>
                    </select>
                </div>
                <!--选择审批部门-->
                <div id="pickDep" style="padding-top: 20px;padding-bottom: 20px">
                    <ul>
                        <li style="float: left"><label>b.审批部门选择&nbsp;&nbsp;&nbsp;&nbsp;：</label></li>
                        <li style="float: left">
                            <ul>
                                <li style="float: left;">
                                    <input type="checkbox" name="department" value="02812201501" />
                                    <input type="button" class="btn"  value="财务部" disabled="disabled" style="background-color: #00BFFF">
                                </li>
                                <li style="float: left; padding-left: 43px">
                                    <input type="checkbox" name="department" value="123456" style="padding-left: 15px" />
                                    <input type="button" class="btn"  value="采购部" disabled="disabled" style="background-color: #00BFFF">
                                </li>
                                <li style="float: left; padding-left: 43px">
                                    <input type="checkbox" name="department" value="30630201501" style="padding-left: 15px" />
                                    <input type="button" class="btn"  value="审计部" disabled="disabled" style="background-color: #00BFFF">
                                </li>
                                <li style="float: left; padding-left: 43px">
                                    <input type="checkbox" name="department" value="71927201101" style="padding-left: 15px" />
                                    <input type="button" class="btn"  value="企法部" disabled="disabled" style="background-color: #00BFFF">
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- 审批领导选择 -->
                <div id="pickLeaders" style="padding-top: 20px;padding-bottom: 20px">
                    <ul>
                        <li style="float: left"><label>c.审批领导选择&nbsp;&nbsp;&nbsp;&nbsp;：</label></li>
                        <li style="float: left">
                            <ul>
                                <li style="float: left;">
                                    <input type="checkbox" name="leader" value="02812201501" />
                                    <input type="button" class="btn"  value="财务部领导" disabled="disabled" style="background-color: #00BFFF">
                                </li>
                                <li style="float: left; padding-left: 15px">
                                    <input type="checkbox" name="leader" value="123456" style="padding-left: 15px" />
                                    <input type="button" class="btn"  value="采购部领导" disabled="disabled" style="background-color: #00BFFF">
                                </li>
                                <li style="float: left; padding-left: 15px">
                                    <input type="checkbox" name="leader" value="30630201501" style="padding-left: 15px" />
                                    <input type="button" class="btn"  value="审计部领导" disabled="disabled" style="background-color: #00BFFF">
                                </li>
                                <li style="float: left; padding-left: 15px">
                                    <input type="checkbox" name="leader" value="71927201101" style="padding-left: 15px" />
                                    <input type="button" class="btn"  value="企法部领导" disabled="disabled" style="background-color: #00BFFF">
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- 提交→创建流程实例→启动流程 -->
                <div id="createAndStartProcess" style="padding-top: 20px;padding-bottom: 20px">
                    <label>d.创建并启动流程：</label>
                    <input type="button" class="btn"  value="commit" style="background-color: #00BFFF" onclick="collectProcessDefInfo()">
                </div>
            </div>
        </div>
    </div>
    <!-- 查询流程工作项与执行流程工作项 -->
    <div class="col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <label style="font-style: oblique"><b>查询流程工作项与执行流程工作项</b></label>
            </div>
            <div class="panel-body" style="padding: 0px;">
                <div id="userInfo" style="padding: 10px;">
                    <label>用户Id:</label>
                    <input id="userId" name="userId" placeholder="要查询任务的用户Id" class="input-medium" />
                    <input id="queryWorks" name="queryWorks"
                           type="button" class="input-medium"
                           onclick="queryWorks()" value="查询待办任务"/>
                </div>
                <div id="workflowTable" style="padding: 10px;">
                    <table id="workflowInfo"></table>
                    <div id="workflowPage"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="panel panel-default" >
            <div class="panel-heading">
                <label>流程启动定义</label>
            </div>
            <div class="panel-body" style="padding: 0px;">
                <label>流程</label>
            </div>
        </div>
    </div>
    <!-- 查询流程图 -->
    <div class="col-md-4" style="height: 600px">
        <div class="panel panel-default">
            <div class="panel-heading">
                <label style="font-style: oblique"><b>流程图展示</b></label>
            </div>
            <div class="panel-body" style="padding: 20px;">
                <label style="color: red">*</label>
                <label>流程实例ID: </label>
                <input id="processInsId" name="processInsId" class="input-medium" />
                <input id="showProcessGraph" name="showProcessGraph"
                       type="button" class="input-medium"
                       onclick="showProcessGraph()" value="查看流程图"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>
