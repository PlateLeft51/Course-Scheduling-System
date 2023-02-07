<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="实验室排课系统.Student.Schedule" %>

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
            <div class="sidebar-userinfo sidebar-u-stu">
                <div class="sidebar-userinfo-name">陈明</div>
                <div class="sidebar-userinfo-title">174906</div>
            </div>
            <div class="borderline2"></div>
            <p class="sidebar-paragraph">排课管理</p>
            <ol>
                <li class="sidebar-course"><a href="Course.aspx" class="refer">课程查询</a></li>
                
                <li class="sidebar-schedule-selected"><a href="Schedule.aspx" class="refer" >排课查询</a></li>
            </ol>
            <p class="sidebar-paragraph">系统管理</p>
            <ol>
                <li class="sidebar-info"><a href="Info.aspx" class="refer">个人信息</a></li>
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
                <div class="theme-content"><h1>排课查询</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                <div class="searchbar">
                    <div class="stu-course-pos1">当前显示：</div>
                    <select id="select_mode" class="select-view select-view-width1 stu-course-pos2"  runat="server" onchange="databind()">
                        <option value="所有课程">所有课程</option>
                        <option value="我的课程">我的课程</option>
                    </select>
                    <div class="stu-course-pos3">学期：</div>
                    <select id="select_semester" class="select-view select-view-width2 stu-course-pos4" runat="server" onchange="databind()">
                        <option value="所有学期">所有学期</option>
                        <option value="2020-2021学年春季学期">2020-2021学年春季学期</option>
                        <option value="2020-2021学年秋季学期">2020-2021学年秋季学期</option>
                        <option value="2019-2020学年春季学期">2019-2020学年春季学期</option>
                        <option value="2019-2020学年秋季学期">2019-2020学年秋季学期</option>
                    </select>
                    <div class="stu-course-pos5">周次：</div>
                    <select id="select_week" class="select-view select-view-width1 stu-course-pos6" runat="server" onchange="databind()">
                        <option value="第8周">第8周</option>
                        <option value="第9周">第9周</option>
                        <option value="第10周">第10周</option>
                        <option value="第11周">第11周</option>
                        <option value="第12周">第12周</option>
                    </select>
                    <asp:Button runat="server" class="button-view stu-course-pos7" Onclick="download" text="下载" ></asp:Button>
                    <asp:Button runat="server" id="btn1"  Onclick="bind_select"></asp:Button>
                </div>
            </div>
            <div class="illustration-left" id="illustration" runat="server">2020-2021学年春季学期第8周实验安排（计172所有课程）</div>
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
            function databind() {
                document.getElementById("btn1").click();              
            }
		</script>
</body>
</html>
