<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>processInstance</title>
    <meta name="decorator" content="default"/>
    <link href="/static/jqGrid/4.6/css/ui.jqgrid.css" rel="stylesheet" type="text/css" />
    <script src="/static/jqGrid/4.6/i18n/grid.locale-cn.js" type="text/javascript"></script>
    <script src="/static/jqGrid/4.6/js/jquery.jqGrid.min.js"></script>
    <script src="/static/jqGrid/4.6/plugins/grid.complexHeaders.js" type="text/javascript"></script>

    <script>
        $(function() {
            ToworkPageInit();
            AlreadyworkPageInit();
            loadFinishedWorkData();
            loadPersonWorkItemsData();
        });

        function detail(processId, approval, workItemID) {
            $.jBox("iframe:"+ ctx + "/bpm/expanseDetail?"
                + "processId=" + processId
                + "&approval=" + approval
                + "&workItemId=" + workItemID
                + "&userId=" + $("#userId").val(),
                {
                title: "报销单详情",
                width: 400,
                height: 400,
                buttons: { '关闭': true}
            });
        }
        
        function finishWork(workItemId, processInsId) {
            $.jBox.tip("处理中......");
            $.ajax({
                async:true,
                url: ctx + "/bpm/finishWorkItem",
                type: "POST",
                dataType: "json",
                data: {
                    'userId' : $("#userId").val(),
                    'workItemId' : workItemId,
                    'processInsId' : processInsId
                },
                success: function(data){
                    $.jBox.tip('处理成功','success');
                    loadFinishedWorkData();
                    loadPersonWorkItemsData();
                }
            });
        }

        function rejectWork(workItemId, processInsId) {
            $.jBox.tip("处理中......");
            $.ajax({
                async:true,
                url: ctx + "/bpm/rejectWork",
                type: "POST",
                dataType: "json",
                data: {
                    'userId' : $("#userId").val(),
                    'workItemId' : workItemId,
                    'processInsId' : processInsId
                },
                success: function(data){
                    $.jBox.tip('处理成功','success');
                    loadFinishedWorkData();
                    loadPersonWorkItemsData();
                }
            });
        }

        function loadFinishedWorkData() {
            $.ajax({
                async: true,
                url: ctx + "/bpm/queryPersonFinishedWork",
                type: "POST",
                dataType: "json",
                data: {
                    'personId': $("#userId").val(),
                    'userId': $("#userId").val()
                },
                success: function (data) {
                    $("#list1").clearGridData();
                    var grid = $("#list1")[0];
                    grid.addJSONData(data);
                    $("#userIdtemp1").html("(用户Id:" +$("#userId").val() + ")");
                }
            });
        }

        function loadPersonWorkItemsData() {
            $.ajax({
                async: true,
                url: ctx + "/bpm/queryPersonWorkItems",
                type: "POST",
                dataType: "json",
                data: {
                    'personId': $("#userId").val(),
                    'userId': $("#userId").val()
                },
                success: function (data) {
                    $("#list2").clearGridData();
                    var grid = $("#list2")[0];
                    grid.addJSONData(data);
                    $("#userIdtemp2").html("(用户Id:" +$("#userId").val() + ")");
                }
            });
        }

        function search() {
            loadFinishedWorkData();
            loadPersonWorkItemsData();
        }

        function ToworkPageInit() {
            $("#list2").jqGrid(
                {
//                    url: ctx + '/bpm/queryPersonWorkItems?userId=1007&personId=1007',
                    datatype: "json",
                    colNames: [
                        '任务Id',
                        '任务名称',
                        '任务详情',
                        '所属流程',
                        '所属流程Id',
                        '所属业务流程',
                        '所属业务流程定义名称',
                        '开始时间',
                        '结束时间',
                        '是否超时',
                        '操作'
                    ],
                    colModel: [
                        {name: 'workItemId', index: 'workItemId', width: 100, hidden:true},
                        {name: 'workItemName', index: 'workItemName', width: 150,align: "center"},
                        {name: 'workItemDesc', index: 'workItemDesc', width: 200},
                        {name: 'processInstName', index: 'processInstName', width: 150},
                        {name: 'processInstID', index: 'processInstID', width: 100, hidden: true},
                        {name: 'processChName', index: 'processChName', width: 150, align: "center"},
                        {name: 'processDefName', index: 'processDefName', width: 150, hidden: true},
                        {name: 'startTime', index: 'startTime', width: 150, sortable: false, align: "center"},
                        {name: 'endTime', index: 'endTime', width: 150, sortable: false, align: "center"},
                        {name: 'isTimeOut', index: 'isTimeOut', width: 120, align: "center"},
                        {name: 'operation', index: 'operation', width: 150,
                            formatter: function (cellValue, options, rowObject) {
                                var user = $("#userId").val();
                                var selectHtml="<a href=\"javascript:void(0)\" onclick='detail("+ rowObject.processInstID +",1,"+ rowObject.workItemId+")'>查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp;" +
                                    "<a href=\"javascript:void(0)\" onclick=\"finishWork("+rowObject.workItemId+","+rowObject.processInstID +")\">通过</a>&nbsp;&nbsp;&nbsp;&nbsp;";
                                if(user == '1004' || user == '1006') {
                                    selectHtml +=  "<a href=\"javascript:void(0)\" onclick=\"rejectWork("+rowObject.workItemId+","+rowObject.processInstID +")\">拒绝</a>";
                                }
                                return selectHtml
                            }}
                    ],
                    rowNum: 20,
                    pager: '#pager2',
                    sortname: 'id',
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "<a href='javascript:void(0)' onclick='loadPersonWorkItemsData()'><b>刷新</b></a>" +
                    "<span style='color: red;padding-left: 45%'><b>个人待办任务</b></span>" +
                    "<span id='userIdtemp2' style='color: tomato'>(用户Id:" +$("#userId").val()+ ")</sapn>"
                });
            $("#list2").jqGrid('navGrid', '#pager2', {edit: false, add: false, del: false});
        }

        function AlreadyworkPageInit() {
            $("#list1").jqGrid(
                {
//                    url: ctx + '/bpm/queryPersonFinishedWork?userId='+$("#userId").val() + "&personId="+$("#userId").val(),
                    datatype: "json",
                    colNames: [
                        '任务Id',
                        '任务名称',
                        '任务详情',
                        '所属流程',
                        '所属流程Id',
                        '所属业务流程',
                        '所属业务流程定义名称',
                        '开始执行时间',
                        '结束时间',
                        '是否超时',
                        '操作'
                    ],
                    colModel: [
                        {name: 'workItemId', index: 'workItemId', width: 100, hidden:true},
                        {name: 'workItemName', index: 'workItemName', width: 150,align: "center"},
                        {name: 'workItemDesc', index: 'workItemDesc', width: 200},
                        {name: 'processInstName', index: 'processInstName', width: 150},
                        {name: 'processInstID', index: 'processInstID', width: 100, hidden: true},
                        {name: 'processChName', index: 'processChName', width: 150, align: "center"},
                        {name: 'processDefName', index: 'processDefName', width: 150, hidden: true},
                        {name: 'startTime', index: 'startTime', width: 150, sortable: false, align: "center"},
                        {name: 'endTime', index: 'endTime', width: 150, sortable: false, align: "center"},
                        {name: 'isTimeOut', index: 'isTimeOut', width: 120, align: "center"},
                        {name: 'operation', index: 'operation', width: 150,
                            formatter: function (cellValue, options, rowObject) {
                                var selectHtml="<a href=\"javascript:void(0)\" onclick='detail("+ rowObject.processInstID +",0)'>查看详情</a>" +
                                    "";
                                return selectHtml
                            }}
                    ],
                    rowNum: 20,
                    pager: '#pager2',
                    sortname: 'id',
                    mtype: "post",
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "<a href='javascript:void(0)' onclick='loadFinishedWorkData()'><b>刷新</b></a>" +
                    "<span style='color: red;padding-left: 45%'><b>个人已办任务</b></span>" +
                    "<span id='userIdtemp1' style='color: tomato'>(用户Id:" +$("#userId").val()+ ")</sapn>"
                });
            $("#list1").jqGrid('navGrid', '#pager1', {edit: false, add: false, del: false});
        }

        function pickUpWork() {
            $.ajax({
                async: true,
                url: ctx + "/bpm/pickUpWork",
                type: "POST",
                dataType: "json",
                data: {
                    'workItemId': $("#workItemId").val(),
                    'userId': $("#userId").val()
                },
                success: function (data) {
                }
            });
        }
    </script>
</head>
<body>

<div>
    用户Id:&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-medium" id="userId", name="userId", title="用户Id">
    <input type="submit" class="btn-success"  onclick="search()" value="查询">
    <div>
        任务Id:&nbsp;&nbsp;&nbsp;&nbsp;<input class="input-medium" id="workItemId", name="workItemId", title="工作项Id">
        <input type="submit" class="btn-success"  onclick="pickUpWork()" value="领取任务">
    </div>
</div>

<div style="text-align: center;" >
    <table id="list2"></table>
    <div id="pager2"></div>
</div>

<div style="text-align: center; padding-top: 50px" >
    <table id="list1"></table>
    <div id="pager1"></div>
</div>

</body>
</html>
