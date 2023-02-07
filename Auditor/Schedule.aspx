<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="实验室排课系统.Auditor.Schedule" %>

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
            <div class="sidebar-userinfo sidebar-u-aud">
                <div class="sidebar-userinfo-name">桐宇</div>
                <div class="sidebar-userinfo-title">10217</div>
            </div>
            <div class="borderline2"></div>
            <p class="sidebar-paragraph">排课操作</p>
            <ol>
                <li class="sidebar-verified"><a href="Audit.aspx" class="refer">审核管理</a></li>
                <li class="sidebar-schedule-selected"><a href="Schedule.aspx" class="refer" >排课管理</a></li>
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
                <div class="theme-content"><h1>排课管理</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                <div class="searchbar">
                    <div class="adm-schedule-pos1">当前显示：</div>
                    <select id="select_mode" class="select-view select-view-width1 adm-schedule-pos2" runat="server" onchange="databind()">
                        <option value="实验室">实验室</option>
                        <option value="教师">教师</option>
                        <option value="班级">班级</option>
                    </select>
                    <select id="select_name" class="select-view select-view-width1 adm-schedule-pos3" runat="server" onchange="databind()">
                        <option value="0">所有课程</option>
                        <option value="周茜">周茜</option>
                        <option value="陈芳华">陈芳华</option>
                        <option value="赵栗鹏">赵栗鹏</option>
                    </select>
                    <div class="adm-schedule-pos4">学期：</div>
                    <select id="select_semester" class="select-view select-view-width2 adm-schedule-pos5" runat="server" onchange="databind()">
                        <option value="所有学期">所有学期</option>
                        <option value="2020-2021学年春季学期">2020-2021学年春季学期</option>
                        <option value="2020-2021学年秋季学期">2020-2021学年秋季学期</option>
                        <option value="2019-2020学年春季学期">2019-2020学年春季学期</option>
                        <option value="2019-2020学年秋季学期">2019-2020学年秋季学期</option>
                    </select>
                    <div class="adm-schedule-pos6">周次：</div>
                    <select id="select_week" class="select-view select-view-width1 adm-schedule-pos7" runat="server" onchange="databind()">
                        <option value="第8周">第8周</option>
                        <option value="第9周">第9周</option>
                        <option value="第10周">第10周</option>
                        <option value="第11周">第11周</option>
                        <option value="第12周">第12周</option>
                    </select>
                    <asp:Button runat="server" class="button-view adm-schedule-pos8" OnClick="download" text="下载" ></asp:Button>
                    <asp:Button runat="server" id="btn1"  Onclick="bind_select"></asp:Button>
                </div>
            </div>
            <div class="illustration-left" id="illustration" runat="server">2020-2021学年春季学期第8周实验安排（实验室所有课程)</div>
            <button type="button" onclick="display_schedule()" class="button-view tea-bulletin-pos1">新增排课</button>
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
    <div class="win-background" id='win-background1'>
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
		<div class="win-background" id='win-background2'>
		<div class="win-password-content win-user-pos1 win-course-pos1"></div>
        <div class="win-course-pos2"><h2>新增排课</h2></div>
        <div class="borderline2 win-course-pos3"></div>
        <div class="win-course-pos4">周次：</div>
                    <select id="select_week_win" class="select-view win-course-pos5" runat="server">
                        <option value="第8周">第8周</option>
                        <option value="第9周">第9周</option>
                        <option value="第10周">第10周</option>
                        <option value="第11周">第11周</option>
                        <option value="第12周">第12周</option>
                    </select>
                    <div class="win-course-pos6">课程：</div>
                    <select id="select_course_win" class="select-view win-course-pos7" runat="server">
                        <option value="请选择课程">请选择课程</option>
                        <option value="数据结构">数据结构</option>
                        <option value="C语言程序设计">C语言程序设计</option>
                        <option value="算法设计与分析">算法设计与分析</option>
                        <option value="程序综合实验">程序综合实验</option>
                        <option value="操作系统">操作系统</option>
                    </select>
                    <div class="win-course-pos8">教师：</div>
                    <select id="select_teacher_win" class="select-view win-course-pos9" runat="server">
                        <option value="请选择教师">请选择教师</option>
                        <option value="赵栗鹏">赵栗鹏</option>
                        <option value="杨鹏伟">杨鹏伟</option>
                        <option value="周茜">周茜</option>
                        <option value="陈芳华">陈芳华</option>
                    </select>
                   
                    <div class="win-course-pos10">班级：</div>
                    <select id="select_class_win" class="select-view win-course-pos11" runat="server">
                        <option value="请选择班级">请选择班级</option>
                        <option value="计171">计171</option>
                        <option value="计172">计172</option>
                        <option value="软件171">软件171</option>
                        <option value="软件172">软件172</option>
                    </select>
        <div class="win-course-pos12">
                <asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="20" ForeColor="#333333" GridLines="None" OnRowCreated="GridView_RowCreated" 
                        oncolumndatabound="MergeRows" OnRowDataBound="GridView_RowDataBound2">
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
                <asp:Button runat="server" id="btn3"  Onclick="Submit"></asp:Button>
            </div>
        <div class="win-bottom win-course-pos13"></div>
        <button type="button" onclick="confirms()" class="button-view win-course-pos14">确认</button>
        <button type="button" onclick="shutdown_schedule()" class="button-view win-course-pos15">取消</button>
		</div>
		<script type="text/javascript">
            document.getElementById('win-background1').style.display = "none";
            document.getElementById('win-background2').style.display = "none";
            function display() {
                document.getElementById('win-background1').style.display = "";
            }
            function shutdown() {
                document.getElementById('win-background1').style.display = "none";
            }
            function display_schedule() {
                document.getElementById('win-background2').style.display = "";
            }
            function shutdown_schedule() {
                document.getElementById('win-background2').style.display = "none";
            }
            function databind() {
                document.getElementById("btn1").click();
            }
            function confirms() {
                document.getElementById("btn3").click();
            }
		</script>
        </form>
</body>
</html>
