<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ward_details.aspx.cs" Inherits="ward_details" %>

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
          
<td style=" width:35% ;">
            <b><u>Ward Details :</u></b> <br/><br/>
                          
            <table>
            <tr>
            <td>
            Enter Ward Number<font color="red">*</font> 
            </td>
            <td>: 
           <asp:DropDownList ID="sward_no" runat="server"></asp:DropDownList>
            </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="sward_no" runat="server" ErrorMessage="Ward No Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </tr>
            
            <tr>
            <td>
            Enter Week No<font color="red">*</font> 
            </td>
            <td>:
            <asp:TextBox ID="week_no" runat="server"></asp:TextBox>
            </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="week_no" runat="server" ErrorMessage="Week No Required !!"  ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            </tr>

           <tr>
           <td></td>
           <td>
               <asp:RangeValidator ID="RangeValidator1" ControlToValidate="week_no" runat="server" ErrorMessage="Must be between 1 to 53 !!" MinimumValue="1" MaximumValue="53" ForeColor="Red"></asp:RangeValidator>            
           </td>
           <td></td>
           </tr>


            <tr>
            <td>
            </td>
            <td>
            <asp:Button ID="Button1" runat="server" Text="Search" onclick="Button1_Click" />
            </td>
            </tr>
            </table>
            
            <hr/>
            <br/>
            
            <table>
            <tr><td>
            <asp:Label ID="Label1" runat="server" Text="Ward Name "></asp:Label> </td><td>: 
            <asp:Label ID="tward_name" runat="server"></asp:Label>
            </td></tr>
            <tr><td>
            <asp:Label ID="Label2" runat="server" Text="Location "></asp:Label>  
            </td><td>:<asp:Label ID="tlocation" runat="server" ></asp:Label>
            </td></tr>
            <tr><td>
        <asp:Label ID="Label3" runat="server" Text="Tel Extn "></asp:Label>  
            </td><td>:<asp:Label ID="ttelextn" runat="server" ></asp:Label>
            </td></tr>
            <tr><td>
            <asp:Label ID="Label4" runat="server" Text="Est. Date "></asp:Label>  
            </td><td>:<asp:Label ID="testdate" runat="server" ></asp:Label>
            </td></tr>
            <tr><td>
            <asp:Label ID="Label5" runat="server" Text="Est. By "></asp:Label>  
            </td><td>:<asp:Label ID="testby" runat="server" ></asp:Label>
            </td></tr>
            <tr><td>
            <asp:Label ID="Label6" runat="server" Text="Number Of Beds "></asp:Label>  
            </td><td>:<asp:Label ID="tnoofbeds" runat="server" ></asp:Label>
            </td></tr>
            </table>
            
            </td>

            <td style=" width:35%; " >
            
            <table>
            <tr><td>
            <asp:Label ID="Label7" runat="server" Text="Staff No "></asp:Label> </td><td> 
            :<asp:DropDownList ID="ddlstaff_no" runat="server" ></asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="Get_Staff_Details" CausesValidation="false" runat="server" Text="Get Details" onclick="Get_Staff_Details_Click" />
            </td>
            </tr>
            
            </table>
            <table>
                <asp:Label ID="info" runat="server" Text=""></asp:Label>
            </table>
            </td>
        
        
        </tr>
    </table> 


</asp:Content>
