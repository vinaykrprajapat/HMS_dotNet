using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Oracle.DataAccess.Client;

public partial class patient_medication : System.Web.UI.Page
{
    String medicationno, medication_date, patient_id, drug_id, disease_type, disease, dosage, method_of_admin, units_per_day;
       
    protected void Page_Load(object sender, EventArgs e)
    {

        TimeZone localZone = TimeZone.CurrentTimeZone;
        DateTime currentDate = DateTime.Now;

         tmedicationdate.Text = currentDate.ToString("MMMM dd,yyyy");

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
                    cmd.CommandText = "SELECT patient_id,fname from patient order by patient_id";
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
        catch { }
    }

    private void BindDropDownList1()
    {
        try
        {
            using (OracleConnection con1 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs"))
            {

                using (OracleCommand cmd1 = new OracleCommand())
                {
                    cmd1.CommandText = "SELECT drug_id,name from DRUG order by drug_id";
                    cmd1.Connection = con1;
                    con1.Open();
                    OracleDataAdapter da = new OracleDataAdapter(cmd1);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    ddldrugid.DataSource = dt;
                    ddldrugid.DataValueField = "drug_id";
                    ddldrugid.DataTextField = "drug_id";
                    ddldrugid.DataBind();
                    con1.Close();

                    //Adding "Please select" option in dropdownlist for validation
                    ddldrugid.Items.Insert(0, new ListItem("Please select", "0"));
                }



            }
        }
        catch { }
    }
    
    protected void Submit_Button_Click(object sender, EventArgs e)
    {
        try
        {

            medicationno = tmedication_no.Text;
            medication_date = tmedicationdate.Text;
            patient_id = ddlpatientid.Text;
            drug_id = ddldrugid.Text;
            dosage = tdosage.Text;
            disease_type = ddldiseasetype.Text;
            disease = tdisease.Text;
            units_per_day = tunits_per_day.Text;
            method_of_admin = tmethod_of_admin.Text;

            OracleConnection con3 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");

            con3.Open();

            String sql3 = "insert into PATIENT_MEDICATION values(" + int.Parse(medicationno) + ",'" + medication_date + "'," + int.Parse(patient_id) + ",'" + disease_type + "','" + disease + "'," + int.Parse(drug_id) + ",'" + dosage + "','" + method_of_admin + "'," + int.Parse(units_per_day) + ")";

            OracleCommand cmd3 = new OracleCommand(sql3, con3);
            int n = cmd3.ExecuteNonQuery();
            if (n == 1)
            {
                Response.Write("<script>alert('Patient Medication Generated Successfully..');</script>");

            }
            con3.Close();
        }
        catch(Exception aa){}
    }
    protected void Add_New_Button_Click(object sender, EventArgs e)
    {
        Response.AddHeader("REFRESH", "0;URL=patient_medication.aspx");

    }
    protected void Get_Patient_Detail_Button_Click(object sender, EventArgs e)
    {
        try
        {
            String patientid, fname, lname, addr, sex,dob,registrationdate, chk_patientid;
            chk_patientid = ddlpatientid.Text;

            OracleConnection con1 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con1.Open();
            OracleCommand cmd1 = con1.CreateCommand();
            cmd1.CommandText = "select patient_id,fname,lname,address,sex,dob,registration_date from PATIENT where patient_id=" + chk_patientid;
            cmd1.Connection = con1;
            OracleDataReader dr1 = cmd1.ExecuteReader();

            if (dr1.Read())
            {

                patientid = Convert.ToString(dr1.GetValue(0));
                fname = dr1.GetString(1);
                lname = dr1.GetString(2);
                addr = dr1.GetString(3);
                sex = dr1.GetString(4);
                dob = dr1.GetString(5);
                registrationdate = dr1.GetString(6);



                info.Text = "Patients Details: <br/><hr/>Name: " + fname + " " + lname + "<br/> Address: " + addr + "<br/> Sex: " + sex + "<br/> Date Of Birth: " + dob + "<br/> Registration Date: " + registrationdate;

            }
        }
        catch (Exception ab) { }
    }

    protected void Get_Drug_Detail_Button_Click(object sender, EventArgs e)
    {
        try
        {
            String drugid, name, desc, stock, expirydate, supplier, chk_drugid;
            chk_drugid = ddldrugid.Text;

            OracleConnection con2 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con2.Open();
            OracleCommand cmd2 = con2.CreateCommand();
            cmd2.CommandText = "select drug_id,name,description,quantity,expiry_date,supplier from DRUG where drug_id=" + chk_drugid;
            cmd2.Connection = con2;
            OracleDataReader dr2 = cmd2.ExecuteReader();

            if (dr2.Read())
            {

                drugid = Convert.ToString(dr2.GetValue(0));
                name = dr2.GetString(1);
                desc = dr2.GetString(2);
                stock = Convert.ToString(dr2.GetValue(3)); ;
                expirydate = dr2.GetString(4);
                supplier = dr2.GetString(5);

                info.Text = "Drug Details: <br/><hr/>Name: " + name + "<br/> Description: " + desc + "<br/> InStock: " + stock + "<br/> Expiry Date: " + expirydate + "<br/> Supplier: " + supplier;

            }
        }
        catch (Exception aa) { }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        tmedicationdate.Text = Calendar1.SelectedDate.ToString("MMMM dd,yyyy");
        Calendar1.Visible = false;
    }
}