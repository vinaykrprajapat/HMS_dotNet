<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style1
        {
            margin-left:10px;
            width: 100%;
            border-style: double;
        }
        .style2
        {
            margin-left:10px;
           
            border-style: double;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table class="style1">
    <tr>
    <td style="width:10%; margin-left:1px;">
        <img src="center.jpg" alt="WMHCS"/>            
    </td>
    <td style=" width:55%;">
    <center>
        <table class="style2">
            <tr>
             <td>
                 <asp:Label ID="Label3" runat="server" Text="Login Pannel" ForeColor="Blue"></asp:Label>
             </td>
             <td>
                 <asp:Label ID="Label4" runat="server" Text="WMHCS" ForeColor="Blue"></asp:Label>
             </td>
             </tr>

             <tr>
             <td>
                 <asp:Label ID="Label1" runat="server" Text="User Id"></asp:Label>
             </td>
             <td>
                 <asp:TextBox ID="tuid" runat="server"></asp:TextBox>
             </td>
             <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tuid" runat="server" ErrorMessage="User Id Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
             </td>
             </tr>
             
             <tr>
             <td>
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
             </td>
             <td>
                 <asp:TextBox ID="tpass" TextMode="Password" runat="server" MaxLength="16" ></asp:TextBox>
             </td>
             <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tpass" runat="server" ErrorMessage="Password Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
             </td>
             </tr>
             
             <tr>
             <td></td>
             <td>
                 <asp:Button ID="Login" runat="server" Text="login" onclick="Login_Click" />
             </td>
             </tr>
             
             <tr>
             <td></td>
             <td>
                 <asp:Label ID="lblerror" runat="server" Font-Italic="True" Font-Bold="True" ForeColor="Red" Font-Size="Larger"></asp:Label>
             </td>
            </tr>
         </table>
    </center>
    </td>
    
    <td style=" width:35%; " >
        <img src="hospital.png" alt="WMHCS"/>
    </td>
    </tr>
</table> 


</asp:Content>

