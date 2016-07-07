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

        try
        {
            String patient_id, fname, lname, address, sex, tel_no, dob, marital_status, registration_date, nok_fname, nok_relationship, nok_address, nok_tel_no, clinic_id, chk_patient_id;
            

            OracleConnection con1 = new OracleConnection("Data Source=XE;User ID=wmhcs_db;Password=wmhcs");
            con1.Open();
            OracleCommand cmd1 = con1.CreateCommand();
            cmd1.CommandText = "select patient_id,fname,lname,address,sex,tel_no,dob,marital_status,registration_date,nok_fname,nok_relationship,nok_address,nok_tel_no,clinic_id from PATIENT order by patient_id ";
            cmd1.Connection = con1;
            OracleDataReader dr1 = cmd1.ExecuteReader();

            if (dr1.HasRows)
            {
                Response.Write("<div id='header' runat='server' style='text-align:center; color:Aqua; width:100%; height:100px; font-size: xx-large; font-style:italic; font-family: Cambria;'><img src='logo_op2.jpg'/>WMHCS - The Wellmeadows Hospital Case Study</div>");
                Response.Write("<table border='1'><tr style='text-align:center;background-color:Blue; color:white;'><td>Patient Id</td><td>Drug Name</td><td>Description</td><td>In Stock</td><td>Cost per Unit</td><td>Expiry Date</td><td>Supplier</td></tr>");

                while (dr1.Read())
                {

                    patient_id = Convert.ToString(dr1.GetValue(0));
                    fname = dr1.GetString(1);
                    lname = dr1.GetString(2);
                    address = dr1.GetString(3);
                    sex = dr1.GetString(4);
                    tel_no = Convert.ToString(dr1.GetValue(5));
                    dob = dr1.GetString(6);
                    marital_status = dr1.GetString(7);
                    registration_date = dr1.GetString(8);
                    nok_fname = dr1.GetString(9);
                    nok_relationship = dr1.GetString(10);
                    nok_address = dr1.GetString(11);
                    nok_tel_no = dr1.GetString(12);
                    clinic_id = Convert.ToString(dr1.GetValue(13));

                    Response.Write("<tr>");
                    Response.Write("<td>");
                    Response.Write(patient_id);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(fname);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(lname);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(address);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(sex);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(dob);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(tel_no);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(marital_status);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(registration_date);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(nok_fname);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(nok_address);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(nok_relationship);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(nok_tel_no);
                    Response.Write("</td>");

                    Response.Write("<td>");
                    Response.Write(clinic_id);
                    Response.Write("</td>");
                    Response.Write("</tr>");
                    
                }
                Response.Write("</table>");

            }
            con1.Close();
        }
        catch (Exception ab) { }
    
    }

}