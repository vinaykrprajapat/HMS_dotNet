<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patient_record.aspx.cs" Inherits="records_patient_record" %>

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
<td style=" width:35%; ">
            <b><u>Patient Details :</u></b> <br /><br />
             <table>
             <tr>
             <td>   
            <asp:Label ID="Label1" runat="server" Text="Patient Id"></asp:Label>
            : </td>
            <td>
            <asp:DropDownList ID="ddlpatientid" runat="server">
           </asp:DropDownList></td>
           </tr>

           <tr>
           <td>
            <asp:Label ID="Label13" runat="server" Text="Patient Name"></asp:Label>:
            </td>
            <td>
    <asp:TextBox ID="searchname" runat="server"></asp:TextBox><br/>
           </td>
           </tr><tr>
           <td><font color="red">*lowercase only</font></td>
           <td>
           <asp:Button ID="Button1" runat="server" Text="Get Patient Details" 
                   onclick="Button1_Click" /></td></tr></table>
           <br/>
           <br/>
            
            <b><u>Personal Details :</u></b><br/><hr/>
            <table>
            
            <tr>
            <td><asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label></td>
            <td>: <asp:Label ID="tfname" runat="server" ForeColor="Blue"></asp:Label></td>
            </tr>
            
            <tr>
            <td><asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label></td>
            <td>: <asp:Label ID="tlname" runat="server" ForeColor="Blue"></asp:Label></td>
            </tr>
            
            <tr>
            <td><asp:Label ID="Label4" runat="server" Text="Address"></asp:Label></td>
            <td>: <asp:Label ID="taddress" runat="server" ForeColor="Blue"></asp:Label></td>
            </tr>
            
            <tr>
            <td><asp:Label ID="Label5" runat="server" Text="Sex"></asp:Label></td>
            <td>: <asp:Label ID="tsex" runat="server" ForeColor="Blue" ></asp:Label></td></tr>
        
            <tr>
            <td><asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label></td>
            <td>: <asp:Label ID="tdob" runat="server" ForeColor="Blue" ></asp:Label></td>
            </tr>

            <tr>
            <td><asp:Label ID="Label7" runat="server" Text="Tel Number"></asp:Label></td>
            <td>: <asp:Label ID="ttelno" runat="server" MaxLength="10" ForeColor="Blue"></asp:Label></td>
            </tr>

            <tr>
            <td><asp:Label ID="Label8" runat="server" Text="Marital Status"></asp:Label></td>
            <td>: <asp:Label ID="tms" runat="server" ForeColor="Blue"></asp:Label></td></tr>

            <tr>
            <td><asp:Label ID="Label22" runat="server" Text="Registration Date"></asp:Label></td>
            <td>: <asp:Label ID="treg_date" runat="server" ForeColor="Blue" ></asp:Label></td>
            </tr>

            <tr>
            <td></td>
            <td><hr/></td>
            </tr>

            </table>
        
</td>
<td style=" width:35%; ">
        
            <b><u>Next Of Kin Details :</u></b><br/><hr/>
            <table>

            <tr>
            <td><asp:Label ID="Label11" runat="server" Text="Full Name"></asp:Label></td>
            <td>: <asp:Label ID="tnok_fullname" runat="server" ForeColor="Blue"></asp:Label></td>
            </tr>

             <tr>
            <td><asp:Label ID="Label9" runat="server" Text="RelationShip"></asp:Label></td>
            <td>: <asp:Label ID="tnok_rel" runat="server" ForeColor="Blue"></asp:Label></td>
            </tr>

             <tr>
            <td><asp:Label ID="Label10" runat="server" Text="Address"></asp:Label></td>
            <td>: <asp:Label ID="tnok_addr" runat="server" ForeColor="Blue"></asp:Label></td>
            </tr>

             <tr>
             <td><asp:Label ID="Label23" runat="server" Text="Tel No"></asp:Label></td>
             <td>: <asp:Label ID="tnok_telno" runat="server" ForeColor="Blue"></asp:Label></td>
            </tr>

            <tr>
        <td>
            <b><u>Local Doctor Details :</u></b><br/><hr/>
           </td> 
            <td></td>
            </tr>
            <tr>
            <td><asp:Label ID="Label12" runat="server" Text="Clinic Id"></asp:Label></td>
            <td>: <asp:Label ID="tclinicid" runat="server" ForeColor="Blue"></asp:Label></td>
             <td>: : <asp:Button ID="Button2" runat="server" Text="Get Details" onclick="Button2_Click"/></td>
             </tr>

         <tr>
         <td>Doctor Name</td>
         <td>: <asp:Label ID="lbldoctor_name" runat="server" Text="" BackColor="#99FF66"></asp:Label></td>
          </tr>

          <tr>
          <td>Clinic Address</td>
         <td>: <asp:Label ID="lblclinic_address" runat="server" Text="" BackColor="#99FF66"></asp:Label></td>
         </tr>

          <tr>
          <td>Tel No</td>
         <td>: <asp:Label ID="lbltel_no" runat="server" Text="" BackColor="#99FF66"></asp:Label></td>
         </tr>

         </table>
         
           
</td>
</tr>
</table>      
        

</asp:Content>

