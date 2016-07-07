using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oracle.DataAccess.Client;

public partial class ward_staff_allocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            OracleConnection con = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            
            con.Open();
            if (!IsPostBack)
            {
                BindDropDownList();
            }
            if (!IsPostBack)
            {
                BindDropDownList1();
            }
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
                    ddlwardno.DataSource = dt;
                    ddlwardno.DataValueField = "ward_no";
                    ddlwardno.DataTextField = "ward_name";
                    ddlwardno.DataBind();
                    con.Close();

                    //Adding "Please select" option in dropdownlist for validation
                    ddlwardno.Items.Insert(0, new ListItem("Please select", " "));
                    }

                

            }
        }
        catch { }
    }


    private void BindDropDownList1()
    {
        try
        {
            using (OracleConnection con = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs"))
            {

                using (OracleCommand cmd = new OracleCommand())
                {
                    cmd.CommandText = "SELECT staff_no,fname from staff order by staff_no";
                    cmd.Connection = con;
                    con.Open();
                    OracleDataAdapter da = new OracleDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddlstaffno.DataSource = dt;
                    ddlstaffno.DataValueField = "staff_no";
                    ddlstaffno.DataTextField = "staff_no";
                    ddlstaffno.DataBind();
                    con.Close();

                    //Adding "Please select" option in dropdownlist for validation
                   
                    ddlstaffno.Items.Insert(0, new ListItem("Please select", " "));
                }



            }
        }
        catch(Exception eb) { }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String week_no, week_beg_date,staff_no,ward_no,shift;
        

        week_no = tweek_no.Text;
        week_beg_date = tweek_beg_date.Text;
        staff_no = ddlstaffno.Text;
        ward_no = ddlwardno.Text;
        shift = tshift.Text;


        OracleConnection con;
        con = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");
        con.Open();

        String sql = "insert into ward_staff_allocation values(" + int.Parse(week_no) + ",'" + week_beg_date.Trim() + "'," + int.Parse(ward_no) + "," + int.Parse(staff_no) + ",'" + shift.Trim() + "')";

        OracleCommand cmd = new OracleCommand(sql, con);
        int n = cmd.ExecuteNonQuery();
        if (n == 1)
        {
            Response.Write("<script>alert('Allocation Done..');</script>");

        }
        con.Close();

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
         Response.AddHeader("REFRESH", "0;URL=ward_staff_allocation.aspx");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            String pstaffno, pfname, plname, pwe_position, pper_temp,paddress,ptelno, chk_staff_no;
            chk_staff_no = ddlstaffno.Text;

            OracleConnection con1 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con1.Open();
            OracleCommand cmd1 = con1.CreateCommand();
            cmd1.CommandText = "select staff_no,fname,lname,we_position,per_temp,address,telno from STAFF where staff_no=" + chk_staff_no;
            cmd1.Connection = con1;
            OracleDataReader dr1 = cmd1.ExecuteReader();

            if (dr1.Read())
            {

                pstaffno = Convert.ToString(dr1.GetValue(0));
                pfname = dr1.GetString(1);
                plname = dr1.GetString(2);
                pwe_position = dr1.GetString(3);
                pper_temp = dr1.GetString(4);
                paddress = dr1.GetString(5);
                ptelno = Convert.ToString(dr1.GetValue(6));

                tfname.Text = "Staff Detail :<br/>Name :" + pfname + " " + plname;
                twe_position.Text = "Position :" + pwe_position;
                tper_temp.Text = "Status :" + pper_temp;
                taddress.Text = "Address :" + paddress;
                ttelno.Text = "Tel No :" + ptelno;
            }
        }
        catch (Exception ab) { }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        tweek_beg_date.Text = Calendar1.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar1.Visible = false;
    }

}