using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client; // ODP.NET Oracle managed provider
using Oracle.DataAccess.Types;
using System.Data;

public partial class patient_registration : System.Web.UI.Page
{
    String patient_id, fname,lname, address, tel_no, sex, dob, marital_status,reg_date,nok_fname,nok_rel,nok_addr,nok_telno,clinic_id,chk_clinic_id, doctor_name, clinic_addr, doctor_telno, tmp;
    int cnt;
    OracleConnection con,con1,con2,con3,con4;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        patient_id = tpatient_id.Text;
        fname = tfname.Text;
        lname = tlname.Text;
        address = taddress.Text;
        tel_no = ttelno.Text;
        sex = ddlsex.Text;
        dob = tdob.Text;
        marital_status = ddlms.Text;
        reg_date = treg_date.Text;
        
        nok_fname = tnok_fullname.Text;
        nok_rel = tnok_rel.Text;
        nok_addr = tnok_addr.Text;
        nok_telno = tnok_telno.Text;


        TimeZone localZone = TimeZone.CurrentTimeZone;
        DateTime currentDate = DateTime.Now;
        
        treg_date.Text = currentDate.ToString("MMMM dd,yyyy");

        // for auto patient Id

        con = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");
        con.Open();
        OracleDataReader rd;
        String sql = "SELECT count(*) from PATIENT";
        OracleCommand cmd = new OracleCommand(sql, con);
        rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            tmp = rd.GetValue(0).ToString();

        }
        cnt = int.Parse(tmp) + 1;
        tpatient_id.Text = cnt.ToString();
        con.Close();
        
        //for clinic Id 
        con1 = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");   
            con1.Open();
            if (!IsPostBack)
            {
                BindDropDownList();
            }

    }

    //bind subject names to dropdownlist
    private void BindDropDownList()
    {
        try
        {
            using (OracleConnection con2 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs"))
            {
                
                using (OracleCommand cmd2 = new OracleCommand())
                {
                    cmd2.CommandText = "SELECT clinic_id from local_doctor order by clinic_id";
                    cmd2.Connection = con2;
                    con2.Open();
                    OracleDataAdapter da = new OracleDataAdapter(cmd2);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddlclinicid.DataSource = dt;
                    ddlclinicid.DataValueField = "clinic_id";
                    ddlclinicid.DataTextField = "clinic_id";
                    ddlclinicid.DataBind();
                    con2.Close();

                    //Adding "Please select" option in dropdownlist for validation
                    ddlclinicid.Items.Insert(0, new ListItem("Please select", " "));
                    }

                

            }
        }
        catch { }
    }


    
    protected void Button1_Click(object sender, EventArgs e)
    {
        patient_id = tpatient_id.Text;
        fname = tfname.Text;
        
        lname = tlname.Text;
        
        address = taddress.Text;
        
        tel_no = ttelno.Text;
        sex = ddlsex.Text;
        dob = tdob.Text;
        marital_status = ddlms.Text;
        reg_date = treg_date.Text;
        nok_fname = tnok_fullname.Text;
        nok_rel = tnok_rel.Text;
        nok_addr = tnok_addr.Text;
        nok_telno = tnok_telno.Text;
        clinic_id = ddlclinicid.Text;

        con3 = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");
        con3.Open();

        String sql3 = "insert into PATIENT values(" + int.Parse(patient_id) + ",'" + fname.ToLower() + "','" + lname.ToLower() + "','" + address + "','" + sex + "'," + double.Parse(tel_no) + ",'" + dob + "' ,'" + marital_status + "','" + reg_date + "','" + nok_fname + "','" + nok_rel + "','" + nok_addr + "','" + nok_telno + "'," + int.Parse(clinic_id) + ")";

        OracleCommand cmd3 = new OracleCommand(sql3, con3);
        int n = cmd3.ExecuteNonQuery();
        if (n == 1)
        {
            Response.Write("<script>alert('Patient Registered Successfully..');</script>");

        }
        con3.Close();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
                    try
        {
            chk_clinic_id =  ddlclinicid.Text;

            OracleConnection con4 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con4.Open();
            OracleCommand cmd4 = con4.CreateCommand();
            cmd4.CommandText = "select clinic_id,doctor_name,address,telno from LOCAL_DOCTOR where clinic_id=" + chk_clinic_id;
            cmd4.Connection = con4;
            OracleDataReader dr4 = cmd4.ExecuteReader();


            if (dr4.Read())
            {

                clinic_id = Convert.ToString(dr4.GetValue(0));
                doctor_name = dr4.GetString(1);
                clinic_addr = dr4.GetString(2);
                doctor_telno = dr4.GetString(3);
                
                lbldoctor_name.Text = "Name  :" + doctor_name ;
                lblclinic_address.Text="Clinic Address :" + clinic_addr ;
                lbltel_no.Text=" Tel No :" + doctor_telno ;
                
            }
            con4.Close();

        }
        catch (Exception ab) { }
                    
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.AddHeader("REFRESH", "0;URL=patient_registration.aspx");
        
    }
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        tdob.Text = Calendar1.SelectedDate.ToString("MMMM dd,yyyy");
        Calendar1.Visible = false;
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Calendar2.Visible = true;
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        treg_date.Text = Calendar2.SelectedDate.ToString("MMMM dd,yyyy");
        Calendar2.Visible = false;
    }

}