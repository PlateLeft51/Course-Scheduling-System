<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="实验室排课系统.Teacher.Schedule" %>

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
            <div class="sidebar-userinfo sidebar-u-tea">
                <div class="sidebar-userinfo-name">周茜</div>
                <div class="sidebar-userinfo-title">10628</div>
            </div>
            <div class="borderline2"></div>
            <p class="sidebar-paragraph">排课操作</p>
            <ol>
                <li class="sidebar-course"><a href="Course.aspx" class="refer">课程管理</a></li>
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
                    <div class="stu-course-pos1">当前显示：</div>
                    <select id="select_mode" class="select-view select-view-width1 stu-course-pos2" runat="server" onchange="databind()">
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
                    <asp:Button runat="server" class="button-view stu-course-pos7" OnClick="download" text="下载" ></asp:Button>
                    <asp:Button runat="server" id="btn1"  Onclick="bind_select"></asp:Button>
                    
                </div>
            </div>
            <div class="illustration-left" id="illustration" runat="server">2020-2021学年春季学期第8周实验安排（周茜）</div>
            <button type="button" onclick="display()" class="button-view tea-bulletin-pos1">申请排课</button>
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
    
    <div class="win-background" id='win_background1' runat="server">
					<div class="win-password-content win-user-pos1 win-course-pos1"></div>
        <div class="win-course-pos2"><h2>新增排课</h2></div>
        <div class="borderline2 win-course-pos3"></div>
        <div class="win-course-pos4">周次：</div>
                    <select id="select_week_win" class="select-view win-course-pos5" runat="server" >
                        <option value="第8周">第8周</option>
                        <option value="第9周">第9周</option>
                        <option value="第10周">第10周</option>
                        <option value="第11周">第11周</option>
                        <option value="第12周">第12周</option>
                    </select>
                    <div class="win-course-pos6">课程：</div>
                    <select id="select_course_win" class="select-view win-course-pos7" runat="server" >
                        <option value="请选择课程">请选择课程</option>
                        <option value="数据结构">数据结构</option>
                        <option value="C语言程序设计">C语言程序设计</option>
                        <option value="算法设计与分析">算法设计与分析</option>
                        <option value="程序综合实验">程序综合实验</option>
                    </select>
                    <div class="win-course-pos8">教师：</div>
                    <div class="win-course-pos16">周茜</div>
                   
                    <div class="win-course-pos10">班级：</div>
                    <select id="select_class_win" class="select-view win-course-pos11" runat="server" >
                        <option value="请选择班级">请选择班级</option>
                        <option value="计171">计171</option>
                        <option value="计172">计172</option>
                        <option value="软件171">软件171</option>
                        <option value="软件172">软件172</option>
                    </select>
        <asp:Button runat="server" id="btn2"  Onclick="Submit"></asp:Button>
            <div class="win-course-pos12">
                <asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="20" ForeColor="#333333" GridLines="None" OnRowCreated="GridView_RowCreated" 
                        oncolumndatabound="MergeRows" OnRowDataBound="GridView_RowDataBound2" >
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
        <button type="button" onclick="confirm()" class="button-view win-course-pos14">确认</button>
        <button type="button" onclick="shutdown()" class="button-view win-course-pos15">取消</button>
		</div>
		<script type="text/javascript">
            document.getElementById('win_background1').style.display = "none";
            function display() {
                document.getElementById('win_background1').style.display = "block";
            }
            function shutdown() {
                document.getElementById('win_background1').style.display = "none";
            }
            function databind() {
                document.getElementById("btn1").click();
            }
            function confirm() {
                document.getElementById("btn3").click();
            }

		</script>
        </form>
</body>
</html>
