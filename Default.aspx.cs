using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oracle.DataAccess.Client;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblerror.Text = " ";
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
    }
    
    protected void Login_Click(object sender, EventArgs e)
    {
        String uid, pass, puid, ppass;

        OracleConnection con = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
        con.Open();
        OracleCommand cmd = con.CreateCommand();
        cmd.CommandText = "select userid, password from LOGIN";
        cmd.Connection = con;

        OracleDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            pass = dr.GetString(1);
            uid = Convert.ToString(dr.GetValue(0));

            puid = tuid.Text;
            ppass = tpass.Text;

            if (puid == uid && ppass == pass)
            {
                lblerror.Text = " You are Successfully Login!! ";
                lblerror.ForeColor = System.Drawing.Color.Green;
                Response.AddHeader("REFRESH", "1;URL=welcome.aspx");
            }
            else if (puid == uid && ppass != pass)
            {
                lblerror.Text = " Password Error !! ";
            }
        }
    }
}