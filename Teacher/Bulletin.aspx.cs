using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Services.Description;

namespace 实验室排课系统.Teacher
{
    public partial class Bulletin : System.Web.UI.Page
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

            string strCon = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            string str = "insert into t_student  value(9,'289','s','s','130102199903271556','s','s','s','s')";
            MySqlConnection con = new MySqlConnection(strCon);
            MySqlCommand command = new MySqlCommand(str, con);
            con.Open();
            command.ExecuteNonQuery();
            con.Close();
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

            columns.Add("theme", typeof(String));
            columns.Add("author", typeof(String));
            columns.Add("time", typeof(String));
            DataRowCollection row = table.Rows;
            row.Add("系统更新通知", "admin", "2021/04/07 12:43");
            row.Add("审核通过通知", "桐宇", "2021/03/18 16:08");
            row.Add("审核通过通知", "桐宇", "2021/03/14 17:22");

            dss.Tables.Add(table);

            GridView.DataSource = dss;
            GridView.DataBind();


            string str = "select * from t_bulletin where author='周茜'";
            DataSet ds = new DataSet();
            table = new DataTable();
            DataTable table_str = Operation.GetDataTable(str);
            columns = table.Columns;
            columns.Add("theme", typeof(String));
            columns.Add("receiver", typeof(String));
            columns.Add("time", typeof(String));
            row = table.Rows;
            for (int i = 0; i < table_str.Rows.Count; i++)
            {
                string[] grid = new string[3];
                grid[0] = table_str.Rows[i][5].ToString();
                grid[1] = table_str.Rows[i][2].ToString();
                grid[2] = table_str.Rows[i][4].ToString();
                row.Add(grid[0], grid[1], grid[2]);
            }



            ds.Tables.Add(table);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            //con.Close();
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
        protected void Submit(object sender, EventArgs e)
        {
            string str_author = "周茜";
            string str_content = message_content.Value;
            string str_receiver = message_receiver.Value;
            string str_theme = message_theme.Value;
            string str = "insert into t_bulletin value(4,'"+str_author+"','"+str_receiver+"','"+str_content+"','"+ DateTime.Now.ToString()+"','"+str_theme+"')";
            Operation.StrExecute(str);
            WebMessageBox.Show("申请提交成功！");
           
        }
    }
}