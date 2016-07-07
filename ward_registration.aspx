<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ward_registration.aspx.cs" Inherits="Default2" %>

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
    <table class="style1" >
        <tr>
<!--#include file="left_sidebar.aspx"-->
                     
            <td style=" width:70%; ">
            <b><u>Ward Registration Form:</u></b> <br/><br/>
            
            <table>
            <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Ward Number "></asp:Label> :
            </td> 
            <td>
                <asp:TextBox ID="tward_no" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tward_no" runat="server" ErrorMessage="Ward No Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </tr>

            <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Ward Name "></asp:Label> : 
            </td>
            <td>
                <asp:TextBox ID="tward_name" runat="server"></asp:TextBox>
            </td>
           <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tward_name" runat="server" ErrorMessage="Ward Name Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>            
            </tr>

            <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Location "></asp:Label> : 
            </td>
            <td>
                <asp:DropDownList ID="loc" runat="server">
                <asp:ListItem Text="Please Select" Value=" " />
                <asp:ListItem Text="Front Gate" Value="Front Gate" />
                <asp:ListItem Text="Front Gate Right" Value="Front Gate Right" />
                <asp:ListItem Text="Front Gate Left" Value="Front Gate Left" />
                <asp:ListItem Text="Behind Ghandhi Chowk" Value="Behind Ghandhi Chowk" />
                <asp:ListItem Text="Opposite Canteen" Value="Opposite Canteen" />
                <asp:ListItem Text="Back Gate" Value="Back Gate" />
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="loc" runat="server" ErrorMessage="Location Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </tr>
            
            <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Tel Extn "></asp:Label> : 
            </td>
            <td> 
                <asp:TextBox ID="ttelextn" runat="server"></asp:TextBox>
            </td>
           <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ttelextn" runat="server" ErrorMessage="Tel Extn Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>            
            </tr>

            <tr>
            <td></td>
            <td></td>
           <td>
                <asp:RangeValidator ID="RangeValidator2" ControlToValidate="ttelextn" Type="Integer" runat="server" MinimumValue="1000" MaximumValue="9999" ErrorMessage="Tel Extn must be 4-digits !!"  ForeColor="Red"></asp:RangeValidator>
            </td>            
            </tr>

            
            <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Est. Date "></asp:Label> :    
                <input type="text" style="visibility:hidden" name="date" class="DatePicker">
            </td>
            <td>
                <asp:Calendar ID="Calendar1" runat="server" Visible="False" onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
                <asp:TextBox ID="testdate"   runat="server" ReadOnly="true"  ></asp:TextBox>
                <asp:LinkButton ID="LinkButton1" CausesValidation="false" runat="server" onclick="LinkButton1_Click"><img src="calendar_image.jpg" alt="DatePicker"/></asp:LinkButton>
            </td>
           <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="testdate" runat="server" ErrorMessage="Est. Date Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>            
            </tr>
            
            <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Est. By "></asp:Label> : 
            </td>
            <td>
                <asp:TextBox ID="testby" runat="server"></asp:TextBox>
            </td>
           <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="testby" runat="server" ErrorMessage="Est. By Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>            
            </tr>
            
            <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Number Of Beds "></asp:Label> : 
            </td>
            <td>
                <asp:TextBox ID="tnoofbeds" runat="server"></asp:TextBox>
            </td>
           <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tnoofbeds" runat="server" ErrorMessage="No of Beds Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>            
            </tr>

            <tr>
            <td></td>
            <td></td>
           <td>
                <asp:RangeValidator ID="RangeValidator1" ControlToValidate="tnoofbeds" runat="server" MinimumValue="1" MaximumValue="500" ErrorMessage="No of Beds must be between 1 & 500 !!"  ForeColor="Red"></asp:RangeValidator>
            </td>            
            </tr>
            

            <tr>
            <td></td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Submit Ward Details" onclick="Button2_Click" />    
            </td>
            </tr>
            
            <tr>
            <td>
                <asp:Button ID="Button1" CausesValidation="false" runat="server" Text="Add Wards" onclick="Button1_Click" />    
            </td>
            <td></td>
            </tr>

            
            <tr>
            <td></td>
            <td>
                <asp:Label ID="labelresponse" runat="server" Text=""></asp:Label>
            </td>
            </tr>
            </table>
            
</td>
</tr>
</table>      
</asp:Content>

