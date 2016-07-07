using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client; // ODP.NET Oracle managed provider
using Oracle.DataAccess.Types;

public partial class Default2 : System.Web.UI.Page
{
    String ward_no, ward_name, location, tel_extn, est_by, no_of_beds, est_date,tmp;
    int cnt;
    OracleConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        labelresponse.Text = "";

        ward_name = tward_name.Text;
        tel_extn = ttelextn.Text;
        est_by = testby.Text;
        no_of_beds = tnoofbeds.Text;
        location = loc.SelectedItem.Text;
        est_date = testdate.Text;
        ward_no = tward_no.Text;
        
        con = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");
        con.Open();
        OracleDataReader rd;
        String sql1 = "SELECT count(*) from ward";
        OracleCommand cmd = new OracleCommand(sql1, con);
        rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            tmp = rd.GetValue(0).ToString();

        }
         cnt = int.Parse(tmp) + 1;
       tward_no.Text = cnt.ToString();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.AddHeader("REFRESH", "0;URL=ward_registration.aspx");
    }


    protected void Button2_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            labelresponse.Text = "Your request has been processed. Thank you.";
        }
        else
        {
            labelresponse.Text = "Date is not valid.";
        }

        try
        {


            ward_name = tward_name.Text;
            tel_extn = ttelextn.Text;
            est_by = testby.Text;
            no_of_beds = tnoofbeds.Text;
            location = loc.SelectedItem.Text;
            est_date = testdate.Text;
            ward_no = tward_no.Text;

  
            String sql = "insert into ward values(" + int.Parse(ward_no) + ",'" + ward_name.Trim() + "','" + location.Trim() + "'," +int.Parse(tel_extn)+ "," + int.Parse(no_of_beds) +",'" + est_date + "','" + est_by.Trim() + "')";
          
            OracleCommand cmd = new OracleCommand(sql, con);
            int n = cmd.ExecuteNonQuery();
            if (n == 1)
            {
                Response.Write("<script>alert('Ward Registered Successfully..');</script>");
                
            }
            con.Close();
        }
        catch (Exception eb) { }
    }



    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        testdate.Text = Calendar1.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar1.Visible = false;
    }
}
