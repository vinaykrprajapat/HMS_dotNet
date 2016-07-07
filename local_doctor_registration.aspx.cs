using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client; // ODP.NET Oracle managed provider
using Oracle.DataAccess.Types;
using System.Data;

public partial class local_doctor_registration : System.Web.UI.Page
{
    OracleConnection con;
 
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.AddHeader("REFRESH", "0;URL=local_doctor_registration.aspx");

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        String clinic_id, doctor_name, addr, tel_no;
       
            clinic_id = tcid.Text;
            doctor_name = tdoc_name.Text;
            addr = tcaddress.Text;
            tel_no = ttelno.Text;

            con = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");
            con.Open();


            //Response.Write(""+clinic_id+doctor_name+addr+tel_no);

            String sql = "insert into LOCAL_DOCTOR values(" + int.Parse(clinic_id) + ",'" + doctor_name + "','" + addr + "','" + tel_no + "')";

            OracleCommand cmd = new OracleCommand(sql, con);
            int n = cmd.ExecuteNonQuery();
            if (n == 1)
            {
                Response.Write("<script>alert('Clinic Information Inserted Successfully..');</script>");

            }
            con.Close();

       

    }
}