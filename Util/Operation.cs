using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

/// <summary>
/// Operation 网站业务流程类（封装所有业务方法）
/// </summary>
public class Operation
{
    public Operation()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    static public DataTable GetDataTable(string str)
    {
        string strCon = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        MySqlConnection con = new MySqlConnection(strCon);
        MySqlDataAdapter adapter = new MySqlDataAdapter(str, con);
        DataSet ds = new DataSet();
        con.Open();
        adapter.Fill(ds, "t");
        con.Close();
        return ds.Tables[0];
    }
    static public void StrExecute(string sqlstr)
    {
        string strCon = WebConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        MySqlConnection con = new MySqlConnection(strCon);
        MySqlCommand command = new MySqlCommand(sqlstr, con);
        con.Open();
        command.ExecuteNonQuery();
        con.Close();
    }
    static public void runSql(string sql)
    {
        GetDataTable("123");
    }
}
