<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="staff_new.aspx.cs" Inherits="staff_new" %>

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
<table class="style1" style=" width:100%; ">
<tr>

   <td style=" width:15%; ">
             <a href="welcome.aspx">WMHCS - Menu</a>
              <ul>
              <li><a href="ward_registration.aspx">Ward Registraion</a></li>
              <li><a href="ward_staff_allocation.aspx">Ward Staff Allocation</li>
              <li><a href="staff_new.aspx">Staff Registration</li>
              <li><a href="patient_registration.aspx">Patient Registraion</a></li>
              <li><a href="drug.aspx">Drugs Registration</li>
              </ul>
           </td>


<td style=" width:40%; ">
           <b><u>New Staff Registration Form :</u></b> <br /><br />
                
           <asp:Label ID="Label1" runat="server" Text="Staff Number"></asp:Label>
           <asp:TextBox ID="tstaff_no" runat="server" ReadOnly="True"></asp:TextBox><br/>
           <br/>
           <b>Personal Details :</b><br/><hr/>
           
           <table>
           <tr>
           <td><asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label></td>
           <td> <asp:TextBox ID="tfname" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tfname" runat="server" ErrorMessage="First Name Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>

           <tr>
           <td><asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label></td>
           <td><asp:TextBox ID="tlname" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tlname" runat="server" ErrorMessage="Last Name Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>
           
           <tr>
           <td><asp:Label ID="Label4" runat="server" Text="Address"></asp:Label></td>
           <td><asp:TextBox ID="taddress" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="taddress" runat="server" ErrorMessage="Address Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>
           
           <tr>
           <td><asp:Label ID="Label5" runat="server" Text="Sex"></asp:Label></td>
           <td><asp:DropDownList ID="tsex" runat="server">
           <asp:ListItem Text="Please Select" Value=" " />
           <asp:ListItem Text="Male" Value="M" />
           <asp:ListItem Text="Female" Value="F" />
           </asp:DropDownList></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tsex" runat="server" ErrorMessage="Gender Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>
        
           <tr>
           <td><asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label></td>
           <td><asp:Calendar ID="Calendar1" runat="server" Visible="False" onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
           <asp:TextBox ID="tdob" runat="server" AutoPostBack="True" ReadOnly="true" ></asp:TextBox>
           <asp:LinkButton ID="LinkButton1" CausesValidation="false" runat="server" onclick="LinkButton1_Click"><img src="calendar_image.jpg" alt="DatePicker"/></asp:LinkButton></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tdob" runat="server" ErrorMessage="DOB Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>

           <tr>
           <td><asp:Label ID="Label7" runat="server" Text="Tel Number"></asp:Label></td>
           <td><asp:TextBox ID="ttelno" runat="server" MaxLength="10"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ttelno" runat="server" ErrorMessage="Tel. # Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
           
           </td>
           
           </tr>
        
        <tr>
        <td></td>
        <td><asp:RangeValidator ID="RangeValidator1" ControlToValidate="ttelno" runat="server" ErrorMessage="Should be of 10 digits !!" Type="Double" MinimumValue="1000000000" MaximumValue="9999999999"  ForeColor="Red"></asp:RangeValidator></td>
        </tr>

           <tr>
           <td><asp:Label ID="Label8" runat="server" Text="NIN"></asp:Label></td>
           <td><asp:TextBox ID="tnin" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tnin" runat="server" ErrorMessage="NIN Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>

           </table>
           
           <b>Qualification Details :</b><br/><hr/>
           
           <table>

           <tr>
           <td><asp:Label ID="Label9" runat="server" Text="Quali. Degree"></asp:Label></td>
           <td><asp:DropDownList ID="tquali_type" runat="server">
           <asp:ListItem Text="Please Select" Value=" " />
           <asp:ListItem Text="BSc Nursing" Value="BSc Nursing" />
           <asp:ListItem Text="MD" Value="MD" />
           <asp:ListItem Text="MBBS" Value="MBBS" />
           </asp:DropDownList></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tquali_type" runat="server" ErrorMessage="Quali. Degree Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>           
           </tr>

           <tr>
           <td><asp:Label ID="Label10" runat="server" Text="Quali. Date"></asp:Label></td>
           <td><asp:Calendar ID="Calendar2" runat="server" Visible="False" onselectionchanged="Calendar2_SelectionChanged"></asp:Calendar>
           <asp:TextBox ID="tqual_date" runat="server" AutoPostBack="True" ReadOnly="true" ></asp:TextBox>
           <asp:LinkButton ID="LinkButton2" CausesValidation="false" runat="server" onclick="LinkButton2_Click"><img src="calendar_image.jpg" alt="DatePicker"/></asp:LinkButton>
           </td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tqual_date" runat="server" ErrorMessage="Quali. Date Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>

           <tr>
           <td><asp:Label ID="Label11" runat="server" Text="Institute"></asp:Label></td>
           <td><asp:TextBox ID="tqual_institute" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="tqual_institute" runat="server" ErrorMessage="Institute Name Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>

           </table>

