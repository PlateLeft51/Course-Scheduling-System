<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="实验室排课系统.Admin.Course" %>

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
                <li class="sidebar-course-selected"><a href="Course.aspx" class="refer">课程管理</a></li>
                <li class="sidebar-schedule"><a href="Schedule.aspx" class="refer" >排课管理</a></li>
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
                <div class="theme-content"><h1>课程管理</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                 <div class="searchbar">
                    <div class="stu-course-pos1">学期：</div>
                    <select id="select-semester" class="select-view select-view-width2 adm-bulletin-pos2">
                        <option value="0">所有学期</option>
                        <option value="A">2020-2021学年春季学期</option>
                        <option value="B">2020-2021学年秋季学期</option>
                        <option value="C">2019-2020学年春季学期</option>
                        <option value="D">2019-2020学年秋季学期</option>
                    </select>
                    <div class="stu-course-pos3">周次：</div>
                    <select id="select-week" class="select-view select-view-width1 stu-course-pos4">
                        <option value="0">所有周次</option>
                        <option value="A">第1周</option>
                        <option value="B">第2周</option>
                        <option value="C">第3周</option>
                        <option value="D">第4周</option>
                    </select>
                </div>
                <div class="illustration-left">审核列表</div>
                <button type="button" onclick="display_schedule()" class="button-view aud-audit-pos1">新增排课</button>
                <button type="button" onclick="display_post()" class="button-view aud-audit-pos2">新增课程</button>
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
                            <asp:BoundField HeaderStyle-Width="140px" DataField="time" HeaderText="申请时间" />
                            <asp:BoundField HeaderStyle-Width="140px" DataField="remarks" HeaderText="备注" />
                        </Columns>
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle"  />
                        <PagerStyle CssClass="GridViewPagerStyle"  />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                    </asp:GridView>
                </div>
                <div class="illustration-left tea-bulletin-pos2">课程列表</div>
                <div class="chart">
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle tea-bulletin-pos3" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="10" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderStyle-Width="200px" DataField="number" HeaderText="课程编号" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="courname" HeaderText="课程名称" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="major" HeaderText="适用专业" />
                            <asp:BoundField HeaderStyle-Width="600px" DataField="class" HeaderText="班级" />
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
		<div class="win-password-content win-user-pos1 win-course-length3"></div>
        <div class="win-user-pos2"><h2>课程创建</h2></div>
        <div class="borderline2 win-user-pos3 win-course-length4"></div>
        <div class="win-user-pos4"><h3>课程编号</h3></div>
        <input type="text" class="input-view win-user-pos5 win-course-length1" name="confirm">
        <div class="win-user-pos6"><h3>课程名称</h3></div>
        <input type="text" class="input-view win-user-pos7 win-course-length2" name="confirm">
        <div class="win-user-pos8"><h3>适用专业</h3></div>
        <input type="text" class="input-view win-user-pos9 win-course-length2" name="confirm">
        <div class="win-user-pos10"><h3>班级</h3></div>
        <input type="text" class="input-view win-user-pos11 win-course-length2" name="confirm">
        <div class="win-user-pos12"><h3>备注</h3></div>
        <input type="text" class="input-view win-user-pos13 win-course-length2" name="confirm">
        <div class="win-bottom win-user-pos22 win-course-length5"></div>
        <button type="button" onclick="shutdown_post()" class="button-view win-user-pos23 win-course-length6">确认</button>
        <button type="button" onclick="shutdown_post()" class="button-view win-user-pos24 win-course-length7">取消</button>
		</div>
    <div class="win-background" id='win-background3'>
		<div class="win-password-content win-user-pos1 win-course-pos1"></div>
        <div class="win-course-pos2"><h2>新增排课</h2></div>
        <div class="borderline2 win-course-pos3"></div>
        <div class="win-course-pos4">周次：</div>
                    <select id="select-week-win" class="select-view win-course-pos5">
                        <option value="A">第1周</option>
                        <option value="B">第2周</option>
                        <option value="C">第3周</option>
                        <option value="D">第4周</option>
                    </select>
                    <div class="win-course-pos6">课程：</div>
                    <select id="select-course-win" class="select-view win-course-pos7">
                        <option value="0">请选择课程</option>
                        <option value="A">数据结构</option>
                        <option value="B">C语言程序设计</option>
                        <option value="C">算法设计与分析</option>
                        <option value="D">程序综合实验</option>
                    </select>
                    <div class="win-course-pos8">教师：</div>
                    <select id="select-teacher-win" class="select-view win-course-pos9">
                        <option value="0">请选择教师</option>
                        <option value="A">赵栗鹏</option>
                        <option value="B">杨鹏伟</option>
                        <option value="C">周茜</option>
                        <option value="D">陈芳华</option>
                    </select>
                    <div class="win-course-pos10">班级：</div>
                    <select id="select-class-win" class="select-view win-course-pos11">
                        <option value="0">请选择班级</option>
                        <option value="A">计171</option>
                        <option value="B">计172</option>
                        <option value="C">软件171</option>
                        <option value="D">软件172</option>
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
            </div>
        <div class="win-bottom win-course-pos13"></div>
        <button type="button" onclick="shutdown_schedule()" class="button-view win-course-pos14">确认</button>
        <button type="button" onclick="shutdown_schedule()" class="button-view win-course-pos15">取消</button>
		</div>
		<script type="text/javascript">
            document.getElementById('win-background1').style.display = "none";
            document.getElementById('win-background2').style.display = "none";
            document.getElementById('win-background3').style.display = "none";
            function display() {
                document.getElementById('win-background1').style.display = "";
            }
            function shutdown() {
                document.getElementById('win-background1').style.display = "none";
            }
            function display_post() {
                document.getElementById('win-background2').style.display = "";
            }
            function shutdown_post() {
                document.getElementById('win-background2').style.display = "none";
            }
            function display_schedule() {
                document.getElementById('win-background3').style.display = "";
            }
            function shutdown_schedule() {
                document.getElementById('win-background3').style.display = "none";
            }
		</script>
        </form>
</body>
</html>
