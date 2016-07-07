<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="welcome.aspx.cs" Inherits="welcome" %>

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
<div class="style1">
<table >
<tr>
<td style=" width:25%;">
<center><b><u>WARDS</u></b><br/>
<a href="ward_registration.aspx"><img src="ward.jpg" height="150px" width="150px" alt="WARD"></img></center></a><br/>

</td>

<td style=" width:50%;">
<center><b><u>
The Wellmeadows Hospital Case Study<br/><br/></u>
This case study describes a small hospital called Wellmeadows, which is located in<br/>
Edinburgh. The Wellmeadows Hospital specializes in the provision of health care for<br/>
elderly people. Listed features is a description of the data recorded, maintained, and<br/>
accessed <i style="color: #0000FF">by the hospital staff </i>to support the management and day-to-day operations of the<br/>
Wellmeadows Hospital.<br/>

</b></center>
</td>

<td style=" width:25%;">
<center><b><u>STAFF</u></b><br/>
<a href="staff_new.aspx"><img src="staff.jpg" height="150px" width="150px" alt="STAFF"></img></a></center><br/>

</td>

</tr>
<tr>
<td style=" width:25%;">
<center><b><u>PATIENT</u></b><br/>
<a href="patient_registration.aspx"><img src="patient.jpg" height="150px" width="150px" alt="patient"></img></a></center><br/>

</td>

<td style=" width:50%;">
<center><font color="green"><b><u><a href="view_records.aspx">View Records </u></b></font>
<br/>
<img src="Records.jpg" height="150px" width="200px" alt="record"/></a></center>
</td>

<td style=" width:25%;">
<center><b><u>MEDICINES</u></b><br/>
<a href="drug.aspx"><img src="medicine.jpg" height="150px" width="150px" alt="MEDICINE"></img></a></center><br/>

</td>

</tr></table>

</div>
</asp:Content>

