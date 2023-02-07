
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="实验室排课系统.Admin.Info" %>

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
            <div class="sidebar-userinfo sidebar-u-adm">
                <div class="sidebar-userinfo-name">admin</div>
                <div class="sidebar-userinfo-title">系统管理员</div>
            </div>
            <div class="borderline2"></div>
            <p class="sidebar-paragraph">排课操作</p>
            <ol>
                <li class="sidebar-course"><a href="Course.aspx" class="refer">课程管理</a></li>
                
                <li class="sidebar-schedule"><a href="Schedule.aspx" class="refer" >排课管理</a></li>
            </ol>
            <p class="sidebar-paragraph">系统管理</p>
            <ol>
                <li class="sidebar-student"><a href="InfoStu.aspx" class="refer">学生管理</a></li>
                <li class="sidebar-teacher"><a href="InfoTea.aspx" class="refer">教师管理</a></li>
                <li class="sidebar-auditor"><a href="InfoAud.aspx" class="refer">审核员管理</a></li>
                <li class="sidebar-info-selected"><a href="Info.aspx" class="refer">系统信息</a></li>
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
                <div class="theme-content"><h1>系统信息</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                <div class="info-key info-key-head">用户名</div>
                <div class="info-value">admin</div>
                <div class="info-key">密码</div>
                <div class="info-value">******</div>
                <div class="info-key">管理员用户数</div>
                <div class="info-value">2</div>
                <div class="info-key">教师用户数</div>
                <div class="info-value">10</div>
                <div class="info-key">学生用户数</div>
                <div class="info-value">63</div>
                <div class="info-key">系统版本号</div>
                <div class="info-value">1.0</div>
                <div class="info-key">服务器地址</div>
                <div class="info-value">localhost</div>
                <div class="info-key">数据库地址</div>
                <div class="info-value">localhost</div>
                <button type="button" onclick="display()" class="button-view adm-info-pos1">修改</button>
                <button type="button" onclick="display()" class="button-view adm-info-pos2">修改</button>
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
