<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Audit.aspx.cs" Inherits="实验室排课系统.Auditor.Audit" %>

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
            <div class="sidebar-userinfo sidebar-u-aud">
                <div class="sidebar-userinfo-name">桐宇</div>
                <div class="sidebar-userinfo-title">10217</div>
            </div>
            <div class="borderline2"></div>
            <p class="sidebar-paragraph">排课操作</p>
            <ol>
                <li class="sidebar-verified-selected"><a href="Audit.aspx" class="refer">审核管理</a></li>
                <li class="sidebar-schedule"><a href="Schedule.aspx" class="refer" >排课管理</a></li>
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
                <div class="theme-content"><h1>审核管理</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                <div class="searchbar">
                    <div class="stu-course-pos1">审核员：</div>
                    <div class="stu-course-pos2">桐宇</div>
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
                        <option value="所有周次">所有周次</option>
                        <option value="第8周">第8周</option>
                        <option value="第9周">第9周</option>
                        <option value="第10周">第10周</option>
                        <option value="第11周">第11周</option>
                        <option value="第12周">第12周</option>
                    </select>
                    <asp:Button runat="server" class="button-view stu-course-pos7" onclick="download" text="下载" ></asp:Button>
                    <asp:Button runat="server" id="btn1"  Onclick="bind_select"></asp:Button>
                </div>
                <div class="illustration-left">待审核申请</div>
                <button type="button" onclick="display_schedule()" class="button-view aud-audit-pos1">新增排课</button>
                <div class="chart">
                    <asp:GridView ID="GridView" runat="server" CssClass="GridViewStyle" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="10" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderStyle-Width="140px" DataField="number" HeaderText="序号" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="courname" HeaderText="课程名称" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="teacher" HeaderText="申请人" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="semester" HeaderText="学期" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="week" HeaderText="周次" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="section" HeaderText="上课时间" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="class" HeaderText="班级" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="zone" HeaderText="分区" />
                            <asp:BoundField HeaderStyle-Width="160px" DataField="time" HeaderText="申请时间" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="remarks" HeaderText="备注" />
                        </Columns>
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle"  />
                        <PagerStyle CssClass="GridViewPagerStyle"  />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                    </asp:GridView>
                </div>
                <div class="illustration-left tea-bulletin-pos2">已审核申请</div>
                <div class="chart">
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle tea-bulletin-pos3" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="10" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView_RowDataBound1">
                        <Columns>
                            <asp:BoundField HeaderStyle-Width="140px" DataField="number" HeaderText="序号" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="courname" HeaderText="课程名称" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="teacher" HeaderText="申请人" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="semester" HeaderText="学期" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="week" HeaderText="周次" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="section" HeaderText="上课时间" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="class" HeaderText="班级" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="zone" HeaderText="分区" />
                            <asp:BoundField HeaderStyle-Width="160px" DataField="time" HeaderText="申请时间" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="result" HeaderText="审核结果" />
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
        <div class="win-background" id='win-background1'>
        <div class="win-password-content win-audit-pos1"></div>
        <div class="win-audit-pos2"><h2>申请信息</h2></div>
        <div class="borderline2 win-audit-pos3"></div>
                <div class="win-audit-pos4 info-key">序号</div>
                <div class="win-audit-pos5">10004</div>
                <div class="win-audit-pos6 info-key">课程名称</div>
                <div class="win-audit-pos7">数据结构</div>
                <div class="win-audit-pos8 info-key">申请人</div>
                <div class="win-audit-pos9">张桐</div>
                <div class="win-audit-pos10 info-key">周次</div>
                <div class="win-audit-pos11">2021春第10周</div>
                <div class="win-audit-pos12 info-key">上课时间</div>
                <div class="win-audit-pos13">周二第三大节</div>
                <div class="win-audit-pos14 info-key">班级</div>
                <div class="win-audit-pos15">计172</div>
                <div class="win-audit-pos16 info-key">分区</div>
                <div class="win-audit-pos17">C2</div>
                <div class="win-audit-pos18 info-key">申请时间</div>
                <div class="win-audit-pos19">2021/3/27 12:51:16</div>
                <div class="win-audit-pos20 info-key">审核结果</div>
                <div class="win-audit-pos21">通过</div>
            <div class="win-bottom win-audit-pos22"></div>
            <button type="button" onclick="shutdown()" class="button-view win-audit-pos23">确认</button>
            <button type="button" onclick="shutdown()" class="button-view win-audit-pos24">取消</button>
		</div>
		<div class="win-background" id='win-background2'>
		<div class="win-password-content win-user-pos1 win-course-pos1"></div>
        <div class="win-course-pos2"><h2>排课审核</h2></div>
        <div class="borderline2 win-course-pos3"></div>
        <div class="win-course-pos4">周次：</div>
                    <select id="select_week_win" class="select-view win-course-pos5">
                        <option value="第5周">第5周</option>
                        <option value="第6周">第6周</option>
                        <option value="第7周">第7周</option>
                        <option value="第8周" selected>第8周</option>
                        <option value="第9周">第9周</option>
                        <option value="第10周">第10周</option>
                        <option value="第11周">第11周</option>
                        <option value="第12周">第12周</option>
                    </select>
                    <div class="win-course-pos6">课程：</div>
                    <select id="select_course_win" class="select-view win-course-pos7">
                        <option value="0">请选择课程</option>
                        <option value="A">数据结构</option>
                        <option value="B" selected>C语言程序设计</option>
                        <option value="C">算法设计与分析</option>
                        <option value="D">程序综合实验</option>
                        <option value="E">数据库原理及应用</option>
                    </select>
                    <div class="win-course-pos8">教师：</div>
                    <div class="win-course-pos16">周茜</div>
                   
                    <div class="win-course-pos10">班级：</div>
                    <select id="select_class_win" class="select-view win-course-pos11">
                        <option value="0">请选择班级</option>
                        <option value="A">计171</option>
                        <option value="B">计172</option>
                        <option value="C" >软件171</option>
                        <option value="D" selected>软件172</option>
                        <option value="E">计181</option>
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
                <asp:Button runat="server" id="pass"  Onclick="SubmitPass"></asp:Button>
                <asp:Button runat="server" id="failed"  Onclick="SubmitFailed"></asp:Button>
            </div>
        <div class="win-bottom win-course-pos13"></div>
        <button type="button" onclick="audit_pass()" class="button-view win-course-pos17">通过</button>
        <button type="button" onclick="audit_failed()" class="button-view win-course-pos18">不通过</button>
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
            function audit_pass() {
                document.getElementById("pass").click();
            }
            function audit_failed() {
                document.getElementById("failed").click();
            }
		</script>
        </form>
</body>
</html>
