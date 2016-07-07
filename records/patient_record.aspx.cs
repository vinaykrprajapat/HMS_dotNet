using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client; // ODP.NET Oracle managed provider
using Oracle.DataAccess.Types;
using System.Data;

public partial class records_patient_record : System.Web.UI.Page
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

                    ddlpatientid.Items.Insert(0, new ListItem("Please select", "0"));
                }



            }
        }
        catch (Exception eb) { }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            String patient_id,fname,lname,address,sex,tel_no,dob,marital_status,registration_date,nok_fname,nok_relationship,nok_address,nok_tel_no,clinic_id,chk_patient_id;
            chk_patient_id = ddlpatientid.Text;

            OracleConnection con1 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con1.Open();
            OracleCommand cmd1 = con1.CreateCommand();
            cmd1.CommandText = "select patient_id,fname,lname,address,sex,tel_no,dob,marital_status,registration_date,nok_fname,nok_relationship,nok_address,nok_tel_no,clinic_id from PATIENT where patient_id=" + chk_patient_id +" OR fname = '" + searchname.Text + "'";
            cmd1.Connection = con1;
            OracleDataReader dr1 = cmd1.ExecuteReader();

            if (dr1.Read())
            {

                patient_id = Convert.ToString(dr1.GetValue(0));
                fname = dr1.GetString(1);
                lname = dr1.GetString(2);
                address = dr1.GetString(3);
                sex = dr1.GetString(4);
                tel_no = Convert.ToString(dr1.GetValue(5));
                dob = dr1.GetString(6);
                marital_status =  dr1.GetString(7);
                registration_date = dr1.GetString(8);
                nok_fname = dr1.GetString(9);
                nok_relationship = dr1.GetString(10);
                nok_address = dr1.GetString(11);
                nok_tel_no = dr1.GetString(12);
                clinic_id = Convert.ToString(dr1.GetValue(13));
                
                tfname.Text = fname;
                tlname.Text = lname;
                taddress.Text = address;
                tsex.Text = sex;
                tdob.Text = dob;
                ttelno.Text = tel_no;
                tms.Text=marital_status;
                treg_date.Text=registration_date;
                tnok_fullname.Text=nok_fname;
                tnok_addr.Text=nok_address;
                tnok_rel.Text=nok_relationship;
                tnok_telno.Text=nok_tel_no;
                tclinicid.Text = clinic_id;

            }
            con1.Close();
        }
        catch (Exception ab) { }
       
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            String clinic_id, doc_name, address, tel_no, chk_clinic_id;
            chk_clinic_id = tclinicid.Text;

            OracleConnection con2 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con2.Open();
            OracleCommand cmd2 = con2.CreateCommand();
            cmd2.CommandText = "select clinic_id,doctor_name,address,telno from LOCAL_DOCTOR where clinic_id=" + chk_clinic_id;
            cmd2.Connection = con2;
            OracleDataReader dr2 = cmd2.ExecuteReader();

            if (dr2.Read())
            {

                clinic_id = Convert.ToString(dr2.GetValue(0));
                doc_name = dr2.GetString(1);
                address = dr2.GetString(2);
                tel_no = dr2.GetString(3);

                lbldoctor_name.Text = doc_name;
                lblclinic_address.Text = address;
                lbltel_no.Text = tel_no;
                
            }
            con2.Close();
        }
        catch (Exception ab) { }
    }
    

}