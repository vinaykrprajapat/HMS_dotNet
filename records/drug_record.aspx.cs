using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client; // ODP.NET Oracle managed provider
using Oracle.DataAccess.Types;
using System.Data;

public partial class records_drug_record : System.Web.UI.Page
{
    String drug_id, name, desc, qty, expiry_date, supplier, cpu, tmp;
    int cnt;

    OracleConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
           con = new OracleConnection("User ID=WMHCS_db;Password=wmhcs;Data Source=XE");
           con.Open();
           OracleDataReader rd;
           String sql = "SELECT drug_id,name,description,quantity,cost_per_unit,expiry_date,supplier from DRUG order by drug_id";
           OracleCommand cmd = new OracleCommand(sql, con);
           rd = cmd.ExecuteReader();
           if (rd.HasRows)
           {
               Response.Write("<div id='header' runat='server' style='text-align:center; color:Aqua; width:100%; height:100px; font-size: xx-large; font-style:italic; font-family: Cambria;'><img src='logo_op2.jpg'/>WMHCS - The Wellmeadows Hospital Case Study</div>");
               Response.Write("<table border='1'><tr style='text-align:center;background-color:Blue; color:white;'><td>Drug Id</td><td>Drug Name</td><td>Description</td><td>In Stock</td><td>Cost per Unit</td><td>Expiry Date</td><td>Supplier</td></tr>");

               while (rd.Read())
               {
                   drug_id = rd.GetValue(0).ToString();
                   name = rd.GetValue(1).ToString();
                   desc = rd.GetValue(2).ToString();
                   qty = rd.GetValue(3).ToString();
                   cpu = rd.GetValue(4).ToString();
                   expiry_date = rd.GetValue(5).ToString();
                   supplier = rd.GetValue(6).ToString();



                   Response.Write("<td>");
                   Response.Write(drug_id);
                   Response.Write("</td>");
                   Response.Write("<td>");

                   Response.Write(name);
                   Response.Write("</td>");
                   Response.Write("<td>");

                   Response.Write(desc);
                   Response.Write("</td>");
                   Response.Write("<td>");

                   Response.Write(qty);
                   Response.Write("</td>");
                   Response.Write("<td>");

                   Response.Write(cpu);
                   Response.Write("</td>");
                   Response.Write("<td>");

                   Response.Write(expiry_date);
                   Response.Write("</td>");
                   Response.Write("<td>");

                   Response.Write(supplier);
                   Response.Write("</td>");
                   Response.Write("</tr>");


               }
               Response.Write("</table>");


           }
           con.Close();
          
    }
}