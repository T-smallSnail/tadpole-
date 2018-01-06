<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta name="decorator" content="default"/>
    <title>报销单详情</title>
    <script>
        $(function () {
            var isCraft = '${isCraft}';
            var userId = $("#userId").val();
            var approval = '${approval}';
            if(isCraft == '1' && userId == '1007' && approval=='1') {
                $("#expid").attr("disabled",false);
                $("#wipeoutName").attr("disabled",false);
                $("#expname").attr("disabled",false);
                $("#expmoney").attr("disabled",false);
                $("#reason").attr("disabled",false);
                $("#wipe-out-name").attr("disabled",false);
            }
        });
    </script>
</head>
<body>
<div style="text-align: center">
    <input id="userId" title="userId" value="${userId}" hidden="hidden">
    <input id="id" title="报销Id" value="${expVo.id}" hidden="hidden">
    <input id="workItemId" title="工作项Id" value="${workItemId}" hidden="hidden">
    <table style="border-collapse: separate; border-spacing: 15px">
        <tr>
            <td>报销名称：</td>
            <td><input id="wipeoutName" value="${expVo.wipeoutName}" disabled="disabled"></td>
        </tr>

        <tr style="margin-top: 90px">
            <td>报销单号：</td>
            <td><input id="expid" value="${expVo.expid}" disabled="disabled"></td>
        </tr>
        <tr>
            <td>报销人名称：</td>
            <td><input id="expname" value="${expVo.expname}" disabled="disabled"></td>
        </tr>
        <tr>
            <td>报销金额：</td>
            <td><input id="expmoney" value="${expVo.expmoney}" disabled="disabled"></td>
        </tr>
        <tr>
            <td>报销原因：</td>
            <td><input id="reason" value="${expVo.reason}" disabled="disabled"></td>
        </tr>
    </table>

    <%--<c:if test="${approval eq '1' && isCraft ne '1'}">--%>
        <%--<input type="submit" class="btn-success" value="审批" onclick="approve()">--%>
    <%--</c:if>--%>
    <%--<c:if test="${approval eq '1' && isCraft eq '1'}">--%>
        <%--<input type="submit" class="btn-success" value="提交" onclick="commit()">--%>
    <%--</c:if>--%>
</div>

<script>
    function commit() {
        $.jBox.tip("正在提交流程......");
        var workItemId = $("#workItemId").val();
        var id = $("#id").val();
        var expid =  $("#expid").val();
        var expname = $("#expname").val();
        var expmoney = $("#expmoney").val();
        var reason = $("#reason").val();
        var wipeoutName = $("#wipeoutName").val();

        $.ajax({
            async:true,
            url: ctx + "/bpm/commitFirstWork",
            type: "POST",
            dataType: "json",
            data: {
                'id' : id,
                'expid' : expid,
                'expname' : expname,
                'expmoney' : expmoney,
                'reason' : reason,
                'wipeoutName' : wipeoutName,
                'userId' : '1007',
                'workItemId':workItemId
            },
            success: function(data){
                $.jBox.tip('创建成功，流程id:'+data.ProcessId, 'success');
                $("#expId").val('');
                $("#expname").val('');
                $("#expmoney").val('');
                $("#reason").val('');
                $("#wipeoutName").val('');
            }
        });
    }
</script>
</body>
</html>
