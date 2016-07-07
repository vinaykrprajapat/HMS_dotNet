<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patient_registration.aspx.cs" Inherits="patient_registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style1
        {
            margin-left:10px;
            width: 100%;
            border-style: double;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="style1">
<tr>
<!--#include file="left_sidebar.aspx"-->
         
<td style=" width:40%; ">
           <b><u>Patient Registration Form :</u></b> <br /><br />
                
           <asp:Label ID="Label1" runat="server" Text="Patient Id"></asp:Label>
           <asp:TextBox ID="tpatient_id" runat="server" ReadOnly="True"></asp:TextBox><br/><br/>

           <b><u>Personal Details :</u></b><br/><hr/>

           <table>
           <tr>
           <td><asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label></td>
           <td> <asp:TextBox ID="tfname" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tfname" runat="server" ErrorMessage="First Name Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>

           <tr>
           <td><asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label></td>
           <td> <asp:TextBox ID="tlname" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tlname" runat="server" ErrorMessage="Last Name Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>
           
           <tr>
           <td><asp:Label ID="Label4" runat="server" Text="Address"></asp:Label></td>
           <td><asp:TextBox ID="taddress" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="taddress" runat="server" ErrorMessage="Address Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>           
           </tr>
           
           <tr>
           <td><asp:Label ID="Label5" runat="server" Text="Sex"></asp:Label></td>
           <td><asp:DropDownList ID="ddlsex" runat="server">
           <asp:ListItem Text="Please Select" Value=" " />
           <asp:ListItem Text="Male" Value="M" />
           <asp:ListItem Text="Female" Value="F" />
           </asp:DropDownList></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ddlsex" runat="server" ErrorMessage="Gender Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>
        

           <tr>
           <td><asp:Label ID="Label7" runat="server" Text="Tel Number"></asp:Label></td>
           <td><asp:TextBox ID="ttelno" runat="server" MaxLength="10"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ttelno" runat="server" ErrorMessage="Tel. no Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>           
           </tr>

           <tr>
           <td></td>
           <td><asp:RangeValidator ID="RangeValidator1" ControlToValidate="ttelno" runat="server" ErrorMessage="Should be of 10 digits !!" Type="Double" MinimumValue="1000000000" MaximumValue="9999999999"  ForeColor="Red"></asp:RangeValidator></td>           
           <td></td>
           </tr>

           <tr>
           <td><asp:Label ID="Label8" runat="server" Text="Marital Status"></asp:Label></td>
           <td><asp:DropDownList ID="ddlms" runat="server">
           <asp:ListItem Text="Please Select" Value=" " />
           <asp:ListItem Text="Single" Value="Single" />
           <asp:ListItem Text="Married" Value="Married" />
           </asp:DropDownList></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="ddlms" runat="server" ErrorMessage="Marital Status Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
           </tr>

           <tr>
           <td><asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label></td>
           <td><asp:Calendar ID="Calendar1" runat="server" Visible="False" onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
           <asp:TextBox ID="tdob" runat="server" AutoPostBack="True" ReadOnly="true" ></asp:TextBox>
           <asp:LinkButton ID="LinkButton1" CausesValidation="false" runat="server" onclick="LinkButton1_Click"><img src="calendar_image.jpg" alt="DatePicker"/></asp:LinkButton></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tdob" runat="server" ErrorMessage="Date Of Birth Required !!" ForeColor="Red"></asp:RequiredFieldValidator>
           </td>
           </tr>


           <tr>
           <td><asp:Label ID="Label22" runat="server" Text="Registration Date"></asp:Label></td>
           <td><asp:Calendar ID="Calendar2" runat="server" Visible="False" onselectionchanged="Calendar2_SelectionChanged"></asp:Calendar>
           <asp:TextBox ID="treg_date" runat="server" AutoPostBack="True" ReadOnly="true"></asp:TextBox>
           <asp:LinkButton ID="LinkButton2" CausesValidation="false" runat="server" onclick="LinkButton2_Click"><img src="calendar_image.jpg"></asp:LinkButton></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="treg_date" runat="server" ErrorMessage="Reg. Date Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>           
           </tr>

           <tr>
           <td></td>
           <td><hr/></td>
           </tr>

           </table>
        
</td>
<td style=" width:50%; ">
        
        <b><u>Next Of Kin Details :</u></b><br/><hr/>
        <table>

        <tr>
        <td><asp:Label ID="Label11" runat="server" Text="Full Name"></asp:Label></td>
        <td><asp:TextBox ID="tnok_fullname" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="tnok_fullname" runat="server" ErrorMessage="Full Name Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>        
        </tr>

        <tr>
        <td><asp:Label ID="Label9" runat="server" Text="RelationShip"></asp:Label></td>
        <td><asp:TextBox ID="tnok_rel" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="tnok_rel" runat="server" ErrorMessage="RelationShip Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label10" runat="server" Text="Address"></asp:Label></td>
        <td><asp:TextBox ID="tnok_addr" runat="server"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="tnok_addr" runat="server" ErrorMessage="Address Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>

        <tr>
        <td><asp:Label ID="Label23" runat="server" Text="Tel No"></asp:Label></td>
        <td><asp:TextBox ID="tnok_telno" runat="server" MaxLength="10"></asp:TextBox></td>
           <td><asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="tnok_telno" runat="server" ErrorMessage="Tel. no Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>

           <tr>
           <td></td>
           <td><asp:RangeValidator ID="RangeValidator2" ControlToValidate="tnok_telno" runat="server" ErrorMessage="Should be of 10 digits !!" MinimumValue="1000000000" MaximumValue="9999999999" Type="Double"  ForeColor="Red"></asp:RangeValidator></td>           
           <td></td>
           </tr>

        </table>
        
        <b><u>Local Doctor Details :</u></b><br/><hr/>
        
        <table>
        <tr>
        <td><asp:Label ID="Label12" runat="server" Text="Clinic Id"></asp:Label></td>
        <td><asp:DropDownList ID="ddlclinicid" runat="server">
        </asp:DropDownList>            
        </td>
        <td><asp:Button ID="Button2" CausesValidation="false" runat="server" Text="Get Details" onclick="Button2_Click" /></td>
        <td>
        <script type="text/javascript">
<!--

                 function MM_openBrWindow(theURL, winName, features) { //v2.0
                     window.open(theURL, winName, features);
                 }
//-->
</script>
         <a href="local_doctor_registration.aspx" onclick="MM_openBrWindow('local_doctor_registration.aspx','google','scrollbars=yes,width=750,height=600'); return false;">New Clinic Registration</a>  
         </td>
         </tr>
         
         <tr>
         <td></td>
         <td></td>
         <td><asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="ddlclinicid" runat="server" ErrorMessage="Clinic Id Required !!"  ForeColor="Red"></asp:RequiredFieldValidator></td>
          </tr>
         
         </table>

        <table>
        <tr>
        <td><asp:Label ID="lbldoctor_name" runat="server" Text="" BackColor="#99FF66"></asp:Label></td>
        </tr>

        <tr>
        <td><asp:Label ID="lblclinic_address" runat="server" Text="" BackColor="#99FF66"></asp:Label></td>
        </tr>

        <tr>
        <td><asp:Label ID="lbltel_no" runat="server" Text="" BackColor="#99FF66"></asp:Label></td>
        </tr>

        </table>
         
        <table>
        <tr>
        <td></td>
        <td><asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" />
        </td>
        </tr>
        
        <tr><td></td><td></td></tr>

        <tr><td></td><td><asp:Button ID="Button3" CausesValidation="false" runat="server" Text="Add New Patient" onclick="Button3_Click" />
        </td></tr>
        </table>
           
</td>
</tr>
</table>      
        

</asp:Content>