</td>

<td style="width:45%; ">
            
            <b>Work Experiance :</b><br/><hr/>
            
            <table>
            <tr>
            <td><asp:Label ID="Label12" runat="server" Text="Position"></asp:Label></td>
            <td><asp:DropDownList ID="tposition" runat="server">
           <asp:ListItem Text="Please Select" Value=" " />
            <asp:ListItem Text="Staff Nurse" Value="Staff Nurse" />
            <asp:ListItem Text="Senior Nurse" Value="Senior Nurse" />
            <asp:ListItem Text="Junior Nurse" Value="Junior Nurse" />
            <asp:ListItem Text="Doctors" Value="Doctors" />
            <asp:ListItem Text="Specialist Doctor" Value="Specialist Doctor" />
            <asp:ListItem Text="Specialist Consultant" Value="Specialist Consultant" />
            <asp:ListItem Text="Physiotherapist" Value="Physiotherapist" />
            </asp:DropDownList>
            </td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="tposition" runat="server" ErrorMessage="Position Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
            <td><asp:Label ID="Label13" runat="server" Text="Start Date"></asp:Label></td>
            <td><asp:Calendar ID="Calendar3" runat="server" Visible="False" onselectionchanged="Calendar3_SelectionChanged"></asp:Calendar>
            <asp:TextBox ID="tstartdate" runat="server" AutoPostBack="True" ReadOnly="true"></asp:TextBox>
            <asp:LinkButton ID="LinkButton3" CausesValidation="false" runat="server" onclick="LinkButton3_Click"><img src="calendar_image.jpg" alt="DatePicker"/></asp:LinkButton>       
            </td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="tstartdate" runat="server" ErrorMessage="Date Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
            <td><asp:Label ID="Label14" runat="server" Text="Finish Date"></asp:Label></td>
            <td><asp:Calendar ID="Calendar4" runat="server" Visible="False" onselectionchanged="Calendar4_SelectionChanged"></asp:Calendar>
            <asp:TextBox ID="tfinishdate" runat="server" AutoPostBack="True" ReadOnly="true" ></asp:TextBox>
            <asp:LinkButton ID="LinkButton4" CausesValidation="false" runat="server" onclick="LinkButton4_Click"><img src="calendar_image.jpg" alt="DatePicker"/></asp:LinkButton>
            </td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="tfinishdate" runat="server" ErrorMessage="Date Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
            <td><asp:Label ID="Label15" runat="server" Text="Organization"></asp:Label></td>
            <td><asp:TextBox ID="torg" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="torg" runat="server" ErrorMessage="Organization Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
        
            <tr>
            <td></td>
            <td><hr/></td>
            </tr>
            
            </table>
            
            <b>Current Details :</b>
            <br/><hr/>
            
            <table>
            <tr>
            <td><asp:Label ID="Label16" runat="server" Text="Salary"></asp:Label></td>
            <td>Rs.<asp:TextBox ID="tcurr_salary" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="tcurr_salary" runat="server" ErrorMessage="Current Salary Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
            <td></td>
            <td><asp:RangeValidator ID="RangeValidator2" ControlToValidate="tcurr_salary" runat="server" ErrorMessage="Salary should be greater than 10000 !!" Type="Double" MinimumValue="10000" MaximumValue="1000000"  ForeColor="Red"></asp:RangeValidator></td>
            </tr>
            
            <tr>
            <td><asp:Label ID="Label17" runat="server" Text="Salary Scale"></asp:Label></td>
            <td><asp:TextBox ID="tsalary_scale" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="tsalary_scale" runat="server" ErrorMessage="Salary Scale Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
           </td>
            </tr>

            <tr>
            <td></td>
            <td><asp:RangeValidator ID="RangeValidator3" ControlToValidate="tsalary_scale" runat="server" ErrorMessage="Salary Scale should be greater than 10000 !!" Type="Double" MinimumValue="10000" MaximumValue="1000000"  ForeColor="Red"></asp:RangeValidator></td>
            </tr>

            <tr>
            <td><asp:Label ID="Label18" runat="server" Text="Hours/Week"></asp:Label></td>
            <td><asp:TextBox ID="thrsperweek" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="thrsperweek" runat="server" ErrorMessage="Hrs per Week Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
           </tr>

           <tr>
           <td></td>
           <td><asp:RangeValidator ID="RangeValidator4" ControlToValidate="thrsperweek" runat="server" ErrorMessage="Should be between 42 and 84 !!" Type="Integer" MinimumValue="42" MaximumValue="84"  ForeColor="Red"></asp:RangeValidator>
            </td>
           </tr>

            <tr>
            <td><asp:Label ID="Label19" runat="server" Text="Payment Type"></asp:Label></td>
            <td><asp:DropDownList ID="tpaid_m_w" runat="server">
           <asp:ListItem Text="Please Select" Value=" " />
            <asp:ListItem Text="Weelky" Value="W" />
            <asp:ListItem Text="Monthly" Value="M" />
            </asp:DropDownList></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="tpaid_m_w" runat="server" ErrorMessage="Payment Type Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
            <td><asp:Label ID="Label20" runat="server" Text="Job Status"></asp:Label></td>
            <td><asp:DropDownList ID="tstatus" runat="server">
           <asp:ListItem Text="Please Select" Value=" " />
            <asp:ListItem Text="Permanent" Value="P" />
            <asp:ListItem Text="Temporary" Value="T" />
            </asp:DropDownList></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="tstatus" runat="server" ErrorMessage="Job Status Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
            <td><asp:Label ID="Label21" runat="server" Text="Joining Date"></asp:Label></td>
            <td><asp:Calendar ID="Calendar5"  runat="server" Visible="False" onselectionchanged="Calendar5_SelectionChanged"></asp:Calendar>
            <asp:TextBox ID="tj_date" runat="server" AutoPostBack="True" ReadOnly="true" ></asp:TextBox>
            <asp:LinkButton ID="LinkButton5" CausesValidation="false" runat="server" onclick="LinkButton5_Click"><img src="calendar_image.jpg" alt="DatePicker"/></asp:LinkButton>
            </td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator20" ControlToValidate="tj_date" runat="server" ErrorMessage="Date Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
            <td></td>
            <td><hr/></td>
            </tr>
        
            <tr>
            <td></td>
            <td><asp:Button ID="Button1" runat="server" Text="Add Details" onclick="Button1_Click" /></td>
            </tr>

            <tr>
            <td><asp:Button ID="Button2" CausesValidation="false" runat="server" Text="Add New" onclick="Button2_Click" /></td>
            <td></td>
            </tr>

            </table>
           
</td>
</tr>
</table>      
</asp:Content>

