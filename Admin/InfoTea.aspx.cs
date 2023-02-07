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
    public partial class InfoTea : System.Web.UI.Page
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
            columns.Add("name", typeof(String));
            columns.Add("username", typeof(String));
            columns.Add("password", typeof(String));
            columns.Add("sex", typeof(String));
            columns.Add("IDnumber", typeof(String));
            columns.Add("title", typeof(String));
            columns.Add("dept", typeof(String));
            columns.Add("faculty", typeof(String));
            columns.Add("remarks", typeof(String));
            DataRowCollection row = table.Rows;
            row.Add("赵栗鹏", "10628", "284759", "男", "130102199003072973", "讲师", "计算机科学与技术", "人工智能与数据科学学院", "无");
            row.Add("杨鹏伟", "10942", "051397", "男", "130108199008261397", "讲师", "计算机科学与技术", "人工智能与数据科学学院", "无");
            row.Add("周茜", "10628", "498506", "女", "130106199007198506", "讲师", "计算机科学与技术", "人工智能与数据科学学院", "无");
            row.Add("陈芳华", "12578", "843516", "女", "130103199004013516", "副教授", "计算机科学与技术", "人工智能与数据科学学院", "无");

            dss.Tables.Add(table);

            GridView.DataSource = dss;
            GridView.DataBind();
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