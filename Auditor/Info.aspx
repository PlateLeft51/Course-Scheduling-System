<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="实验室排课系统.Auditor.Info" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/position.css">
    <link rel="stylesheet" href="../css/window.css">
    <title>实验室排课系统</title>
</head>

<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <div class="sidebar-userinfo sidebar-u-aud">
                <div class="sidebar-userinfo-name">桐宇</div>
                <div class="sidebar-userinfo-title">10217</div>
            </div>
            <div class="borderline2"></div>
            <p class="sidebar-paragraph">排课操作</p>
            <ol>
                <li class="sidebar-verified"><a href="Audit.aspx" class="refer">审核管理</a></li>
                <li class="sidebar-schedule"><a href="Schedule.aspx" class="refer" >排课管理</a></li>
            </ol>
            <p class="sidebar-paragraph">系统管理</p>
            <ol>
                <li class="sidebar-info-selected"><a href="Info.aspx" class="refer">个人信息</a></li>
                <li class="sidebar-bulletin"><a href="Bulletin.aspx" class="refer">通知公告</a></li>
            </ol>
            <div class="borderline3"></div>
            <div class="sidebar-shutdown">
                <ol>
                <li class="sidebar-exit"><a href="../Login.aspx" class="refer">退出&emsp;&emsp;</a></li>
            </ol>
            </div>

        </div>
        <div class="domin">
            <div class="theme">
                <div class="theme-content"><h1>个人信息</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                <div class="info-key info-key-head">用户名</div>
                <div class="info-value">10217</div>
                <div class="info-key">姓名</div>
                <div class="info-value">桐宇</div>
                <div class="info-key">密码</div>
                <div class="info-value">******</div>
                <div class="info-key">性别</div>
                <div class="info-value">男</div>
                <div class="info-key">身份证号</div>
                <div class="info-value">130823199003074573</div>
                <div class="info-key">职称</div>
                <div class="info-value">讲师</div>
                <div class="info-key">系别</div>
                <div class="info-value">计算机系</div>
                <div class="info-key">学院</div>
                <div class="info-value">人工智能与数据科学学院</div>
                <div class="info-key">备注</div>
                <div class="info-value">106实验室管理员</div>
                <button type="button" onclick="display()" class="button-view stu-info-pos1">修改</button>
                <button type="button" onclick="display()" class="button-view stu-info-pos2">修改</button>
            </div>
        </div>
    </form>
    <div class="win-background" id='win-background'>
			<div class="win-password-content">
			</div>
            <div class="win-password-title"><h2>密码修改</h2></div>
            <div class="borderline2 win-password-border"></div>
            <div class="win-password-pos1 info-key">原密码</div>
            <div class="win-password-pos2 info-key"></div>
            <input type="password" class="input-view win-password-pos3" name="origin">
            <div class="win-password-pos4 info-key">新密码</div>
            <div class="win-password-pos5 info-key"></div>
            <input type="password" class="input-view win-password-pos6" name="new">
            <div class="win-password-pos7 info-key">确认密码</div>
            <div class="win-password-pos8 info-key"></div>
            <input type="password" class="input-view win-password-pos9" name="confirm">
            <div class="win-password-pos12 win-bottom"></div>
            <button type="button" onclick="shutdown()" class="button-view win-password-pos10">确认</button>
            <button type="button" onclick="shutdown()" class="button-view win-password-pos11">取消</button>
		</div>
		<script type="text/javascript">
            document.getElementById('win-background').style.display = "none";
            function display() {
                document.getElementById('win-background').style.display = "";
            }
            function shutdown() {
                document.getElementById('win-background').style.display = "none";
            }
		</script>
</body>
</html>
