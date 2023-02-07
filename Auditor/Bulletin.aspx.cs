using System;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace 实验室排课系统.Auditor
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
            row.Add("权限更新通知", "admin", "2021/02/26 20:31");

            dss.Tables.Add(table);

            GridView.DataSource = dss;
            GridView.DataBind();


            dss = new DataSet();
            table = new DataTable("course");
            columns = table.Columns;
            columns.Add("theme", typeof(String));
            columns.Add("receiver", typeof(String));
            columns.Add("time", typeof(String));
            row = table.Rows;
            row.Add("审核通过通知", "赵栗鹏", "2021/03/26 16:44");
            row.Add("审核未通过通知", "杨鹏伟", "2021/03/21 18:23");
            row.Add("审核通过通知", "周茜", "2021/03/18 16:08");
            row.Add("审核通过通知", "周茜", "2021/03/18 16:08");
            row.Add("审核通过通知", "陈芳华 ", "2021/03/16 13:28");

            dss.Tables.Add(table);

            GridView1.DataSource = dss;
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
    }
}