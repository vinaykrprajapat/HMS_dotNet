using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client; // ODP.NET Oracle managed provider
using Oracle.DataAccess.Types;

public partial class staff_new : System.Web.UI.Page
{
    String staff_no, fname, lname, addr, sex, dob, telno, nin, qual_type, qual_date, qual_institute, we_position, we_sd, we_fd, org, joining_date, curr_salary, sal_scale, hrsperweek, paid_w_m, status_type, tmp;
    int cnt;
    
    OracleConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        staff_no = tstaff_no.Text;
        fname = tfname.Text;
        lname = tlname.Text;
        addr = taddress.Text;
        sex = tsex.Text;
        dob = tdob.Text;
        telno = ttelno.Text;
        nin = tnin.Text;
        qual_type = tquali_type.Text;
        qual_date = tqual_date.Text;
        qual_institute = tqual_institute.Text;
        we_position = tposition.Text;
        we_sd = tstartdate.Text;
        we_fd = tfinishdate.Text;
        org = torg.Text;
        joining_date = tj_date.Text;
        curr_salary = tcurr_salary.Text;
        sal_scale = tsalary_scale.Text;
        hrsperweek = thrsperweek.Text;
        paid_w_m = tpaid_m_w.Text;
        status_type = tstatus.Text;

        con = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");
        con.Open();
        OracleDataReader rd;
        String sql1 = "SELECT count(*) from staff";
        OracleCommand cmd = new OracleCommand(sql1, con);
        rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            tmp = rd.GetValue(0).ToString();

        }
        cnt = int.Parse(tmp) + 1;
        tstaff_no.Text = cnt.ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        staff_no = tstaff_no.Text;
        fname = tfname.Text;
        lname = tlname.Text;
        addr = taddress.Text;
        sex = tsex.Text;
        dob = tdob.Text;
        telno = ttelno.Text;
        nin = tnin.Text;
        qual_type = tquali_type.Text;
        qual_date = tqual_date.Text;
        qual_institute = tqual_institute.Text;
        we_position = tposition.Text;
        we_sd = tstartdate.Text;
        we_fd = tfinishdate.Text;
        org = torg.Text;
        joining_date = tj_date.Text;
        curr_salary = tcurr_salary.Text;
        sal_scale = tsalary_scale.Text;
        hrsperweek = thrsperweek.Text;
        paid_w_m = tpaid_m_w.Text;
        status_type = tstatus.Text;


        String sql = "insert into staff values(" + int.Parse(staff_no) + ",'" + fname.Trim() + "','" + lname.Trim() + "','" + addr.Trim() + "','" + sex.Trim() + "','" + dob.Trim() + "'," + double.Parse(telno)  + ",'" + nin.Trim() + "','" + qual_type.Trim() + "','" + qual_date.Trim() + "','" + qual_institute.Trim() + "','" + we_position.Trim() + "','" + we_sd.Trim() + "','" + we_fd.Trim() + "','" + org.Trim() + "','" + curr_salary.Trim() + "','" + sal_scale.Trim() + "'," + int.Parse(hrsperweek) + ",'" + paid_w_m.Trim() + "','" + status_type.Trim() + "','" + joining_date.Trim() + "')";
          
            OracleCommand cmd = new OracleCommand(sql, con);
            int n = cmd.ExecuteNonQuery();
            if (n == 1)
            {
                Response.Write("<script>alert('Staff Details Inserted..');</script>");
                
            }
            con.Close();
    
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.AddHeader("REFRESH", "0;URL=staff_new.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        tdob.Text = Calendar1.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar1.Visible = false;
    }


    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Calendar2.Visible = true;
    }
    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        tqual_date.Text = Calendar2.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar2.Visible = false;
    }


    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Calendar3.Visible = true;
    }
    protected void Calendar3_SelectionChanged(object sender, EventArgs e)
    {
        tstartdate.Text = Calendar3.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar3.Visible = false;
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Calendar4.Visible = true;
    }
    protected void Calendar4_SelectionChanged(object sender, EventArgs e)
    {
        tfinishdate.Text = Calendar4.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar4.Visible = false;
    }


    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Calendar5.Visible = true;
    }
    protected void Calendar5_SelectionChanged(object sender, EventArgs e)
    {
        tj_date.Text = Calendar5.SelectedDate.ToString("MMMM dd, yyyy");
        Calendar5.Visible = false;
    }


}