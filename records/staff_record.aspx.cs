using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oracle.DataAccess.Client;

public partial class records_staff_record : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        OracleConnection con = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");

        con.Open();
        if (!IsPostBack)
        {
            BindDropDownList();
        }
         
    }

    private void BindDropDownList()
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

                    ddlstaffno.Items.Insert(0, new ListItem("Please select", "0"));
                }



            }
        }
        catch (Exception eb) { }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            String pstaffno, pfname, plname, pwe_position, address, sex, dob, telno, nin, qual_type, qual_date, qual_institute, we_position, we_sd, we_fd, we_org, curr_salary, salary_scale, hrsperweek, paid_type, per_temp, joining_date, chk_staff_no;
            chk_staff_no = ddlstaffno.Text;

            OracleConnection con1 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con1.Open();
            OracleCommand cmd1 = con1.CreateCommand();
            cmd1.CommandText = "select staff_no,fname,lname,address,sex,dob,telno,nin,qual_type,qual_date,qual_institute,we_position,we_sd,we_fd,we_org,curr_salary,salary_scale,hrsperweek,paid_type,per_temp,joining_date from STAFF where staff_no=" + chk_staff_no;
            cmd1.Connection = con1;
            OracleDataReader dr1 = cmd1.ExecuteReader();

            if (dr1.Read())
            {

                pstaffno = Convert.ToString(dr1.GetValue(0));
                pfname = dr1.GetString(1);
                plname = dr1.GetString(2);
                address = dr1.GetString(3);
                sex = dr1.GetString(4);
                dob = dr1.GetString(5);
                telno = Convert.ToString(dr1.GetValue(6));
                nin =  dr1.GetString(7);
                qual_type = dr1.GetString(8);
                qual_date = dr1.GetString(9);
                qual_institute = dr1.GetString(10);
                we_position = dr1.GetString(11);
                we_sd = dr1.GetString(12);
                we_fd = dr1.GetString(13);
                we_org = dr1.GetString(14);
                curr_salary = Convert.ToString(dr1.GetValue(15));
                salary_scale = dr1.GetString(16);
                hrsperweek = Convert.ToString(dr1.GetValue(17));
                paid_type = dr1.GetString(18);
                per_temp = dr1.GetString(19);
                joining_date = dr1.GetString(20);

                tfname.Text = pfname;
                tlname.Text = plname;
                taddress.Text = address;
                tsex.Text = sex;
                tdob.Text = dob;
                ttelno.Text = telno;
                tnin.Text = nin;
                tquali_type.Text = qual_type;
                tqual_date.Text = qual_date;
                tqual_institute.Text = qual_institute;
                tposition.Text = we_position;
                tstartdate.Text = we_sd;
                tfinishdate.Text = we_fd;
                torg.Text = we_org;
                tcurr_salary.Text = curr_salary;
                tsalary_scale.Text = salary_scale;
                thrsperweek.Text = hrsperweek;
                tpaid_m_w.Text = paid_type;
                tstatus.Text = per_temp;
                tj_date.Text = joining_date;


            }
        }
        catch (Exception ab) { }
    }
}