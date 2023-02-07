<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="实验室排课系统.Student.Course" %>

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
            <div class="sidebar-userinfo sidebar-u-stu">
                <div class="sidebar-userinfo-name">陈明</div>
                <div class="sidebar-userinfo-title">174906</div>
            </div>
            <div class="borderline2"></div>
            <p class="sidebar-paragraph">排课管理</p>
            <ol>
                <li class="sidebar-course-selected"><a href="Course.aspx" class="refer">课程查询</a></li>
                
                <li class="sidebar-schedule"><a href="Schedule.aspx" class="refer" >排课查询</a></li>
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
                <div class="theme-content"><h1>课程查询</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                <div class="searchbar">
                    <div class="stu-course-pos1">班级：</div>
                    <div class="stu-course-pos2">计172</div>
                    <div class="stu-course-pos3">学期：</div>
                    <select id="select_semester" class="select-view select-view-width2 stu-course-pos4" runat="server" onchange="databind()">
                        <option value="所有学期">所有学期</option>
                        <option value="2020-2021学年春季学期">2020-2021学年春季学期</option>
                        <option value="2020-2021学年秋季学期">2020-2021学年秋季学期</option>
                        <option value="2019-2020学年春季学期">2019-2020学年春季学期</option>
                        <option value="2019-2020学年秋季学期">2019-2020学年秋季学期</option>
                    </select>
                    <div class="stu-course-pos5">周次：</div>
                    <select id="select_week" class="select-view select-view-width1 stu-course-pos6"  runat="server" onchange="databind()">
                        <option value="所有周次">所有周次</option>
                        <option value="第8周">第8周</option>
                        <option value="第9周">第9周</option>
                        <option value="第10周">第10周</option>
                        <option value="第11周">第11周</option>
                        <option value="第12周">第12周</option>
                    </select>
                    <asp:Button runat="server" class="button-view stu-course-pos7" onclick="download" text="下载" ></asp:Button>
                    <asp:Button runat="server" id="btn1"  onclick="bind_select"></asp:Button>
                </div>
                <div class="illustration-left">课程列表</div>
                <div class="chart">
                    <asp:GridView ID="GridView" runat="server" CssClass="GridViewStyle" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="10" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderStyle-Width="200px" DataField="number" HeaderText="课程编号" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="courname" HeaderText="课程名称" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="week" HeaderText="周次" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="section" HeaderText="上课时间" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="teacher" HeaderText="教师 " />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="zone" HeaderText="分区" />
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
        <script type="text/javascript">
            function databind() {
                document.getElementById("btn1").click();        
            }
		</script>
    </form>

</body>
</html>
