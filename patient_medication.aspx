<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patient_medication.aspx.cs" Inherits="patient_medication" %>

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
         
            <td style=" width:35%; ">
           <b><u>Patient Medication Form :</u></b> <br /><br />
            <table>
       
       <tr>
        <td><asp:Label ID="Label3" runat="server" Text="Medication No"></asp:Label></td>
        <td><asp:TextBox ID="tmedication_no" runat="server" ></asp:TextBox></td>
        </tr>
                <tr>
        <td><asp:Label ID="Label9" runat="server" Text="Medication Date"></asp:Label></td>
        <td>
        <asp:Calendar ID="Calendar1" runat="server" Visible="False" onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
        <asp:TextBox ID="tmedicationdate" runat="server" AutoPostBack="True" ReadOnly="true" ></asp:TextBox>
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"><img src="calendar_image.jpg"></asp:LinkButton>
        </td>
        </tr>

        </table>
        <hr/>
        <table>
           <tr>
           <td><asp:Label ID="Label7" runat="server" Text="Patient Id"></asp:Label></td>
           <td>
           <asp:DropDownList ID="ddlpatientid" runat="server">
           </asp:DropDownList>
           <asp:Button ID="Get_Patient_Detail_Button" runat="server" Text="Get Patient Details" 
                   onclick="Get_Patient_Detail_Button_Click" />
           </td>
           </tr>

          <tr><td>
         <asp:Label ID="Label1" runat="server" Text="Disease Type"></asp:Label></td>
         <td><asp:DropDownList ID="ddldiseasetype" runat="server">
         <asp:ListItem Text="OPD" Value="OPD" />
         <asp:ListItem Text="Infectious" Value="Infectious" />
        <asp:ListItem Text="Contagious " Value="Contagious" />
        <asp:ListItem Text="Foodborne " Value="Foodborne" />
        <asp:ListItem Text="Communicable " Value="Communicable" />
        <asp:ListItem Text="Non-communicable" Value="Non-communicable" />
        <asp:ListItem Text="Airborne" Value="Airborne" />
        <asp:ListItem Text="Lifestyle " Value="Lifestyle " />
        <asp:ListItem Text="Mental disorders" Value="Mental disorders" />
        <asp:ListItem Text="Organic diseases" Value="Organic diseases" />
        </asp:DropDownList></td></tr>

        <tr>
        <td><asp:Label ID="Label2" runat="server" Text="Disease"></asp:Label></td>
        <td><asp:TextBox ID="tdisease" runat="server" ></asp:TextBox></td>
        </tr>
       
           <tr>
           <td><asp:Label ID="Label8" runat="server" Text="Drug Id"></asp:Label></td>
           <td>
           <asp:DropDownList ID="ddldrugid" runat="server">
           </asp:DropDownList>
           <asp:Button ID="Get_Drug_Detail_Button" runat="server" Text="Get Drug Details" 
                   onclick="Get_Drug_Detail_Button_Click" />
           </td>
           </tr>

        
                <tr>
        <td><asp:Label ID="Label4" runat="server" Text="Dosage (ml/mg)"></asp:Label></td>
        <td><asp:TextBox ID="tdosage" runat="server" ></asp:TextBox></td>
        </tr>

                <tr>
        <td><asp:Label ID="Label5" runat="server" Text="Method Of Admin"></asp:Label></td>
        <td><asp:TextBox ID="tmethod_of_admin" runat="server" ></asp:TextBox></td>
        </tr>
                <tr>
        <td><asp:Label ID="Label6" runat="server" Text="Units per Day"></asp:Label></td>
        <td><asp:TextBox ID="tunits_per_day" runat="server" ></asp:TextBox></td>
        </tr>

        <tr>
        <td></td>
        <td>
            <asp:Button ID="Submit_Button" runat="server" Text="Submit" 
                onclick="Submit_Button_Click" />
        </td>
        </tr>

        <tr>
        <td></td>
        <td>
            <asp:Button ID="Add_New_Button" runat="server" Text="Add New" 
                onclick="Add_New_Button_Click" />
        </td>
        </tr>

            </table>
            </td>
            <td style=" width:35%; ">
            
            <table style="border-style: double;">
                        <tr>
        <td></td>
        <td><asp:Label ID="info" runat="server" BackColor="#99CCFF"></asp:Label></td>
        </tr>
        
            </table>

</td></tr></table>
</asp:Content>

