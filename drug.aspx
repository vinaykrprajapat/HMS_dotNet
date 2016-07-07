<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="drug.aspx.cs" Inherits="drug" %>

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
         
<td style=" width:65%; ">
           <b><u>Drugs Entry Form :</u></b> <br /><br />
                
           <asp:Label ID="Label1" runat="server" Text="Drug Id"></asp:Label>
           <asp:TextBox ID="tdrug_id" runat="server" ReadOnly="True"></asp:TextBox>
           <br/><br/>
           <b><u>Drug Details :</u></b><br/><hr/>
           
           <table>
           <tr>
           <td>
           <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
           </td>
           <td> 
           <asp:TextBox ID="tname" runat="server"></asp:TextBox>
           </td>
           <td>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tname" runat="server" ErrorMessage="Name Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
           </td>
           </tr>
           
           <tr>
           <td>
           <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
           </td>
           <td> 
           <asp:TextBox ID="tdesc" runat="server"></asp:TextBox>
           </td>
           <td>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tdesc" runat="server" ErrorMessage="Description Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
           </td>
           </tr>
               
           <tr>
           <td>
           <asp:Label ID="Label4" runat="server" Text="Quantity"></asp:Label>
           </td>
           <td>
           <asp:TextBox ID="tqty" runat="server"></asp:TextBox>
           </td>
           <td>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="tqty" runat="server" ErrorMessage="Quantity Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
           </td>
           </tr>

           <tr>
           <td>
           </td>
           <td>
           </td>
           <td>
           <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="tqty" Type="Integer" ErrorMessage="Quantity Must be Above 0" ForeColor="Red" MinimumValue="0" MaximumValue="10000" ></asp:RangeValidator>
           </td>
           </tr>
           
           <tr>
           <td>
           <asp:Label ID="Label5" runat="server" Text="Cost Per Unit"></asp:Label>
           </td>
           <td>
           <asp:TextBox ID="tcpu" runat="server"></asp:TextBox>
           </td>
           <td>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="tcpu" runat="server" ErrorMessage="Cost Per Unit Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
           </td> 
           </tr>

           <tr>
           <td>
           </td>
           <td>
           </td>
           <td>
           <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tcpu" Type="Integer" ErrorMessage="Cost Per Unit Must be Between 0 and 1000" ForeColor="Red" MinimumValue="0" MaximumValue="1000"></asp:RangeValidator>
           </td> 
           </tr>
        
           <tr>
           <td>
           <asp:Label ID="Label7" runat="server" Text="Supplier"></asp:Label>
           </td>
           <td>
           <asp:TextBox ID="tsupplier" runat="server" ></asp:TextBox>
           </td>
           <td>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="tsupplier" runat="server" ErrorMessage="Supplier Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
           </td>
           </tr>

           <tr>
           <td>
           <asp:Label ID="Label6" runat="server" Text="Expiry Date"></asp:Label>
           </td>
           <td>
           <asp:Calendar ID="Calendar1" runat="server" Visible="False" onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
           <asp:TextBox ID="texpdate" runat="server" AutoPostBack="True" ReadOnly="true" ></asp:TextBox>
           <asp:LinkButton ID="LinkButton1"  CausesValidation="false" runat="server" onclick="LinkButton1_Click"><img src="calendar_image.jpg" alt="DatePicker" /></asp:LinkButton>
           </td>
           <td>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="texpdate" runat="server" ErrorMessage="Expiry Date Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
           </td>
           </tr>
           
           <tr>
           <td></td>
           <td>
           <asp:Button ID="Button1" runat="server" Text="Submit Drug" onclick="Button1_Click" />
           </td>
           </tr>

           <tr>
           <td>
           <asp:Button ID="Button3" CausesValidation="false" runat="server" Text="Add New" onclick="Button3_Click" />
           </td>
           <td>
           </td>
           </tr>

           <tr>
           <td></td>
           <td><hr/></td>
           </tr>

           </table>
        
</td>
<td style=" width:15%; ">
                   
</td>
</tr>
</table>      
        
</asp:Content>

