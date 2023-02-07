using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace 实验室排课系统.Admin
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

            /*
            string strCon = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            string str = "insert into t_student  value(9,'289','s','s','130102199903271556','s','s','s','s')";
            MySqlConnection con = new MySqlConnection(strCon);
            MySqlCommand command = new MySqlCommand(str, con);
            con.Open();
            command.ExecuteNonQuery();
            con.Close();
            */
            WebMessageBox.Show("数据库已连接");



        }

        public void bind()
        {
            /*
            string strCon = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            string str = "select username,password,name,sex,IDnumber from t_student";
            MySqlConnection con = new MySqlConnection(strCon);
            MySqlDataAdapter adapter = new MySqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            con.Open();
            adapter.Fill(ds, "student");
            */

            DataSet dss = new DataSet();
            DataTable table = new DataTable("course");
            DataColumnCollection columns = table.Columns;
            columns.Add("number", typeof(String));
            columns.Add("courname", typeof(String));
            columns.Add("teacher", typeof(String));
            columns.Add("semester", typeof(String));
            columns.Add("week", typeof(String));
            columns.Add("section", typeof(String));
            columns.Add("class", typeof(String));
            columns.Add("zone", typeof(String));
            columns.Add("time", typeof(String));
            columns.Add("remarks", typeof(String));
            DataRowCollection row = table.Rows;
            row.Add("10009", "算法设计与分析", "李焱", "2021春", "9", "周一第四大节", "计171、计172", "C1、C2", "2021/03/29 16:44", "待审核");
            row.Add("10008", "Python程序设计", "叶启羲", "2021春", "10", "周五第二大节", "软件181、软件182", "C1、C2", "2021/03/29 16:44", "待审核");
            row.Add("10007", "操作系统", "王东", "2021春", "9", "周四第三大节", "计191、计192", "B1、B2", "2021/03/29 16:44", "待审核");
            row.Add("10006", "计算机组成原理", "张哲龙", "2021春", "9", "周二第三大节", "软件191、软件192", "C1、C2", "2021/03/29 16:44", "待审核");
            row.Add("10005", "数据库原理及应用", "王璐空", "2021春", "9", "周五第一大节", "计181、计182", "A1、A2", "2021/03/29 16:44", "待审核");


            dss.Tables.Add(table);

            GridView.DataSource = dss;
            GridView.DataBind();



            dss = new DataSet();
            table = new DataTable("course");
            columns = table.Columns;
            columns.Add("number", typeof(String));
            columns.Add("courname", typeof(String));
            columns.Add("major", typeof(String));
            columns.Add("class", typeof(String));
            columns.Add("remarks", typeof(String));
            row = table.Rows;
            row.Add("G10249345", "数据结构", "计算机系、软件工程系", "计171、计172、计173、软件171、软件172、软件173", "无");
            row.Add("G10417952", "算法设计与分析", "计算机系、软件工程系", "计171、计172、计173、软件171、软件172、软件173", "无");
            row.Add("G10274894", "程序综合实验", "计算机系、软件工程系", "计171、计172、计173、软件171、软件172、软件173", "无");
            row.Add("G10286320", "Java程序设计", "计算机系、软件工程系", "计171、计172、计173、软件171、软件172、软件173", "无");
            row.Add("G10276259", "操作系统", "计算机系、软件工程系", "计171、计172、计173、软件171、软件172、软件173", "无");

            dss.Tables.Add(table);

            GridView1.DataSource = dss;
            GridView1.DataBind();
            //con.Close();

            dss = new DataSet();
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
        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("style", "cursor:pointer");
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#ECF5FF'");
                //当鼠标移开时还原背景色
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                e.Row.Attributes.Add("OnClick", "display()");
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
                        cells[i].Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#ECF5FF'");
                        //当鼠标移开时还原背景色
                        cells[i].Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                        cells[i].Attributes.Add("OnClick", "display()");
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
    }
}