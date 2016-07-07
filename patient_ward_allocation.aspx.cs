using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client; // ODP.NET Oracle managed provider
using Oracle.DataAccess.Types;
using System.Data;

public partial class patient_ward_allocation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        TimeZone localZone = TimeZone.CurrentTimeZone;
        DateTime currentDate = DateTime.Now;

        tallocation_date.Text = currentDate.ToString("MMMM dd,yyyy");

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
        if (!IsPostBack)
        {
            BindDropDownList2();
        }
        if (!IsPostBack)
        {
            BindDropDownList3();
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
                    cmd.CommandText = "SELECT patient_id,fname,lname from patient order by patient_id";
                    cmd.Connection = con;
                    con.Open();
                    OracleDataAdapter da = new OracleDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddlpatientid.DataSource = dt;
                    ddlpatientid.DataValueField = "patient_id";
                    ddlpatientid.DataTextField = "patient_id";
                    ddlpatientid.DataBind();
                    con.Close();

                    //Adding "Please select" option in dropdownlist for validation

                    ddlpatientid.Items.Insert(0, new ListItem("Please select", " "));
                }



            }
        }
        catch (Exception eb) { }

    }

    private void BindDropDownList2()
    {
        try
        {
            using (OracleConnection con3 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs"))
            {

                using (OracleCommand cmd3 = new OracleCommand())
                {
                    cmd3.CommandText = "SELECT staff_no,fname,lname,we_position from staff where we_position LIKE '%Nurse%' order by staff_no";
                    cmd3.Connection = con3;
                    con3.Open();
                    OracleDataAdapter da3 = new OracleDataAdapter(cmd3);
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    ddlstaffno.DataSource = dt3;
                    ddlstaffno.DataValueField = "staff_no";
                    ddlstaffno.DataTextField = "staff_no";
                    ddlstaffno.DataBind();
                    con3.Close();

                    //Adding "Please select" option in dropdownlist for validation

                    ddlstaffno.Items.Insert(0, new ListItem("Please select", " "));
                }



            }
        }
        catch (Exception eb) { }

    }

    private void BindDropDownList3()
    {
        try
        {
            using (OracleConnection con7 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs"))
            {

                using (OracleCommand cmd7 = new OracleCommand())
                {
                    cmd7.CommandText = "SELECT bed_no from bed where patient_id IS NULL order by bed_no";
                    cmd7.Connection = con7;
                    con7.Open();
                    OracleDataAdapter da7 = new OracleDataAdapter(cmd7);
                    DataTable dt7 = new DataTable();
                    da7.Fill(dt7);
                    ddlbedno.DataSource = dt7;
                    ddlbedno.DataValueField = "bed_no";
                    ddlbedno.DataTextField = "bed_no";
                    ddlbedno.DataBind();
                    con7.Close();

                    //Adding "Please select" option in dropdownlist for validation

                    ddlbedno.Items.Insert(0, new ListItem("Please select", " "));
                }



            }
        }
        catch (Exception eb) { }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.AddHeader("REFRESH", "0;URL=patient_ward_allocation.aspx");

    }

    protected void DropDownList1_Click(object sender, EventArgs e)
    {
        Response.Write("Hello");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        tallocation_date.Text = Calendar1.SelectedDate.ToString("MMMM dd,yyyy");
        Calendar1.Visible = false;
    }


    protected void myListPatientId_Change(object sender, EventArgs e)
    {

        try
        {
            String patient_id, fname, lname, address, sex, dob, chk_patient_id;
            chk_patient_id = ddlpatientid.Text;

            OracleConnection con1 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con1.Open();
            OracleCommand cmd1 = con1.CreateCommand();
            cmd1.CommandText = "select patient_id,fname,lname,address,sex,dob from PATIENT where patient_id=" + chk_patient_id;
            cmd1.Connection = con1;
            OracleDataReader dr1 = cmd1.ExecuteReader();

            if (dr1.Read())
            {

                patient_id = Convert.ToString(dr1.GetValue(0));
                fname = dr1.GetString(1);
                lname = dr1.GetString(2);
                address = dr1.GetString(3);
                sex = dr1.GetString(4);
                dob = dr1.GetString(5);
                String chk="M";

                if(sex.Trim() == chk.Trim() )
                {
                    sex = "Male";
                }
                else
                {
                    sex = "Female";
                }

                lblpname.Text = fname+" "+lname;
                lbladdress.Text = address;
                lblsex.Text = sex;
              // lblage.Text = dob;

               int age = (int)((DateTime.Now - Convert.ToDateTime(dob)).TotalDays / 365.242199);
               lblage.Text = Convert.ToString(age) +" Years";

               lblpname.ForeColor = System.Drawing.Color.Blue;
               lbladdress.ForeColor = System.Drawing.Color.Blue;
               lblsex.ForeColor = System.Drawing.Color.Blue;
               lblage.ForeColor = System.Drawing.Color.Blue;

            }
            con1.Close();
        }
        catch (Exception ab) { }

    }



    protected void myListstaffno_Change(object sender, EventArgs e)
    {

        try
        {
            String staffno, fname, lname, position, chk_staffno;
            chk_staffno = ddlstaffno.Text;

            OracleConnection con4 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con4.Open();
            OracleCommand cmd4 = con4.CreateCommand();
            cmd4.CommandText = "SELECT staff_no,fname,lname,we_position from staff where staff_no=" + chk_staffno;
            cmd4.Connection = con4;
            OracleDataReader dr4 = cmd4.ExecuteReader();

            if (dr4.Read())
            {

                staffno = Convert.ToString(dr4.GetValue(0));
                fname = dr4.GetString(1);
                lname = dr4.GetString(2);
                position = dr4.GetString(3);
                
                lblsname.Text = ": "+fname + " " + lname;
                lblposition.Text = ": " + position;

                lblsname.ForeColor = System.Drawing.Color.Green;
                lblposition.ForeColor = System.Drawing.Color.Green;
            }
            con4.Close();
        }
        catch (Exception ab) { }

    }


    protected void myListwardno_Change(object sender, EventArgs e)
    {
        try
        {
            String wardno, ward_name, location, tel_extn, no_of_beds, chk_wardno;
            chk_wardno = ddlwardno.Text;


            OracleConnection con5 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con5.Open();
            OracleCommand cmd5 = con5.CreateCommand();
            cmd5.CommandText = "SELECT ward_no,ward_name,location,tel_extn,no_of_beds from ward where ward_no=" + chk_wardno;
            cmd5.Connection = con5;
            OracleDataReader dr5 = cmd5.ExecuteReader();
            int noofbeds;
            if (dr5.Read())
            {

                wardno = Convert.ToString(dr5.GetValue(0));
                ward_name = dr5.GetString(1);
                location = dr5.GetString(2);
                tel_extn = Convert.ToString(dr5.GetValue(3));
                no_of_beds = Convert.ToString(dr5.GetValue(4));
                
                noofbeds = Convert.ToInt32(dr5.GetValue(4));

                lblwardlocation.Text = location;
                lbltelextn.Text = tel_extn;
                lblnoofbeds.Text = no_of_beds;



                OracleConnection con6 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
                con6.Open();

                OracleCommand cmd6 = con6.CreateCommand();
                cmd6.CommandText = "SELECT bed_no from patient_ward_allocation where status=1 and  ward_no=" + chk_wardno+"order by bed_no";
                cmd6.Connection = con6;
                OracleDataReader dr6 = cmd6.ExecuteReader();

                String[] nobedno = new String[500];
                int[] un_bedno = new int[500];

                String bedno;
                int m = 0;
                String temp;

                if (dr6.HasRows)
                {
                    while (dr6.Read())
                    {
                        bedno = dr6.GetValue(0).ToString();
                        temp = bedno;
                        //Response.Write(temp); 
                        nobedno[m++] = temp;
                        //Response.Write(temp);
                        //m++;
                    }


                    for (int j = 0; j < int.Parse(no_of_beds); j++)
                    {
                        Response.Write(nobedno[j] );
                    }

                    Response.Write("<br/><br/>");

                    for (int j = 1; j <= int.Parse(no_of_beds); j++)
                    {
                        un_bedno[j-1] = j;
                        Response.Write(un_bedno[j-1] +" ");
                    }

                    Response.Write("<br/><br/>");
                    // int[] nobed = new int[10];

                    for (int j = 0; j < int.Parse(no_of_beds); j++)
                    {
                        for (int i = 0; i < int.Parse(no_of_beds); i++)
                        {
                            if (int.Parse(nobedno[j]) == un_bedno[i])
                            {
                                un_bedno[i] = 0;
                                Response.Write(un_bedno[i] + ", ");
                                // do nothing;
                            }
                            else
                            {
                                // Response.Write(nobedno[i] +"  "+ j + ", ");
                                //Response.Write(i + ", ");
                            }

                        }
                    }

                }
                for (int k = 0; k < 500; k++)
                {
                    Response.Write(nobedno[k] + " ");
                }


                
            }

            

            con5.Close();
        }
        catch (Exception ab) { }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
/*        OracleConnection con11;

        con11 = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");
        con11.Open();

        String sql11 = "insert into PATIENT values(" + int.Parse(patient_id) + ",'" + fname + "','" + lname + "','" + address + "','" + sex + "'," + double.Parse(tel_no) + ",'" + dob + "' ,'" + marital_status + "','" + reg_date + "','" + nok_fname + "','" + nok_rel + "','" + nok_addr + "','" + nok_telno + "'," + int.Parse(clinic_id) + ")";

       OracleCommand cmd11 = new OracleCommand(sql11, con11);
        int n = cmd11.ExecuteNonQuery();
        if (n == 1)
        {
            Response.Write("<script>alert('Patient Ward Allocation Done Successfully..');</script>");
        }
        con11.Close();

  */  
    }

}


