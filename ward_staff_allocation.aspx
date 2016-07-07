<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ward_staff_allocation.aspx.cs" Inherits="ward_staff_allocation" %>

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
         <!--#include file="left_sidebar.aspx"-->
         
<td style=" width:55%; ">
           <b><u>Ward Staff Allocation Form:</u></b> <br /><br />

           <table>
           <tr>
           <td>
           <asp:Label ID="Label1" runat="server" Text="Week No"></asp:Label>
           </td>
           <td>
           <asp:TextBox ID="tweek_no" runat="server"></asp:TextBox>
           </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tweek_no" runat="server" ErrorMessage="Week No Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </tr>

            <tr>
            <td>            
            </td>
            <td>
            </td>
            <td>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tweek_no" Type="Integer" ErrorMessage="Week No Must be between 1 to 53" ForeColor="Red" MinimumValue="1" MaximumValue="53"></asp:RangeValidator>
            </td>
            </tr>


           <tr>
           <td>
           <asp:Label ID="Label3" runat="server" Text="Allocated To Ward No"></asp:Label>
           </td>
           <td>
           <asp:DropDownList ID="ddlwardno" runat="server"></asp:DropDownList>
           </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlwardno" runat="server" ErrorMessage="Ward No Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>

           </tr>

           <tr>
           <td>
           <asp:Label ID="Label4" runat="server" Text="Staff No"></asp:Label>
           </td>
           <td>
           <asp:DropDownList ID="ddlstaffno" runat="server"></asp:DropDownList>
           <asp:Button ID="Button2" CausesValidation="false" runat="server" Text="Get Staff Details" onclick="Button2_Click" />
           </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ddlstaffno" runat="server" ErrorMessage="Staff No Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
           </tr>

           <tr>
           <td></td>
           <td><asp:Label ID="info" runat="server" Text=""></asp:Label>
           </td>
           </tr>

           <tr>
           <td><asp:Label ID="Label6" runat="server" Text="Shift"></asp:Label></td>
           <td>
           <asp:DropDownList ID="tshift" runat="server">
           <asp:ListItem Text="Please Select" Value=" " />
           <asp:ListItem Text="Early" Value="early" />
           <asp:ListItem Text="Late" Value="late" />
           <asp:ListItem Text="Night" Value="night" />
           </asp:DropDownList>           
           </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tshift" runat="server" ErrorMessage="Shift Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
           </tr>

           <tr>
           <td>
           <asp:Label ID="Label2" runat="server" Text="Week Begning Date"></asp:Label>
           </td>
           <td>           
     <asp:Calendar ID="Calendar1" runat="server" Visible="False" onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
    <asp:TextBox ID="tweek_beg_date" runat="server" AutoPostBack="True" ReadOnly="true" ></asp:TextBox>
    <asp:LinkButton ID="LinkButton1" CausesValidation="false" runat="server" onclick="LinkButton1_Click"><img src="calendar_image.jpg"></asp:LinkButton>
           </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tweek_beg_date" runat="server" ErrorMessage="Week Begnning Date Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>

           </tr>
           
           <tr>
           <td></td>
           <td><asp:Button ID="Button1" runat="server" Text="Allocate" onclick="Button1_Click" />
           </td>
           </tr>

           <tr>
           <td>
           <asp:Button ID="Button3" CausesValidation="false" runat="server" Text="New Allocation" onclick="Button3_Click" />
           </td>
           <td>
           </td>
           </tr>

           </table>


</td>
<td style=" width:25%; ">

         <table>
         <tr>
         <td> </td>
         <td>
         <asp:Label ID="tfname" runat="server" Text="" ForeColor="#0000CC"></asp:Label>
         </td>
         </tr>
         
         <tr>
         <td> </td>
         <td>
         <asp:Label ID="twe_position" runat="server" Text="" ForeColor="#0000CC"></asp:Label> 
         </td>
         </tr>
         
         <tr>
         <td></td>
         <td>
         <asp:Label ID="tper_temp" runat="server" Text="" ForeColor="#0000CC"></asp:Label>
         </td>
         </tr>
         
         <tr><td> </td>
         <td>
         <asp:Label ID="taddress" runat="server" Text="" ForeColor="#0000CC"></asp:Label>
         </td>
         </tr>
         
         <tr><td>  </td>
         <td>
         <asp:Label ID="ttelno" runat="server" Text="" ForeColor="#0000CC"></asp:Label>
         </td>
         </tr>

         </table>

</td>
</tr>
</table>      
</asp:Content>

