using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Collections;


namespace 实验室排课系统.Teacher
{
    public partial class Schedule : System.Web.UI.Page
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
            Response.AddHeader("Content-Disposition", "attachment;filename=Schedule.xlsx");
            string filename = Server.MapPath("../Util/Schedule.xlsx");
            Response.TransmitFile(filename);
        }
        public void bind()
        {
            string str_teacher = "周茜";
            string str_mode = select_mode.Value;
            string str_semester = select_semester.Value;
            string str_week = select_week.Value;
            string str = "select * from t_schedule where (status='pass' or status='pending')";
            if (!str_mode.Equals("所有课程"))
            {
                str += "and applicant='" + str_teacher + "'";
                illustration.InnerHtml = "2020-2021学年春季学期" + select_week.Value + "实验安排（周茜）";
            }
            else
            {
                illustration.InnerHtml = "2020-2021学年春季学期" + select_week.Value + "实验安排（实验室所有课程）";
            }
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
            DataRowCollection row = table.Rows;
            string[] week = { "0", "一", "二", "三", "四", "五" };
            for (int i = 1; i <= 5; i++)
            {
                for (int j = 1; j <= 4; j++)
                {
                    string s1 = "周" + week[i];
                    string s2 = "第" + week[j] + "大节";
                    row.Add(s1, s2, "", "", "", "", "", "", "", "", "");
                }

            }
            Hashtable tab = new Hashtable();
            Hashtable list = new Hashtable();
            
            tab.Add("A1", 2); tab.Add("A2", 3); tab.Add("A3", 4);
            tab.Add("B1", 5); tab.Add("B2", 6); tab.Add("B3", 7);
            tab.Add("C1", 8); tab.Add("C2", 9); tab.Add("C3", 10);
            for (int i = 0; i < table_str.Rows.Count; i++)
            {
                int numWeek = int.Parse(table_str.Rows[i][5].ToString());
                int numSec = int.Parse(table_str.Rows[i][6].ToString());
                int numRow = 4 * (numWeek - 1) + (numSec - 1);//[5]周x [6]大节
                String s1 = table_str.Rows[i][7].ToString();
                int numCol = (int)tab[s1];//C2换算
                string strName = table_str.Rows[i][2].ToString();
                string strTea = table_str.Rows[i][9].ToString();
                string strClass = table_str.Rows[i][8].ToString();

                if (table_str.Rows[i][14].ToString().Equals("pass"))
                    table.Rows[numRow][numCol] = strName + "<br/>(" + strTea + " " + strClass + ")";
                else
                {
                    table.Rows[numRow][numCol] = strName + "<br/>(" + strTea + " " + "待审核" + ")";
                    list.Add(numRow, numCol); 
                }
            }

            ds.Tables.Add(table);
            GridView.DataSource = ds;
            GridView.DataBind();
            MergeRows(GridView);
            ICollection key = list.Keys;
            foreach (int k in key)
            {
                int p = int.Parse(k.ToString());
                int q = int.Parse(list[k].ToString());
                GridView.Rows[p].Cells[q].BackColor = Color.FromName("#F0F0F0");
            }

            
            GridView2.DataSource = ds;
            GridView2.DataBind();
            MergeRows(GridView2);
            foreach (int k in key)
            {
                int p = int.Parse(k.ToString());
                int q = int.Parse(list[k].ToString());
                GridView2.Rows[p].Cells[q].BackColor = Color.FromName("#F0F0F0");
            }
        }
        protected void bind_select(object sender, EventArgs e)
        {
            bind();
        }
        protected void bind_select_win(object sender, EventArgs e)
        {
            //win_background1.Style["Display"] = "block";
            //win_background1.Style.Add("display", "block");
            string str_semester = select_semester.Value;
            string str_week = select_week_win.Value;
            string str = "select * from t_schedule where status='pass'";

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
            DataRowCollection row = table.Rows;
            string[] week = { "0", "一", "二", "三", "四", "五" };
            for (int i = 1; i <= 5; i++)
            {
                for (int j = 1; j <= 4; j++)
                {
                    string s1 = "周" + week[i];
                    string s2 = "第" + week[j] + "大节";
                    row.Add(s1, s2, "", "", "", "", "", "", "", "", "");
                }

            }
            Hashtable tab = new Hashtable();
            tab.Add("A1", 2); tab.Add("A2", 3); tab.Add("A3", 4);
            tab.Add("B1", 5); tab.Add("B2", 6); tab.Add("B3", 7);
            tab.Add("C1", 8); tab.Add("C2", 9); tab.Add("C3", 10);
            for (int i = 0; i < table_str.Rows.Count; i++)
            {
                int numWeek = int.Parse(table_str.Rows[i][5].ToString());
                int numSec = int.Parse(table_str.Rows[i][6].ToString());
                int numRow = 4 * (numWeek - 1) + (numSec - 1);//[5]周x [6]大节
                String s1 = table_str.Rows[i][7].ToString();
                int numCol = (int)tab[s1];//C2换算
                string strName = table_str.Rows[i][2].ToString();
                string strTea = table_str.Rows[i][9].ToString();
                string strClass = table_str.Rows[i][8].ToString();
                table.Rows[numRow][numCol] = strName + "<br/>(" + strTea + " " + strClass + ")";

            }
            
            ds.Tables.Add(table);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            MergeRows(GridView2);

            
            
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
        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCellCollection cells = e.Row.Cells;
                for (int i = 2; i <= 10; i++)
                {
                    cells[i].Text = Server.HtmlDecode(cells[i].Text);
                    if (cells[i].Text.Length > 1)
                    {
                        cells[i].Attributes.Add("style", "cursor:pointer");
                        cells[i].Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#ECF5FF'");
                        //当鼠标移开时还原背景色
                        cells[i].Attributes.Add("onmouseout", "this.style.backgroundColor=c");
                        //cells[i].Attributes.Add("OnClick", "display()");
                    }
                }
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
            //GridViewRow winrow = gridView.Rows[16];
            //winrow.Cells[2].BackColor = System.Drawing.Color.FromName("#E7E7E7");
        }
        protected void Submit(object sender, EventArgs e)
        {
            string str = "insert into t_schedule value('10020','G10240201','C语言程序与设计','2021春','8','3','4','B1','软件172','周茜','','" + DateTime.Now.ToString() + "','10217','','pending','','无')";
            Operation.StrExecute(str);
            WebMessageBox.Show("申请提交成功！");
            bind();
        }
    }
}