<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="local_doctor_registration.aspx.cs" Inherits="local_doctor_registration" %>

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
<td style="width:10%; margin-left:1px;">
</td>

<td style=" width:65%;">
            <br/> <b>Local Doctor - Clinic Registration Form :</b><br/><br/>
            <table class="style2">
            <tr>
            <td>
            <asp:Label ID="Label1" runat="server" Text="Clinic Id"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="tcid" runat="server"></asp:TextBox>
            </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tcid" runat="server" ErrorMessage="Clinic Id Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </tr>
            
            <tr>
            <td>            
            </td>
            <td>
            </td>
            <td>
           <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tcid" Type="Integer" ErrorMessage="Clinic Id Must be Numberic & greater than 0" ForeColor="Red" MinimumValue="0" MaximumValue="10000"></asp:RangeValidator>
            </td>
            </tr>
            

            <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Doctor Name"></asp:Label></td>
            <td>
            <asp:TextBox ID="tdoc_name" runat="server"></asp:TextBox>
            </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tdoc_name" runat="server" ErrorMessage="Doctor Name Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </tr>

            <tr>
            <td><asp:Label ID="Label5" runat="server" Text="Clinic Address"></asp:Label></td>
            <td>
            <asp:TextBox ID="tcaddress" runat="server"></asp:TextBox>
            </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tcaddress" runat="server" ErrorMessage="Clinic Address Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </tr>
            
            <tr>
            <td>
            <asp:Label ID="Label6" runat="server" Text="Doctor Tel No."></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="ttelno" runat="server"></asp:TextBox>
            </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ttelno" runat="server" ErrorMessage="Tel. No Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </tr>
             
            <tr>
            <td>            
            </td>
            <td>
            </td>
            <td>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="ttelno" Type="Double" ErrorMessage="Tel No. Must be of length 10" ForeColor="Red" MinimumValue="1000000000" MaximumValue="9999999999"></asp:RangeValidator>
            </td>
            </tr>


            <tr>
            <td></td>
            <td>
            <asp:Button ID="Button1" runat="server" Text="Submit Details" onclick="Button1_Click" />
            </td>
            </tr>
            
            <tr>
            <td>
            <asp:Button ID="Button3" CausesValidation="false" runat="server" Text="Add New" onclick="Button3_Click" />
            </td>
            <td>
            </td>
            </tr>

            </table>
            
</td>
<td style=" width:25%; " >
<img src="clinic.jpg" alt="Clinic" height="150px" width="150px" />
</td>
</tr>
</table> 


</asp:Content>

