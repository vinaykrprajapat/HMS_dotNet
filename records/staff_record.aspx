<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="staff_record.aspx.cs" Inherits="records_staff_record" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style1
        {
            margin-left:10px;
            margin-right:20px;
            width: 100%;
            border-style: double;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table class="style1">
        <tr>
         
            <td style=" width:35%; ">
           <b><u>New Staff Registration Form :</u></b> <br /><br />
                
                <asp:Label ID="Label1" runat="server" Text="Staff Number"></asp:Label>
                <asp:DropDownList ID="ddlstaffno" runat="server">
           </asp:DropDownList>
           <asp:Button ID="Button1" runat="server" Text="Get Staff Details" 
                   onclick="Button1_Click" />
           <br/><br/>
            <b>Personal Details :</b><hr/>
           <table>
          <tr>
          <td><asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label></td>
          <td>: <asp:Label ID="tfname" runat="server" ForeColor="#000099"></asp:Label></td>
          </tr>
          
          <tr>
          <td><asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label></td>
          <td>: <asp:Label ID="tlname" runat="server" ForeColor="#000099"></asp:Label></td>
          </tr>
          
          <tr>
          <td><asp:Label ID="Label4" runat="server" Text="Address"></asp:Label></td>
          <td>: <asp:Label ID="taddress" runat="server" ForeColor="#000099"></asp:Label></td>
          </tr>
          
          <tr>
          <td><asp:Label ID="Label5" runat="server" Text="Sex"></asp:Label></td>
         <td>: <asp:Label ID="tsex" runat="server" ForeColor="#000099"></asp:Label>
         </td></tr>
        
        <tr>
        <td><asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label></td>
        <td>: <asp:Label ID="tdob" runat="server" ForeColor="#000099" ></asp:Label></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label7" runat="server" Text="Tel Number"></asp:Label></td>
        <td>: <asp:Label ID="ttelno" runat="server" MaxLength="10" ForeColor="#000099"></asp:Label></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label8" runat="server" Text="NIN"></asp:Label></td>
        <td>: <asp:Label ID="tnin" runat="server" ForeColor="#000099"></asp:Label></td>
        </tr>

        <tr>
        <td></td>
        <td><hr/></td>
        </tr>

        <tr>
        <td><b>Qualification Details :</b><hr/></td>
        <td></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label9" runat="server" Text="Qualification Type"></asp:Label></td>
        <td>: <asp:Label ID="tquali_type" runat="server" ForeColor="#000099" ></asp:Label></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label10" runat="server" Text="Qualification Date"></asp:Label></td>
        <td>: <asp:Label ID="tqual_date" runat="server" ForeColor="#000099"></asp:Label></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label11" runat="server" Text="Qualification Institute"></asp:Label></td>
        <td>: <asp:Label ID="tqual_institute" runat="server" ForeColor="#000099"></asp:Label><hr/></td>
        </tr>

        </table>
            
</td>
<td style=" width:35%; ">
        <b>Work Experiance :</b><br/><hr/>
        
        <table>
        <tr>
        <td><asp:Label ID="Label12" runat="server" Text="Position"></asp:Label></td>
        <td>: <asp:Label ID="tposition" runat="server" ForeColor="#000099"></asp:Label></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label13" runat="server" Text="Start Date"></asp:Label></td>
        <td>: <asp:Label ID="tstartdate" runat="server" ForeColor="#000099"></asp:Label></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label14" runat="server" Text="Finish Date"></asp:Label></td>
        <td>: <asp:Label ID="tfinishdate" runat="server" ForeColor="#000099"></asp:Label>
        </td>
        </tr>

        <tr>
        <td><asp:Label ID="Label15" runat="server" Text="Organization"></asp:Label></td>
        <td>: <asp:Label ID="torg" runat="server" ForeColor="#000099"></asp:Label></td>
        </tr>
        
        <tr>
        <td></td>
        <td><hr/></td>
        </tr>

        <tr>
        <td><b>Current Details :</b><hr/></td>
        <td></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label16" runat="server" Text="Current Salary"></asp:Label></td>
        <td>: <asp:Label ID="tcurr_salary" runat="server" ForeColor="#000099"></asp:Label></td>
         </tr>

        <tr>
        <td><asp:Label ID="Label17" runat="server" Text="Salary Scale"></asp:Label></td>
        <td>: <asp:Label ID="tsalary_scale" runat="server" ForeColor="#000099"></asp:Label></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label18" runat="server" Text="Hours/Week"></asp:Label></td>
        <td>: <asp:Label ID="thrsperweek" runat="server" ForeColor="#000099"></asp:Label></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label19" runat="server" Text="Paid Weekly or Monthly"></asp:Label></td>
        <td>: <asp:Label ID="tpaid_m_w" runat="server" ForeColor="#000099"></asp:Label>
        </td>
        </tr>

        <tr>
        <td><asp:Label ID="Label20" runat="server" Text="Job Status"></asp:Label></td>
        <td>: <asp:Label ID="tstatus" runat="server" ForeColor="#000099"></asp:Label>
        </td>
        </tr>

        <tr>
        <td><asp:Label ID="Label21" runat="server" Text="Joining Date"></asp:Label></td>
        <td>: <asp:Label ID="tj_date" runat="server" ForeColor="#000099"></asp:Label></td>
        </tr>

        <tr>
        <td></td>
        <td><hr/></td>
        </tr>
        

        </table>
           
</td>
</tr>
</table>      
        

</asp:Content>

