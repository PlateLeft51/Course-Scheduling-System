<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bulletin.aspx.cs" Inherits="实验室排课系统.Auditor.Bulletin" %>

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
                <li class="sidebar-verified"><a href="Audit.aspx" class="refer">审核管理</a></li>
                <li class="sidebar-schedule"><a href="Schedule.aspx" class="refer" >排课管理</a></li>
            </ol>
            <p class="sidebar-paragraph">系统管理</p>
            <ol>
                <li class="sidebar-info"><a href="Info.aspx" class="refer">个人信息</a></li>
                <li class="sidebar-bulletin-selected"><a href="Bulletin.aspx" class="refer">通知公告</a></li>
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
                <div class="theme-content"><h1>通知公告</h1></div>
            </div>
            <div class="borderline"></div>
            <div class="content">
                <div class="searchbar">
                    <div class="stu-course-pos1">审核员：</div>
                    <div class="stu-course-pos2">桐宇</div>
                    <div class="stu-course-pos3">学期：</div>
                    <select id="select-semester" class="select-view select-view-width2 stu-course-pos4">
                        <option value="0">所有学期</option>
                        <option value="A">2020-2021学年春季学期</option>
                        <option value="B">2020-2021学年秋季学期</option>
                        <option value="C">2019-2020学年春季学期</option>
                        <option value="D">2019-2020学年秋季学期</option>
                    </select>
                    <div class="stu-course-pos5">周次：</div>
                    <select id="select-week" class="select-view select-view-width1 stu-course-pos6">
                        <option value="0">所有周次</option>
                        <option value="A">第1周</option>
                        <option value="B">第2周</option>
                        <option value="C">第3周</option>
                        <option value="D">第4周</option>
                    </select>
                </div>
                <div class="illustration-left">消息列表</div>
                    <button type="button" onclick="display_post()" class="button-view tea-bulletin-pos1">发布公告</button>
                <div class="chart">
                    <asp:GridView ID="GridView" runat="server" CssClass="GridViewStyle" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="10" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderStyle-Width="300px" DataField="theme" HeaderText="主题" />
                            <asp:BoundField HeaderStyle-Width="800px"   />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="author" HeaderText="发件人"/>
                            <asp:BoundField HeaderStyle-Width="200px" DataField="time" HeaderText="时间" />
                        </Columns>
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectedRowStyle"  />
                        <PagerStyle CssClass="GridViewPagerStyle"  />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                    </asp:GridView>
                </div>
                <div class="illustration-left tea-bulletin-pos2">已发送</div> 
                <div class="chart">
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle tea-bulletin-pos3" AutoGenerateColumns="False" CellPadding="4"
                        AllowPaging="True" PageSize="10" ForeColor="#333333" GridLines="None" OnRowDataBound="GridView_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderStyle-Width="300px" DataField="theme" HeaderText="主题" />
                            <asp:BoundField HeaderStyle-Width="800px"   />
                            <asp:BoundField HeaderStyle-Width="200px" DataField="receiver" HeaderText="收件人"/>
                            <asp:BoundField HeaderStyle-Width="200px" DataField="time" HeaderText="时间" />
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
    <div class="win-background" id='win-background1'>
			<div class="win-password-content">
			</div>
            <div class="win-password-title"><h2>通知信息</h2></div>
            <div class="borderline2 win-password-border"></div>
            <div class="win-notice-pos1"><h3>审核通过通知</h3></div>
            <div class="win-notice-pos2 info-key">收件人：赵栗鹏&nbsp;&nbsp;&nbsp;2021/03/26 16:44</div>
            <div class="win-notice-pos3 info-key"></div>
            <div class="win-notice-pos4">尊敬的赵栗鹏老师：<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据实验室安排，您的排课申请（程序综合实验，第8周周五第四大节）现已审核通过，请您及时调整时间准时上课。祝您工作顺利！</div>
            <div class="win-password-pos12 win-bottom"></div>
            <button type="button" onclick="shutdown()" class="button-view win-password-pos10">确认</button>
            <button type="button" onclick="shutdown()" class="button-view win-password-pos11">取消</button>
		</div>
		
        <div class="win-background" id='win-background2'>
			<div class="win-password-content win-notice-pos5">
			</div>
            <div class="win-password-title win-notice-pos6"><h2>公告发布</h2></div>
            <div class="borderline2 win-notice-pos7"></div>
            <div class="win-notice-pos8"><h3>主题：</h3></div>
            <input type="text" class="win-input-view win-notice-pos9" name="confirm">
            <div class="win-notice-pos10"><h3>收件人：</h3></div>
            <select id="select-receiver" class="select-view select-view-width1 win-notice-pos11">
                <option value="A">教师用户</option>
                <option value="B">学生用户</option>
            </select>
            <div class="win-notice-pos12"><h3>正文：</h3></div>
            <textarea class="input-view win-notice-pos13" name="confirm"></textarea>
            <div class="win-bottom win-notice-pos14"></div>
            <button type="button" onclick="shutdown_post()" class="button-view win-notice-pos15">确认</button>
            <button type="button" onclick="shutdown_post()" class="button-view win-notice-pos16">取消</button>
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
                function display_post() {
                    document.getElementById('win-background2').style.display = "";
                }
                function shutdown_post() {
                    document.getElementById('win-background2').style.display = "none";
                }
		</script>
</body>
</html>
