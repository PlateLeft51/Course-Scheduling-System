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
    public partial class InfoStu : System.Web.UI.Page
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
            string str_username = input_username.Value;
            string str_name = input_name.Value;
            string str_class = select_class.Value;
            string str_faculty = select_faculty.Value;
            string str = "select * from t_student where username>1";
            
            if (str_username.Length > 0)
            {
                str += " and username='" + str_username + "'";
            }
            if (str_name.Length > 0)
            {
                str += " and name='" + str_name + "'";
            }
            if (!str_class.Equals("所有班级"))
            {
                str += " and class='" + str_class + "'";
            }
            if (!str_faculty.Equals("所有学院"))
            {
                str += " and faculty='" + str_faculty + "'";
            }
            
            DataSet ds = new DataSet();
            DataTable table = new DataTable();
            DataTable table_str = Operation.GetDataTable(str);
            DataColumnCollection columns = table.Columns;
            columns.Add("name", typeof(String));
            columns.Add("username", typeof(String));
            columns.Add("password", typeof(String));
            columns.Add("sex", typeof(String));
            columns.Add("IDnumber", typeof(String));
            columns.Add("class", typeof(String));
            columns.Add("major", typeof(String));
            columns.Add("faculty", typeof(String));
            columns.Add("remarks", typeof(String));
            DataRowCollection row = table.Rows;
            if (table_str.Rows.Count == 0)
            {
                row.Add("", "", "", "", "", "", "", "", "");
            }
            for (int i = 0; i < table_str.Rows.Count; i++)
            {
                string[] grid = new string[9];
                grid[0] = table_str.Rows[i][2].ToString();
                grid[1] = table_str.Rows[i][0].ToString();
                grid[2] = table_str.Rows[i][1].ToString();
                grid[3] = table_str.Rows[i][3].ToString();
                grid[4] = table_str.Rows[i][4].ToString();
                grid[5] = table_str.Rows[i][5].ToString();
                grid[6] = table_str.Rows[i][6].ToString();
                grid[7] = table_str.Rows[i][7].ToString();
                grid[8] = table_str.Rows[i][8].ToString();
                row.Add(grid[0], grid[1], grid[2], grid[3], grid[4], grid[5], grid[6], grid[7], grid[8]);
            }

            ds.Tables.Add(table);
            GridView.DataSource = ds;
            GridView.DataBind();
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
            table = new DataTable("course");
            columns = table.Columns;
            columns.Add("name", typeof(String));
            columns.Add("username", typeof(String));
            columns.Add("password", typeof(String));
            columns.Add("sex", typeof(String));
            columns.Add("IDnumber", typeof(String));
            columns.Add("class", typeof(String));
            columns.Add("major", typeof(String));
            columns.Add("faculty", typeof(String));
            columns.Add("remarks", typeof(String));
            row = table.Rows;
            row.Add("陈明","174906","284759", "男", "130102199903072973", "计172", "计算机科学与技术", "人工智能与数据科学学院", "计172班数据结构课代表");
            row.Add("赵怡然", "174907", "051397", "女", "130108199908261397", "计172", "计算机科学与技术", "人工智能与数据科学学院", "无");
            row.Add("程艺华", "174908", "498506", "女", "130106199907198506", "计172", "计算机科学与技术", "人工智能与数据科学学院", "无");
            row.Add("艾鹏谷", "174909", "843516", "男", "13010319994013516", "计172", "计算机科学与技术", "人工智能与数据科学学院", "无");

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
        protected void bind_select(object sender, EventArgs e)
        {
            bind();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            bind();
        }
        protected void Submit(object sender, EventArgs e)
        {
            string str_username =create_username.Value;
            string str_password = create_password.Value;
            string str_name = create_name.Value;
            string str_sex = create_sex.Value;
            string str_IDnumber = create_IDnumber.Value;
            string str_class = create_class.Value;
            string str_major = create_major.Value;
            string str_faculty = create_faculty.Value;
            string str_remarks = create_remarks.Value;
            if (str_username.Length == 0) WebMessageBox.Show("学号不能为空");
            if (str_password.Length == 0) WebMessageBox.Show("密码不能为空");
            if (str_name.Length == 0) WebMessageBox.Show("姓名不能为空");
            if (str_IDnumber.Length == 0) WebMessageBox.Show("身份证号不能为空");
            if (str_remarks.Length == 0) str_remarks = "无";
            string str = "insert into t_student value("+str_username+", '"+str_password+"', '"+str_name+"', '"+str_sex+"', '"+str_IDnumber+"', '"
                                                       +str_class+"', '"+str_major+"', '"+str_faculty+"', '"+str_remarks+"')";
            Operation.StrExecute(str);
            WebMessageBox.Show("用户创建成功！");
            bind();
        }
        protected void UpdateInfo(object sender, EventArgs e)
        {
            
            string str_username = info_username.Value;
            string str_password = info_password.Value;
            string str_name = info_name.Value;
            string str_sex = info_sex.Value;
            string str_IDnumber = info_IDnumber.Value;
            string str_class = info_class.Value;
            string str_major = info_major.Value;
            string str_faculty = info_faculty.Value;
            string str_remarks = info_remarks.Value;
            if (str_username.Length == 0) WebMessageBox.Show("学号不能为空");
            if (str_password.Length == 0) WebMessageBox.Show("密码不能为空");
            if (str_name.Length == 0) WebMessageBox.Show("姓名不能为空");
            if (str_IDnumber.Length == 0) WebMessageBox.Show("身份证号不能为空");
            if (str_remarks.Length == 0) str_remarks = "无";

            string str="update t_student set password='"+str_password+"', name='"+str_name+"',sex='"+str_sex+"',IDnumber='"+str_IDnumber+"',class='"+str_class+"',major='"
                                                        +str_major+"',faculty='"+str_faculty+"',remarks='"+str_remarks+"' where username="+str_username;
            //string str = "insert into t_student value(" + str_username + ", '" + str_password + "', '" + str_name + "', '" + str_sex + "', '" + str_IDnumber + "', '"
                                                     //  + str_class + "', '" + str_major + "', '" + str_faculty + "', '" + str_remarks + "')";
            Operation.StrExecute(str);
            WebMessageBox.Show("信息更新成功！");
            bind();
        }
    }
}