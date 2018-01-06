<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>

<head>
    <title>审批页面</title>
    <meta name="decorator" content="default"/>

    <script>
        var activityDefID = '${activityDefID}';
        function singleFinishWork() {
            $.jBox.tip("处理中......");
            $.ajax({
                async:true,
                url: ctx + "/contractDemo/singelFinishWork",
                type: "POST",
                dataType: "json",
                data: {
                    'userId' : $("#userId").val(),
                    'workItemId' : $("#workItemId").val(),
                    'processInsId' : $("#processInsId").val(),
                    'activityInstName' : $("#activityInstName").val(),
                    'remark' : $("#remark").val()
                },
                success: function(data){
                    $.jBox.tip('处理成功','success');
                    window.parent.reloadWorkflowData();
                    window.parent.window.jBox.close() ;
                }
            });
        }

        function approveWork(isPass) {
            $.jBox.tip("处理中......");
            var relativeDataPath = '';
            if(activityDefID == 'propesor_approval_firstTime') {
                relativeDataPath = 'commit_isagree';
            } else if(activityDefID == 'enterpriseLawer_head_approval') {
                relativeDataPath = 'review_agree';
            } else if(activityDefID == 'law_advisor_approval') {
                relativeDataPath = 'review_sec_agree';
            } else if(activityDefID == 'propesor_approval_secTime') {
                relativeDataPath = 'commit_sec_isagree';
            } else if(activityDefID == 'leader_approval') {
                relativeDataPath = 'leader_isagree';
            } else if(activityDefID == 'manualActivity1') {
                relativeDataPath = 'agree';
            }
            $.ajax({
                async:true,
                url: ctx + "/contractDemo/approveWork",
                type: "POST",
                dataType: "json",
                data: {
                    'userId' : $("#userId").val(),
                    'workItemId' : $("#workItemId").val(),
                    'processInsId' : $("#processInsId").val(),
                    'activityInstName' : $("#activityInstName").val(),
                    'remark' : $("#remark").val(),
                    'relativeDataPath': relativeDataPath,
                    'activityInstId': $("#activityInstId").val(),
                    'isPass': isPass
                },
                success: function(data){
                    $.jBox.tip('处理成功','success');
                    window.parent.reloadWorkflowData();
                    window.parent.window.jBox.close() ;
                }
            });
        }
    </script>
</head>

<body>
    <input id="activityInstName" value="${activityInstName}" hidden="hidden">
    <input id="userId" value="${userId}" hidden="hidden">
    <input id="processInsId" value="${processInsId}" hidden="hidden">
    <input id="workItemId" value="${workItemId}" hidden="hidden">
    <input id="activityInstId" value="${activityInstId}" hidden="hidden">

    <div style="padding-top: 20px; padding-left: 5px">
        <label>审批备注:</label>
        <textarea id="remark" name="remark" ></textarea>
    </div>
    <div style="text-align: center">
        <c:if test="${activityDefID eq 'commit_contract' || activityDefID eq 'enterpriseLawer_approval'
                    || activityDefID eq 'propesor_fixing' || activityDefID eq 'manualActivity'}">
            <input type="submit" class="btn-success" value="提交完成" onclick="singleFinishWork()">
        </c:if>
        <c:if test="${activityDefID eq 'propesor_approval_firstTime' || activityDefID eq 'enterpriseLawer_head_approval'
                    || activityDefID eq 'law_advisor_approval' || activityDefID eq 'propesor_approval_secTime'
                    || activityDefID eq 'leader_approval' || activityDefID eq 'manualActivity1'}">
            <input type="submit" class="btn-success" value="同意" onclick="approveWork(1)">
            <input type="submit" class="btn-danger"  value="拒绝" onclick="approveWork(0)">
        </c:if>
    </div>
</body>

</html>
