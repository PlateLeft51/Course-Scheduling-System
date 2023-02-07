using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 实验室排课系统
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //this.username.Text = "admin";
            //this.password.Text = "admin";
            //this.code.Value = Session["LVNum"].ToString();
            //submit_login(sender,e);


            /*
             string strCon = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
             string sqlstr = "insert into t_student  value(9,'289','s','s','130102199903271556','s','s','s','s')";
             MySqlConnection con = new MySqlConnection(strCon);
             MySqlCommand command = new MySqlCommand(sqlstr, con);
             con.Open();
             command.ExecuteNonQuery();
             con.Close();


             string strCon = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
             string str = "select username,password,name,sex,IDnumber from t_student";
             MySqlConnection con = new MySqlConnection(strCon);
             MySqlDataAdapter adapter = new MySqlDataAdapter(str, con);
             DataSet ds = new DataSet();
             con.Open();
             adapter.Fill(ds, "student");
             */

            //WebMessageBox.Show("用户名不能为空");
            //Session["teachid"] = "052741";
            //Session["teachname"] = "李华";
            //Response.Redirect("Student/Course.aspx");

            /*
     0        number int(11) PK 
      1      cournumber varchar(50)     columns.Add("number",typeof(String));
      2      courname varchar(50)       columns.Add("courname", typeof(String));
       3     semester varchar(50)        columns.Add("week", typeof(String));
        4    week varchar(50)            columns.Add("section", typeof(String));
         5   day varchar(50)             columns.Add("teacher", typeof(String));
      6      section varchar(50)         columns.Add("zone", typeof(String));
       7     domain varchar(50) 
        8    class varchar(50) 
         9   applicant varchar(50) 
     10       applyinfo varchar(50)    1500 100
      11      applydate varchar(50)    1700 85
     12       verinumber varchar(50)     2100 50   
     13       veridate varchar(50)       2400 20
     14       status varchar(50) 
            reply varchar(50) 
            remarks varchar(255) 
             
            string strCon = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            string str = "select username,password,name,sex,IDnumber from t_student";
            MySqlConnection con = new MySqlConnection(strCon);
            MySqlDataAdapter adapter = new MySqlDataAdapter(str, con);
            DataSet ds = new DataSet();
            con.Open();
            adapter.Fill(ds, "student");
            

            DataSet dss = new DataSet();
            DataTable table = new DataTable("course");
            DataColumnCollection columns = table.Columns;
            columns.Add("number",typeof(String));
            columns.Add("courname", typeof(String));
            columns.Add("week", typeof(String));
            columns.Add("section", typeof(String));
            columns.Add("teacher", typeof(String));
            columns.Add("zone", typeof(String));
            DataRowCollection row = table.Rows;
            row.Add("G10249345", "数据结构", "8", "周二第三大节", "张桐", "C2");
            row.Add("G10417952", "算法设计与分析", "9", "周四第四大节", "杨鹏伟", "B1");
            row.Add("G10249345", "数据结构", "9", "周二第三大节", "张桐", "C2");
            row.Add("G10417952", "算法设计与分析", "10", "周四第四大节", "杨鹏伟", "B1");
            row.Add("G10249345", "数据结构", "10", "周二第三大节", "张桐", "C2");
            row.Add("G10274894", "程序综合实验", "12", "周五第三大节", "赵栗鹏", "B3");
            dss.Tables.Add(table);
            
            GridView.DataSource = dss;
            GridView.DataBind();


            row.Add("10004", "C语言程序设计", "周茜", "2021春", "8", "周一第四大节", "计171、计172", "C1、C2", "2021/03/25 16:44", "通过");
            row.Add("10003", "Matlab程序设计", "艾丽思", "2021春", "7", "周五第二大节", "软件181、软件182", "C1、C2", "2021/03/25 16:44", "未通过");
            row.Add("10002", "数据结构", "陈芳华", "2021春", "8", "周四第三大节", "计191、计192", "B1、B2", "2021/03/25 16:44", "通过");
            row.Add("10001", "算法设计与分析", "田安雨", "2021春", "8", "周二第三大节", "软件191、软件192", "C1、C2", "2021/03/25 16:44", "通过");
            row.Add("10000", "计算机网络", "裕通", "2021春", "8", "周五第一大节", "计181、计182", "A1、A2", "2021/03/25 16:44", "通过");
            */
        }
    }
}