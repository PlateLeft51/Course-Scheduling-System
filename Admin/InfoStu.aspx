<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoStu.aspx.cs" Inherits="实验室排课系统.Admin.InfoStu" %>

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
                <li class="sidebar-student-selected"><a href="InfoStu.aspx" class="refer">学生管理</a></li>
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
                <div class="theme-content"><h1>学生管理</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                <div class="searchbar">
                    <div class="adm-infostu-pos1">学号：</div>
                    <div class="adm-infostu-pos2">
                        <input type="text" class="input-view" id="input_username" runat="server">
                    </div>
                    <div class="adm-infostu-pos3">姓名：</div>
                    <div class="adm-infostu-pos4">
                        <input type="text" class="input-view" id="input_name" runat="server">
                    </div>
                    <div class="adm-infostu-pos5">班级：</div>
                    <select id="select_class" class="select-view select-view-width1 adm-infostu-pos6" runat="server">
                        <option value="所有班级">所有班级</option>
                        <option value="计171">计171</option>
                        <option value="计172">计172</option>
                        <option value="计173">计173</option>
                        <option value="软件171">软件171</option>
                        <option value="软件172">软件172</option>
                        <option value="软件173">软件173</option>
                        <option value="计181">计181</option>
                        <option value="计182">计182</option>
                        <option value="计183">计183</option>
                        <option value="软件181">软件181</option>
                        <option value="软件182">软件182</option>
                        <option value="软件183">软件183</option>
                    </select>
                    <div class="adm-infostu-pos7">学院：</div>
                    <select id="select_faculty" class="select-view select-view-width2 adm-infostu-pos8" runat="server">
                        <option value="所有学院">所有学院</option>
                        <option value="机械工程学院">机械工程学院</option>
                        <option value="电子信息工程学院">电子信息工程学院</option>
                        <option value="理学院">理学院</option>
                        <option value="人工智能与数据科学学院">人工智能与数据科学学院</option>
                    </select>
                   
                    <asp:Button id="btn1" runat="server" class="button-view adm-infostu-pos9" onclick="bind_select" text="查询" ></asp:Button>
                </div>
                <div class="illustration-left">学生用户</div>
                <button type="button" onclick="display_post()" class="button-view adm-infostu-pos10">创建用户</button>
                <asp:Button runat="server" class="button-view adm-infostu-pos11" onclick="download" text="创建班级" ></asp:Button>
                <div class="chart">
                    <asp:GridView ID="GridView" runat="server" CssClass="GridViewStyle" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="10" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderStyle-Width="120px" DataField="name" HeaderText="姓名" />
                            <asp:BoundField HeaderStyle-Width="120px" DataField="username" HeaderText="学号" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="password" HeaderText="密码" />
                            <asp:BoundField HeaderStyle-Width="120px" DataField="sex" HeaderText="性别" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="IDnumber" HeaderText="身份证号" />
                            <asp:BoundField HeaderStyle-Width="120px" DataField="class" HeaderText="班级" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="major" HeaderText="专业" />
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
    
    <div class="win-background" id='win-background1'>
			<div class="win-password-content win-user-pos1"></div>
        <div class="win-user-pos2"><h2>用户信息（学生）</h2></div>
        <div class="borderline2 win-user-pos3"></div>
        <div class="win-user-pos4"><h3>学号</h3></div>
        <input type="text" class="input-view win-user-pos5" id="info_username" runat="server" value="174829">
        <div class="win-user-pos6"><h3>密码</h3></div>
        <input type="text" class="input-view win-user-pos7" id="info_password" runat="server" value="085690">
        <div class="win-user-pos8"><h3>姓名</h3></div>
        <input type="text" class="input-view win-user-pos9" id="info_name" runat="server" value="张岭杉">
        <div class="win-user-pos10"><h3>性别</h3></div>
        <select id="info_sex" class="win-select-view select-view-width1 win-user-pos11" runat="server">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        <div class="win-user-pos12"><h3>身份证号</h3></div>
        <input type="text" class="input-view win-user-pos13" id="info_IDnumber" runat="server" value="130106199912085690">
        <div class="win-user-pos14"><h3>班级</h3></div>
        <select id="info_class" class="win-select-view select-view-width1 win-user-pos15" runat="server">
                <option value="计171">计171</option>
                <option value="计172">计172</option>
                <option value="计173">计173</option>
                <option value="软件171">软件171</option>
                <option value="软件172">软件172</option>
                <option value="软件173">软件173</option>
                <option value="计181">计181</option>
                <option value="计182">计182</option>
                <option value="计183">计183</option>
                <option value="软件181">软件181</option>
                <option value="软件182">软件182</option>
                <option value="软件183">软件183</option>
            </select>
        <div class="win-user-pos16"><h3>专业</h3></div>
        <select id="info_major" class="win-select-view select-view-width1 win-user-pos17" runat="server">
                <option value="计算机科学与技术">计算机科学与技术</option>
                <option value="软件工程">软件工程</option>
            </select>
        <div class="win-user-pos18"><h3>学院</h3></div>
        <select id="info_faculty" class="win-select-view select-view-width1 win-user-pos19" runat="server">
                <option value="人工智能与数据科学学院">人工智能与数据科学学院</option>
                <option value="电子信息工程学院">电子信息工程学院</option>
                <option value="机械工程学院">机械工程学院</option>
            </select>
        <div class="win-user-pos20"><h3>备注</h3></div>
        <input type="text" class="input-view win-user-pos21" id="info_remarks" runat="server" value="无">
        <div class="win-bottom win-user-pos22"></div>
        <button type="button" onclick="confirminfo()" class="button-view win-user-pos23">确认</button>
        <button type="button" onclick="shutdown()" class="button-view win-user-pos24">取消</button>
		</div>
    <div class="win-background" id='win-background2'>
		<div class="win-password-content win-user-pos1"></div>
        <div class="win-user-pos2"><h2>创建用户（学生）</h2></div>
        <div class="borderline2 win-user-pos3"></div>
        <div class="win-user-pos4"><h3>学号</h3></div>
        <input type="text" class="input-view win-user-pos5" id="create_username" runat="server">
        <div class="win-user-pos6"><h3>密码</h3></div>
        <input type="text" class="input-view win-user-pos7" id="create_password" runat="server">
        <div class="win-user-pos8"><h3>姓名</h3></div>
        <input type="text" class="input-view win-user-pos9" id="create_name" runat="server">
        <div class="win-user-pos10"><h3>性别</h3></div>
        <select id="create_sex" class="win-select-view select-view-width1 win-user-pos11" runat="server">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        <div class="win-user-pos12"><h3>身份证号</h3></div>
        <input type="text" class="input-view win-user-pos13" id="create_IDnumber" runat="server">
        <div class="win-user-pos14"><h3>班级</h3></div>
        <select id="create_class" class="win-select-view select-view-width1 win-user-pos15" runat="server">
                <option value="计171">计171</option>
                <option value="计172">计172</option>
                <option value="计173">计173</option>
                <option value="软件171">软件171</option>
                <option value="软件172">软件172</option>
                <option value="软件173">软件173</option>
                <option value="计181">计181</option>
                <option value="计182">计182</option>
                <option value="计183">计183</option>
                <option value="软件181">软件181</option>
                <option value="软件182">软件182</option>
                <option value="软件183">软件183</option>
            </select>
        <div class="win-user-pos16"><h3>专业</h3></div>
        <select id="create_major" class="win-select-view select-view-width1 win-user-pos17" runat="server">
                <option value="计算机科学与技术">计算机科学与技术</option>
                <option value="软件工程">软件工程</option>
            </select>
        <div class="win-user-pos18"><h3>学院</h3></div>
        <select id="create_faculty" class="win-select-view select-view-width1 win-user-pos19" runat="server">
                <option value="人工智能与数据科学学院">人工智能与数据科学学院</option>
                <option value="电子信息工程学院">电子信息工程学院</option>
                <option value="机械工程学院">机械工程学院</option>
            </select>
        <div class="win-user-pos20"><h3>备注</h3></div>
        <input type="text" class="input-view win-user-pos21" id="create_remarks" runat="server">
        <div class="win-bottom win-user-pos22"></div>
        <button type="button" onclick="confirms()" class="button-view win-user-pos23">确认</button>
        <button type="button" onclick="shutdown_post()" class="button-view win-user-pos24">取消</button>
        <button type="button" onclick="display_confirm()" class="button-view win-user-pos25">选择文件</button>
		</div>

    <div class="win-background" id='win-background3'>
            <div class="win-password-content win-user-pos26"></div>
        <div class="win-user-pos27"><h2>用户信息（学生）</h2></div>
        <div class="borderline2 win-user-pos28"></div>
        <div class="win-user-pos33"><h3>信息确认</h3></div>
        <div class="win-user-pos29">
            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle" AutoGenerateColumns="False" CellPadding="4" 
                        AllowPaging="True" PageSize="10" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView_RowDataBound" OnRowEditing="GridView1_RowEditing" >
                        <Columns>
                            <asp:BoundField HeaderStyle-Width="120px" DataField="name" HeaderText="姓名" />
                            <asp:BoundField HeaderStyle-Width="120px" DataField="username" HeaderText="学号" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="password" HeaderText="密码" />
                            <asp:BoundField HeaderStyle-Width="120px" DataField="sex" HeaderText="性别" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="IDnumber" HeaderText="身份证号" />
                            <asp:BoundField HeaderStyle-Width="120px" DataField="class" HeaderText="班级" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="major" HeaderText="专业" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="faculty" HeaderText="学院" />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="remarks" HeaderText="备注" />
                        </Columns>
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle"  />
                        <PagerStyle CssClass="GridViewPagerStyle"  />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                    </asp:GridView>
                    <asp:Button runat="server" id="btn2"  Onclick="UpdateInfo"></asp:Button>
                    <asp:Button runat="server" id="btn3"  Onclick="Submit"></asp:Button>
        </div>
        <div class="win-bottom win-user-pos30"></div>
        <button type="button" onclick="confirms()" class="button-view win-user-pos31">确认</button>
        <button type="button" onclick="shutdown_confirm()" class="button-view win-user-pos32">取消</button>
		
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
            function display_confirm() {
                document.getElementById('win-background2').style.display = "none";
                document.getElementById('win-background3').style.display = "";
            }
            function shutdown_confirm() {
                document.getElementById('win-background3').style.display = "none";
            }
            function confirminfo() {
                document.getElementById("btn2").click();
            }
            function confirms() {
                document.getElementById("btn3").click();
            }
		</script>
        </form>
</body>
</html>
