using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client; // ODP.NET Oracle managed provider
using Oracle.DataAccess.Types;
using System.Data;

public partial class drug : System.Web.UI.Page
{
    String drug_id, name, desc, qty, expiry_date, supplier,cpu, tmp;
    int cnt;
  
    OracleConnection con, con1, con2, con3, con4;

    protected void Page_Load(object sender, EventArgs e)
    {

        // for auto patient Id

        con = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");
        con.Open();
        OracleDataReader rd;
        String sql = "SELECT count(*) from DRUG";
        OracleCommand cmd = new OracleCommand(sql, con);
        rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            tmp = rd.GetValue(0).ToString();

        }
        cnt = int.Parse(tmp) + 1;
        tdrug_id.Text = cnt.ToString();
        con.Close();


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       drug_id= tdrug_id.Text;
       name = tname.Text;
       desc = tdesc.Text;
       qty = tqty.Text;
       cpu = tcpu.Text;
       supplier = tsupplier.Text;
       expiry_date = texpdate.Text;

       con1 = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");
       con1.Open();

       String sql1 = "insert into DRUG values(" + int.Parse(drug_id) + ",'" + name + "','" + desc + "'," + int.Parse(qty) + "," + int.Parse(cpu) + ",'" + expiry_date + "','" + supplier + "')";

       OracleCommand cmd1 = new OracleCommand(sql1, con1);
       int n = cmd1.ExecuteNonQuery();
       if (n == 1)
       {
           Response.Write("<script>alert('Drug Registered Successfully..');</script>");

       }
       con1.Close();

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.AddHeader("REFRESH", "0;URL=drug.aspx");

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        texpdate.Text = Calendar1.SelectedDate.ToString("MMMM dd,yyyy");
        Calendar1.Visible = false;
    }

}