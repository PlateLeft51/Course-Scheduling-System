using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;

namespace 实验室排课系统.Teacher
{
    public partial class Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        protected void download(object sender, EventArgs e)
        {
            Response.ContentType = "application/x-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=Course.xlsx");
            string filename = Server.MapPath("../Util/Course-teacher.xlsx");
            Response.TransmitFile(filename);
        }

        public void bind()
        {
            string str_teacher = "周茜";
            string str_semester = select_semester.Value;
            string str_week = select_week.Value;
            string str = "select * from t_schedule where applicant='" + str_teacher + "' and status='pass'";
            if (!str_semester.Equals("所有学期"))
            {
                string[] s = Regex.Split(str_semester, "学年");
                string[] t = s[0].Split('-');
                if (s[1].Substring(0, 1).Equals("春"))
                {
                    str_semester = t[1] + "春";
                }
                else
                {
                    str_semester = t[0] + "秋";
                }
                str += "and semester='" + str_semester + "'";
            }
            if (!str_week.Equals("所有周次"))
            {
                str_week = str_week.Substring(1, str_week.Length - 2);

                str += "and week='" + str_week + "'";
            }
            DataSet ds = new DataSet();
            DataTable table = new DataTable();
            DataTable table_str = Operation.GetDataTable(str);
            DataColumnCollection columns = table.Columns;
            columns.Add("number", typeof(String));
            columns.Add("courname", typeof(String));
            columns.Add("week", typeof(String));
            columns.Add("section", typeof(String));
            columns.Add("class", typeof(String));
            columns.Add("zone", typeof(String));
            DataRowCollection row = table.Rows;
            for (int i = 0; i < table_str.Rows.Count; i++)
            {
                string[] grid = new string[6];
                string[] week = { "0", "一", "二", "三", "四", "五" };
                grid[0] = table_str.Rows[i][1].ToString();
                grid[1] = table_str.Rows[i][2].ToString();
                grid[2] = table_str.Rows[i][4].ToString();
                grid[3] = "周" + week[int.Parse(table_str.Rows[i][5].ToString())] + "第" + week[int.Parse(table_str.Rows[i][6].ToString())] + "大节";
                grid[4] = table_str.Rows[i][8].ToString();
                grid[5] = table_str.Rows[i][7].ToString();
                row.Add(grid[0], grid[1], grid[2], grid[3], grid[4], grid[5]);
            }

            ds.Tables.Add(table);
            GridView.DataSource = ds;
            GridView.DataBind();


            //申请列表 DataBind
            str_teacher = "周茜";
            str_semester = select_semester.Value;
            str_week = select_week.Value;
            str = "select * from t_schedule where applicant='" + str_teacher + "' and status!='pass'";
            if (!str_semester.Equals("所有学期"))
            {
                string[] s = Regex.Split(str_semester, "学年");
                string[] t = s[0].Split('-');
                if (s[1].Substring(0, 1).Equals("春"))
                {
                    str_semester = t[1] + "春";
                }
                else
                {
                    str_semester = t[0] + "秋";
                }
                str += "and semester='" + str_semester + "'";
            }
            if (!str_week.Equals("所有周次"))
            {
                str_week = str_week.Substring(1, str_week.Length - 2);

                str += "and week='" + str_week + "'";
            }
            ds = new DataSet();
            table = new DataTable();
            table_str = Operation.GetDataTable(str);
            columns = table.Columns;
            columns.Add("number", typeof(String));
            columns.Add("courname", typeof(String));
            columns.Add("week", typeof(String));
            columns.Add("section", typeof(String));
            columns.Add("class", typeof(String));
            columns.Add("zone", typeof(String));
            columns.Add("time", typeof(String));
            columns.Add("result", typeof(String));
            row = table.Rows;
            if (table_str.Rows.Count == 0)
            {
                row.Add("", "", "", "", "", "", "", "");
            }
            for (int i = 0; i < table_str.Rows.Count; i++)
            {
                string[] grid = new string[8];
                string[] week = { "0", "一", "二", "三", "四", "五" };
                grid[0] = table_str.Rows[i][0].ToString();
                grid[1] = table_str.Rows[i][2].ToString();
                grid[2] = table_str.Rows[i][4].ToString();
                grid[3] = "周" + week[int.Parse(table_str.Rows[i][5].ToString())] + "第" + week[int.Parse(table_str.Rows[i][6].ToString())] + "大节";
                grid[4] = table_str.Rows[i][8].ToString();
                grid[5] = table_str.Rows[i][7].ToString();
                grid[6] = table_str.Rows[i][11].ToString();
                grid[7] = table_str.Rows[i][14].ToString().Equals("pending")?"待审核":"未通过";
                row.Add(grid[0], grid[1], grid[2], grid[3], grid[4], grid[5], grid[6], grid[7]);
            }

            ds.Tables.Add(table);
            GridView1.DataSource = ds;
            GridView1.DataBind();



            



            DataSet dss = new DataSet();
            table = new DataTable("course");
            columns = table.Columns;

            columns.Add("week", typeof(String));
            columns.Add("section", typeof(String));
            columns.Add("d1a1", typeof(String));
            columns.Add("d1a2", typeof(String));
            columns.Add("d1a3", typeof(String));
            columns.Add("d1b1", typeof(String));
            columns.Add("d1b2", typeof(String));
            columns.Add("d1b3", typeof(String));
            columns.Add("d1c1", typeof(String));
            columns.Add("d1c2", typeof(String));
            columns.Add("d1c3", typeof(String));
            row = table.Rows;
            row.Add("周一", "第一大节", "", "", "", "", "", "", "", "", "");
            row.Add("周一", "第二大节", "数据结构<br/>(陈芳华 计171)", "数据结构<br/>(陈芳华 计172)", "", "", "", "", "", "", "");
            row.Add("周一", "第三大节", "", "", "", "", "", "", "", "", "");
            row.Add("周一", "第四大节", "", "", "", "", "", "", "", "", "");
            row.Add("周二", "第一大节", "", "", "", "", "算法设计与分析<br/>(田安雨 软件171)", "算法设计与分析<br/>(田安雨 软件172)", "", "", "");
            row.Add("周二", "第二大节", "", "", "", "", "", "", "", "", "");
            row.Add("周二", "第三大节", "", "", "", "", "", "", "", "", "");
            row.Add("周二", "第四大节", "", "", "", "", "", "", "", "", "");
            row.Add("周三", "第一大节", "", "", "", "", "", "", "", "", "");
            row.Add("周三", "第二大节", "", "", "", "", "", "", "", "", "");
            row.Add("周三", "第三大节", "", "", "", "", "", "", "", "", "");
            row.Add("周三", "第四大节", "", "C语言程序设计<br/>(周茜 计171)", "C语言程序设计<br/>(周茜 计172)", "", "数据结构<br/>(陈芳华 软件171)", "数据结构<br/>(陈芳华 软件172)", "", "", "");
            row.Add("周四", "第一大节", "", "", "", "", "", "", "", "", "");
            row.Add("周四", "第二大节", "", "", "", "", "", "", "", "", "");
            row.Add("周四", "第三大节", "", "", "", "", "", "", "", "", "");
            row.Add("周四", "第四大节", "", "C语言程序设计<br/>(周茜 软件171)", "C语言程序设计<br/>(周茜 软件172)", "", "", "", "", "程序综合实验<br/>(赵栗鹏 计171)", "程序综合实验<br/>(赵栗鹏 计172)");
            row.Add("周五", "第一大节", "", "", "", "", "", "", "", "", "");
            row.Add("周五", "第二大节", "", "", "", "", "", "", "", "", "");
            row.Add("周五", "第三大节", "", "", "", "", "", "", "", "", "");
            row.Add("周五", "第四大节", "", "", "", "", "", "", "", "程序综合实验<br/>(赵栗鹏 计171)", "程序综合实验<br/>(赵栗鹏 计172)");

            dss.Tables.Add(table);

            GridView2.DataSource = dss;
            GridView2.DataBind();
            MergeRows(GridView2);
        }
        protected void bind_select(object sender, EventArgs e)
        {
            bind();
        }
        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("style", "cursor:pointer");
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#ECF5FF'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                //e.Row.Attributes.Add("OnClick", "display()");
            }
        }
        protected void GridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)   //判断创建的行是不是标题行
            {
                TableCellCollection tcl = e.Row.Cells;
                tcl.Clear();

                //添加新的表头
                tcl.Add(new TableHeaderCell());
                tcl[0].RowSpan = 2;
                tcl[0].Text = "星期";
                Label l1 = new Label();
                l1.Text = "星期";
                tcl[0].Controls.Add(l1);
                tcl[0].Attributes["Width"] = "70px";
                tcl.Add(new TableHeaderCell());

                tcl[1].RowSpan = 2;                             //合并列
                tcl[1].Text = "节次";
                tcl[1].Attributes["Width"] = "80px";
                tcl.Add(new TableHeaderCell());
                tcl[2].ColumnSpan = 9;
                tcl[2].Text = "实验室分区</th></tr><tr><th style='width:149px'>A1</th><th style='width:149px'>A2</th><th style='width:149px'>A3</th>" +
                                                      "<th style='width:149px'>B1</th><th style='width:149px'>B2</th><th style='width:149px'>B3</th>" +
                                                      "<th style='width:149px'>C1</th><th style='width:149px'>C2</th><th style='width:149px'>C3</th>";

            }
        }
        protected void GridView_RowDataBound2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cells = e.Row.Cells;
                for (int i = 2; i <= 10; i++)
                {
                    cells[i].Text = Server.HtmlDecode(cells[i].Text);
                    if (cells[i].Text.Length <= 1)
                    {
                        cells[i].Attributes.Add("style", "cursor:pointer");
                        cells[i].Attributes.Add("onclick", "this.style.backgroundColor='#F0F0F0'");
                    }
                }
            }
        }

        public static void MergeRows(GridView gridView)
        {
            for (int rowIndex = gridView.Rows.Count - 2; rowIndex >= 0; rowIndex--)
            {
                GridViewRow row = gridView.Rows[rowIndex];
                GridViewRow previousRow = gridView.Rows[rowIndex + 1];

                if (row.Cells[0].Text == previousRow.Cells[0].Text)
                {
                    row.Cells[0].RowSpan = previousRow.Cells[0].RowSpan < 2 ? 2 :
                                           previousRow.Cells[0].RowSpan + 1;
                    previousRow.Cells[0].Visible = false;
                    
                }
            }
        }
        protected void Submit(object sender, EventArgs e)
        {
            string str = "insert into t_schedule value('10020','G10240201','C语言程序与设计','2021春','8','3','4','B1','软件172','周茜','','"+DateTime.Now.ToString()+"','10217','','pending','','无')";
            Operation.StrExecute(str);
            WebMessageBox.Show("申请提交成功！");
            bind();
        }
    }
}