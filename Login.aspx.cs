using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace 实验室排课系统
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
            }
        }
        protected void submit_login(object sender, EventArgs e)
        {
            if (this.username.Text.Length < 1)
            {
                WebMessageBox.Show("用户名不能为空"); return;
            }
            if (this.password.Text.Length < 1)
            {
                WebMessageBox.Show("密码不能为空"); return;
            }

            string stustr = "select * from t_student where username='" + this.username.Text + "'and password='" + this.password.Text + "'";
            string teastr = "select * from t_teacher where username='" + this.username.Text + "'and password='" + this.password.Text + "'" + "and limits='teacher'";
            string audstr = "select * from t_teacher where username='" + this.username.Text + "'and password='" + this.password.Text + "'" + "and limits='auditor'";
            string admstr = "select * from t_teacher where username='" + this.username.Text + "'and password='" + this.password.Text + "'" + "and limits='admin'";

            if (Operation.GetDataTable(stustr).Rows.Count>=1)
            {
               Response.Redirect("Student/Course.aspx");
            }
            else if (Operation.GetDataTable(teastr).Rows.Count >= 1)
            {
                Response.Redirect("Teacher/Course.aspx");
            }
            else if (Operation.GetDataTable(audstr).Rows.Count >= 1)
            {
                Response.Redirect("Auditor/Audit.aspx");
            }
            else if (Operation.GetDataTable(admstr).Rows.Count >= 1)
            {
                Response.Redirect("Admin/Course.aspx");
            }
            else
            {
                WebMessageBox.Show("用户或密码错误"); return;
            }
        }
    }
}