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

namespace 实验室排课系统.Student
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
            string filename = Server.MapPath("../Util/Course-student.xlsx");
            Response.TransmitFile(filename);
        }

        public void bind()
        {
            string str_class="计172";
            string str_semester = select_semester.Value;
            string str_week = select_week.Value;
            string str = "select * from t_schedule where class='"+str_class+"' and status='pass'";
            if (!str_semester.Equals("所有学期"))
            {
                string[] s = Regex.Split(str_semester, "学年");
                string[] t = s[0].Split('-');
                if (s[1].Substring(0,1).Equals("春"))
                {
                    str_semester = t[1] + "春";
                }
                else
                {
                    str_semester = t[0] + "秋";
                }
                str += "and semester='"+str_semester+"'";
            }
            if (!str_week.Equals("所有周次"))
            {
                str_week = str_week.Substring(1, str_week.Length - 2);
                
                str += "and week='"+ str_week+"'";
            }
            DataSet ds = new DataSet();
            DataTable table = new DataTable();
            DataTable table_str = Operation.GetDataTable(str);
            DataColumnCollection columns = table.Columns;
            columns.Add("number", typeof(String));
            columns.Add("courname", typeof(String));
            columns.Add("week", typeof(String));
            columns.Add("section", typeof(String));
            columns.Add("teacher", typeof(String));
            columns.Add("zone", typeof(String));
            DataRowCollection row = table.Rows;
            for(int i = 0; i < table_str.Rows.Count; i++)
            {
                string[] grid = new string[6];
                string[] week = { "0","一", "二", "三","四","五" };
                grid[0] = table_str.Rows[i][1].ToString();
                grid[1] = table_str.Rows[i][2].ToString();
                grid[2] = table_str.Rows[i][4].ToString();
                grid[3] = "周" + week[int.Parse(table_str.Rows[i][5].ToString())] + "第" + week[int.Parse(table_str.Rows[i][6].ToString())] + "大节";
                grid[4] = table_str.Rows[i][9].ToString();
                grid[5] = table_str.Rows[i][7].ToString();
                row.Add(grid[0], grid[1], grid[2], grid[3], grid[4], grid[5]);
            }

            ds.Tables.Add(table);
            GridView.DataSource = ds;
            GridView.DataBind();
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
    }
}