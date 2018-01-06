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
            pageInit();
        });

        function detail(processId, approval) {
            $.jBox("iframe:"+ ctx + "/bpm/expanseDetail?processId=" + processId + "&approval=" + approval, {
                title: "报销单详情",
                width: 400,
                height: 400,
                buttons: { '关闭': true}
            });
        }

        function pageInit() {
            $("#list2").jqGrid(
                {
                    url: ctx + '/bpm/queryPersonFinishedWork?userId=1007&personId=1007',
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
                        {name: 'workItemID', index: 'workItemID', width: 100, hidden:true},
                        {name: 'workItemName', index: 'workItemName', width: 100,align: "center"},
                        {name: 'workItemDesc', index: 'workItemDesc', width: 200},
                        {name: 'processInstName', index: 'processInstName', width: 150},
                        {name: 'processInstID', index: 'processInstID', width: 100, hidden: true},
                        {name: 'processChName', index: 'processChName', width: 150, align: "center"},
                        {name: 'processDefName', index: 'processDefName', width: 150, hidden: true},
                        {name: 'startTime', index: 'startTime', width: 150, sortable: false, align: "center"},
                        {name: 'endTime', index: 'endTime', width: 150, sortable: false, align: "center"},
                        {name: 'isTimeOut', index: 'isTimeOut', width: 120, align: "center"},
                        {name: 'operation', index: 'operation', width: 200,
                            formatter: function (cellValue, options, rowObject) {
                                var selectHtml="<a href=\"javascript:void(0)\" onclick='detail("+ rowObject.processInstID +",0)'>查看详情</a>";
                                return selectHtml
                            }}
                    ],
                    rowNum: 20,
                    pager: '#pager2',
                    sortname: 'id',
                    mtype: "post",
                    viewrecords: true,
                    sortorder: "desc",
                    caption: "<span style='color: #6d3353'>个人已办任务</span>"
                });
            $("#list2").jqGrid('navGrid', '#pager2', {edit: false, add: false, del: false});
        }
    </script>
</head>
<body>
<div style="background-color: #8DB9DB">
    <form class="form-group">
        <table>
            <tr>
                <td>报销名称：</td>
                <td><input id="wipe-out-name" name="wipe-out-name" /></td>
            </tr>

            <tr>
                <td>报销单号：</td>
                <td><input id="expId" name="expId" /></td>
            </tr>

            <tr>
                <td>报销人：</td>
                <td><input id="expname" name="expname" /></td>
            </tr>

            <tr>
                <td>报销金额：</td>
                <td><input id="expmoney" name="expmoney" /></td>
            </tr>

            <tr>
                <td>报销原因：</td>
                <td width="200px">
                    <textarea id="reason" name="reason"></textarea>
                </td>
            </tr>
        </table>
    </form>
    <input type="submit" class="btn-success" value="提交" onclick="commit()">
    <input type="submit" class="btn-success" value="保存" onclick="save()">
</div>

<div style="padding-top: 50px;text-align: center" >
    <table id="list2"></table>
    <div id="pager2"></div>
</div>

<script>
    function commit() {
        $.jBox.tip("正在提交流程......");
        var expId =  $("#expId").val();
        var expname = $("#expname").val();
        var expmoney = $("#expmoney").val();
        var reason = $("#reason").val();
        var wipeoutName = $("#wipe-out-name").val();

        $.ajax({
            async:true,
            url: ctx + "/bpm/startProcess",
            type: "POST",
            dataType: "json",
            data: {
                'expid' : expId,
                'expname' : expname,
                'expmoney' : expmoney,
                'reason' : reason,
                'wipeoutName' : wipeoutName,
                'userId' : '1007'
            },
            success: function(data){
                $.jBox.tip('创建成功，流程id:'+data.ProcessId, 'success');
                $("#list2").trigger("reloadGrid");
                $("#expId").val('');
                $("#expname").val('');
                $("#expmoney").val('');
                $("#reason").val('');
                $("#wipe-out-name").val('');
            }
        });
    }

    function save() {
        $.jBox.tip("正在保存......");
        var expId = $("#expId").val();
        var expname = $("#expname").val();
        var expmoney = $("#expmoney").val();
        var reason = $("#reason").val();
        var wipeoutName = $("#wipe-out-name").val();

        $.ajax({
            async: true,
            url: ctx + "/bpm/createCraftProcess",
            type: "POST",
            dataType: "json",
            data: {
                'expid': expId,
                'expname': expname,
                'expmoney': expmoney,
                'reason': reason,
                'wipeoutName': wipeoutName,
                'userId': '1007'
            },
            success: function (data) {
                $.jBox.tip('保存成功', 'success');
                loadData();
                $("#expId").val('');
                $("#expname").val('');
                $("#expmoney").val('');
                $("#reason").val('');
                $("#wipe-out-name").val('');
            }
        });
    }
</script>

</body>
</html>
