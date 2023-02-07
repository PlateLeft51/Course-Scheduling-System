<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoTea.aspx.cs" Inherits="实验室排课系统.Admin.InfoTea" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/menu.css">
    <link rel="stylesheet" href="../css/gridview.css">
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
                <li class="sidebar-teacher-selected"><a href="InfoTea.aspx" class="refer">教师管理</a></li>
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
                <div class="theme-content"><h1>教师管理</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                <div class="searchbar">
                    <div class="adm-infostu-pos1">工号：</div>
                    <div class="adm-infostu-pos2">
                        <input type="text" class="input-view" name="username">
                    </div>
                    <div class="adm-infostu-pos3">姓名：</div>
                    <div class="adm-infostu-pos4">
                        <input type="text" class="input-view" name="name">
                    </div>
                    <div class="adm-infostu-pos5">系别：</div>
                    <select id="select-class" class="select-view select-view-width1 adm-infostu-pos6">
                        <option value="0">所有班级</option>
                        <option value="A">计算机系</option>
                        <option value="B">软件系</option>
                        <option value="C">通信工程系</option>
                        <option value="D">机械系</option>
                        <option value="D">自动化系</option>
                    </select>
                    <div class="adm-infostu-pos7">学院：</div>
                    <select id="select-faculty" class="select-view select-view-width2 adm-infostu-pos8">
                        <option value="0">所有学院</option>
                        <option value="A">机械工程学院</option>
                        <option value="B">电子信息工程学院</option>
                        <option value="C">理学院</option>
                        <option value="D">人工智能与数据科学学院</option>
                    </select>
                   
                    <asp:Button runat="server" class="button-view adm-infostu-pos9" onclick="download" text="查询" ></asp:Button>
                </div>
                <div class="illustration-left">教师用户</div>
                <asp:Button runat="server" class="button-view adm-infostu-pos11" onclick="download" text="创建用户" ></asp:Button>
                <div class="chart">
                    <asp:GridView ID="GridView" runat="server" CssClass="GridViewStyle" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="10" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderStyle-Width="120px" DataField="name" HeaderText="姓名" />
                            <asp:BoundField HeaderStyle-Width="120px" DataField="username" HeaderText="工号" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="password" HeaderText="密码" />
                            <asp:BoundField HeaderStyle-Width="120px" DataField="sex" HeaderText="性别" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="IDnumber" HeaderText="身份证号" />
                            <asp:BoundField HeaderStyle-Width="120px" DataField="title" HeaderText="职称" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="dept" HeaderText="系别" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="faculty" HeaderText="学院" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="remarks" HeaderText="备注" />

                        </Columns>
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle"  />
                        <PagerStyle CssClass="GridViewPagerStyle"  />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                    </asp:GridView>
                </div>
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
