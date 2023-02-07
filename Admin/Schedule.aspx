<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="实验室排课系统.Admin.Schedule" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/position.css">
    <link rel="stylesheet" href="../css/gridview.css">
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
                <li class="sidebar-schedule-selected"><a href="Schedule.aspx" class="refer" >排课管理</a></li>
            </ol>
            <p class="sidebar-paragraph">系统管理</p>
            <ol>
                <li class="sidebar-student"><a href="InfoStu.aspx" class="refer">学生管理</a></li>
                <li class="sidebar-teacher"><a href="InfoTea.aspx" class="refer">教师管理</a></li>
                <li class="sidebar-auditor"><a href="InfoAud.aspx" class="refer">审核员管理</a></li>
                <li class="sidebar-info"><a href="Info.aspx" class="refer">系统信息</a></li>
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
                <div class="theme-content"><h1>排课管理</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                <div class="searchbar">
                    <div class="adm-schedule-pos1">当前显示：</div>
                    <select id="select-mode" class="select-view select-view-width1 adm-schedule-pos2">
                        <option value="0">实验室</option>
                        <option value="A">教师</option>
                        <option value="B">班级</option>
                    </select>
                    <select id="select-name" class="select-view select-view-width1 adm-schedule-pos3">
                        <option value="0">所有课程</option>
                        <option value="A">周茜</option>
                        <option value="B">陈芳华</option>
                        <option value="C">赵栗鹏</option>
                    </select>
                    <div class="adm-schedule-pos4">学期：</div>
                    <select id="select-semester" class="select-view select-view-width2 adm-schedule-pos5">
                        <option value="0">所有学期</option>
                        <option value="A">2020-2021学年春季学期</option>
                        <option value="B">2020-2021学年秋季学期</option>
                        <option value="C">2019-2020学年春季学期</option>
                        <option value="D">2019-2020学年秋季学期</option>
                    </select>
                    <div class="adm-schedule-pos6">周次：</div>
                    <select id="select-week" class="select-view select-view-width1 adm-schedule-pos7">
                        <option value="0">请选择周次</option>
                        <option value="A">第1周</option>
                        <option value="B">第2周</option>
                        <option value="C">第3周</option>
                        <option value="D">第4周</option>
                    </select>
                    <asp:Button runat="server" class="button-view adm-schedule-pos8" OnClick="download" text="下载" ></asp:Button>
                </div>
            </div>
            <div class="illustration-left">2020-2021学年春季学期第1周实验安排（实验室所有课程）</div>
            <asp:Button runat="server" class="button-view tea-bulletin-pos1" onclick="download" text="新增排课" ></asp:Button>
            <div class="chart">
                <asp:GridView ID="GridView" runat="server" CssClass="GridViewStyle" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="20" ForeColor="#333333" GridLines="None" OnRowCreated="GridView_RowCreated" 
                        oncolumndatabound="MergeRows" OnRowDataBound="GridView_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="week" />
                            <asp:BoundField DataField="section"/>
                            <asp:BoundField DataField="d1a1" />
                            <asp:BoundField DataField="d1a2" />
                            <asp:BoundField DataField="d1a3"  />
                            <asp:BoundField DataField="d1b1"/>
                            <asp:BoundField DataField="d1b2"/>
                            <asp:BoundField DataField="d1b3" />
                            <asp:BoundField DataField="d1c1"  />
                            <asp:BoundField DataField="d1c2" />
                            <asp:BoundField DataField="d1c3"/>
                        </Columns>
                        <FooterStyle CssClass="GridViewFooterStyle" />
                    <RowStyle CssClass="GridViewRowStyle schedule-gridview-row" />
                    <SelectedRowStyle CssClass="GridViewSelectedRowStyle"  />
                    <PagerStyle CssClass="GridViewPagerStyle"  />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                </asp:GridView>
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
