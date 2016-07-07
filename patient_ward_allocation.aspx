<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patient_ward_allocation.aspx.cs" Inherits="patient_ward_allocation" %>

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
     
 <td style=" width:80%; ">
           <b><u>Patient Ward Allocation Form:</u></b> <br /><br />

           
           <table style=" width:80%; ">
                
                <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Charge Staff No"></asp:Label></td>
                <td>
                     <asp:DropDownList ID="ddlstaffno" AutoPostBack="true" runat="server" CssClass="text" OnSelectedIndexChanged="myListstaffno_Change"></asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Charge Nurse"></asp:Label>
                </td>
                <td>
                     <asp:Label ID="lblsname" runat="server"></asp:Label>
                </td>
                </tr>

                <tr>
                <td>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlstaffno" runat="server" ErrorMessage="Ward No Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Position"></asp:Label>
                </td>
                <td>
                     <asp:Label ID="lblposition" runat="server"></asp:Label>
                </td>
                </tr>
           

                <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Patient Id"></asp:Label>
                </td>
                <td>
                     <asp:DropDownList ID="ddlpatientid" AutoPostBack="true" runat="server" CssClass="text" OnSelectedIndexChanged="myListPatientId_Change"></asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="Labelsex" runat="server" Text="Patient Gender"></asp:Label>
                </td>
                <td>
                     <asp:Label ID="lblsex" runat="server"></asp:Label>
                </td>
                </tr>

                <tr>
                <td></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ddlpatientid" runat="server" ErrorMessage="Patient Id Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Labeladdress" runat="server" Text="Patient Address"></asp:Label>
                </td>
                <td>
                     <asp:Label ID="lbladdress" runat="server"></asp:Label>
                </td>
                </tr>

                <tr>
                <td>
                    <asp:Label ID="Labelpname" runat="server" Text="Patient Name"></asp:Label>
                </td>
                <td>
                     <asp:Label ID="lblpname" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Labelage" runat="server" Text="Patient Age"></asp:Label>
                </td>
                <td>
                     <asp:Label ID="lblage" runat="server"></asp:Label>
                </td>
                </tr>


                <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Allocation Date"></asp:Label>
                </td>
                <td>: 
                    <asp:Calendar ID="Calendar1" runat="server" Visible="False" onselectionchanged="Calendar1_SelectionChanged"></asp:Calendar>
                    <asp:TextBox ID="tallocation_date" runat="server" AutoPostBack="True" ReadOnly="true" ></asp:TextBox>
                    <asp:LinkButton ID="LinkButton1" CausesValidation="false" runat="server" onclick="LinkButton1_Click"><img src="calendar_image.jpg" alt="DatePicker"/></asp:LinkButton>
                </td>                
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Expected Stay (In Days)"></asp:Label>
                </td>
                <td>
                    : <asp:TextBox ID="texpectedstay" runat="server"></asp:TextBox>
                </td>
                </tr>

                <tr>
                <td>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="tallocation_date" runat="server" ErrorMessage="Date Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RangeValidator ID="RangeValidator1" ControlToValidate="texpectedstay" runat="server" Type="Integer" MinimumValue="1" MaximumValue="365" ErrorMessage="1 to 365 Days Only !!"  ForeColor="Red"></asp:RangeValidator>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="texpectedstay" runat="server" ErrorMessage="Expected Stay Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                </tr>

                <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Allocated To Ward"></asp:Label>
                </td>
                <td>
                    : <asp:DropDownList ID="ddlwardno" AutoPostBack="true" runat="server" CssClass="text" OnSelectedIndexChanged="myListwardno_Change"></asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Location"></asp:Label>
                </td>
                <td>
                    : <asp:Label ID="lblwardlocation" runat="server" Text=" "></asp:Label>
                </td>
                </tr>
           
                <tr>
                <td></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlwardno" runat="server" ErrorMessage="Ward No Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="Tel Extn"></asp:Label>
                </td>
                <td>
                    : <asp:Label ID="lbltelextn" runat="server" Text=" "></asp:Label>
                </td>
                </tr>


                <tr>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="Allocate Bed No"></asp:Label></td>
                <td>
                    : <asp:DropDownList ID="ddlbedno" AutoPostBack="true" runat="server" CssClass="text" >
                    <asp:ListItem Text="Please Select" Value=" " />
                    <asp:ListItem Text="1" Value="1" />
                    <asp:ListItem Text="2" Value="2" />
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="4" Value="4" />
                    <asp:ListItem Text="5" Value="5" />
                    </asp:DropDownList>
                </td>
           <td>
                <asp:Label ID="Label14" runat="server" Text="No Of Beds Left"></asp:Label>    
           </td>
           <td>
               : <asp:TextBox ID="lblnoofbeds" runat="server" ReadOnly="true" Text=""></asp:TextBox>
               <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="lblnoofbeds" MinimumValue="1" MaximumValue="1000" ErrorMessage="Should be more than 0 !!" ForeColor="Red"></asp:RangeValidator>
           </td>

                </tr>


           <tr>
             <td></td>
             <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ddlbedno" runat="server" ErrorMessage="Bed No Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
             <td></td>
             <td></td>
           </tr>


           <tr>
             <td></td>
             <td>
                <asp:Button ID="Button1" runat="server" Text="Allocate" onclick="Button1_Click" />
             </td>
             <td></td>
             <td></td>
           </tr>

           <tr>
             <td>
                <asp:Button ID="Button2" runat="server" Text="Allocate New" CausesValidation="false" onclick="Button2_Click" />
             </td>
             <td></td>
             <td></td>
             <td></td>
           </tr>
           
           </table>

 </td>
 </tr>
 </table>      
 </asp:Content>

