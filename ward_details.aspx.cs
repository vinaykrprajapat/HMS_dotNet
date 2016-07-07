using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oracle.DataAccess.Client;

public partial class ward_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        OracleConnection con1 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");

        con1.Open();
        if (!IsPostBack)
        {
            BindDropDownList();
        }
        info.Text = "";
    }

    //bind subject names to dropdownlist
    private void BindDropDownList()
    {
        try
        {
            using (OracleConnection con = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs"))
            {

                using (OracleCommand cmd = new OracleCommand())
                {
                    cmd.CommandText = "SELECT ward_no,ward_name from ward order by ward_no";
                    cmd.Connection = con;
                    con.Open();
                    OracleDataAdapter da = new OracleDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    sward_no.DataSource = dt;
                    sward_no.DataValueField = "ward_no";
                    sward_no.DataTextField = "ward_no";
                    sward_no.DataBind();
                    con.Close();

                    //Adding "Please select" option in dropdownlist for validation
                    sward_no.Items.Insert(0, new ListItem("Please select", " "));
                }
            }
        }
        catch { }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
            OracleConnection con = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con.Open();
            OracleCommand cmd = con.CreateCommand();            
            cmd.CommandText = "select ward_no,ward_name,location,tel_extn,no_of_beds,est_date,est_by from WARD where ward_no =" + sward_no.Text;
            cmd.Connection = con;
            

            OracleDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                tward_name.Text = dr.GetString(1);
                tlocation.Text = dr.GetString(2);
                testdate.Text = dr.GetString(5);
                testby.Text = dr.GetString(6);


                ttelextn.Text = Convert.ToString(dr.GetValue(3));
                tnoofbeds.Text = Convert.ToString(dr.GetValue(4));
                
            }






        /*    OracleConnection con1 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con1.Open();
            OracleCommand cmd1 = con1.CreateCommand();
            cmd1.CommandText = "select WARD_STAFF_ALLOCATION.staff_no from  WARD_STAFF_ALLOCATION where  WARD_STAFF_ALLOCATION.ward_no = " + sward_no.Text + "AND week_no = " + week_no.Text;
            cmd1.Connection = con1;
 
        
        OracleDataReader dr1 = cmd1.ExecuteReader();
            //if (dr1.Read())
            //{
        
                string[] arr = new string[10];
                int i=0;
               while(dr1.Read())
               {
                   arr[i] = Convert.ToString(dr1.GetValue(0));
                   i++;
                    //staff_no.Text = Convert.ToString(dr1.GetValue(0));
                   Response.Write(" " + Convert.ToString(dr1.GetValue(0)));
                }
        */  
            try
            {
                using (OracleConnection con1 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs"))
                {

                    using (OracleCommand cmd1 = new OracleCommand())
                    {
                        cmd1.CommandText = "select WARD_STAFF_ALLOCATION.staff_no from  WARD_STAFF_ALLOCATION where  WARD_STAFF_ALLOCATION.ward_no = " + sward_no.Text + "AND week_no = " + week_no.Text + "order by staff_no";
                        cmd1.Connection = con1;
                        con1.Open();
                        OracleDataAdapter da = new OracleDataAdapter(cmd1);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        ddlstaff_no.DataSource = dt;
                        ddlstaff_no.DataValueField = "staff_no";
                        ddlstaff_no.DataTextField = "staff_no";
                        ddlstaff_no.DataBind();
                        con1.Close();

                        //Adding "Please select" option in dropdownlist for validation
                        ddlstaff_no.Items.Insert(0, new ListItem("Staff Allocated List", "0"));
                    }



                }
            }
            catch { }
    }

    protected void Get_Staff_Details_Click(object sender, EventArgs e)
    {
            try
        {
            String pstaffno, pfname, plname, pwe_position, pper_temp,paddress,ptelno, chk_staff_no;
            chk_staff_no = ddlstaff_no.Text;

            OracleConnection con2 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con2.Open();
            OracleCommand cmd2 = con2.CreateCommand();
            cmd2.CommandText = "select staff_no,fname,lname,we_position,per_temp,address,telno from STAFF where staff_no=" + chk_staff_no;
            cmd2.Connection = con2;
            OracleDataReader dr2 = cmd2.ExecuteReader();

            if (dr2.Read())
            {

                pstaffno = Convert.ToString(dr2.GetValue(0));
                pfname = dr2.GetString(1);
                plname = dr2.GetString(2);
                pwe_position = dr2.GetString(3);
                pper_temp = dr2.GetString(4);
                paddress = dr2.GetString(5);
                ptelno = Convert.ToString(dr2.GetValue(6));


                info.Text = "<table><tr><td>Name: </td><td>" + pfname + " " + plname + "</td></tr><tr><td> Position: </td><td>" + pwe_position + "</td></tr><tr><td> Status:</td><td> " + pper_temp + "</td></tr><tr><td> Address:</td><td> " + paddress + "</td></tr><tr><td> Tel No:</td><td> " + ptelno + "</td></tr></table> ";
                
            }
        }
        catch (Exception ab) { }
    }

    
}
