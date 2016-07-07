<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view_records.aspx.cs" Inherits="view_records" %>

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
 <td style=" width:20%; ">
 </td>
 
 <td style=" width:45%; ">
           <table>
           <tr>
           <td style=" width:80%; "><b><u>Available Drugs Record :</u></b><br/> It is the complete information of all the 
           drugs/medicines available in the Hospital Today. </td>
           <td style=" width:20%; ">
            <script type="text/javascript">
<!--
            function MM_openBrWindow(theURL, winName, features) { //v2.0
                                window.open(theURL, winName, features);
                            }
//-->
            </script> 
             <a href="records/drug_record.aspx" onclick="MM_openBrWindow('records/drug_record.aspx','google','scrollbars=yes,width=800,height=650'); return false;">View Record</a>
           
           </td>
           
           </tr>

            <tr>
           <td><b><u>Ward Details :</u></b> Wards are an undetachable part of Hospitals. Wards are ment 
            on patient basis like X-ray, Children etc. Here Staff is allocated on weekly basis and changed 
            after every week. To keep track on this and maintaning the ward information this sction is ment.
            </td>
           <td>
            <script type="text/javascript">
<!--
                function MM_openBrWindow(theURL, winName, features) { //v2.0
                    window.open(theURL, winName, features);
                }
//-->
            </script> 
             <a href="ward_details.aspx" onclick="MM_openBrWindow('ward_details.aspx','google','scrollbars=yes,width=800,height=650'); return false;">View Record</a>
           
           </td>
           </tr>

            <tr>
           <td><b><u>Staff Details :</u></b><br/>There are many employees or medical attendents in the 
           Hospital like Specilist doctor, Doctors, Nurses, Helpers etc And we need to keep track of 
           their details like personel details, qualification details, work experience and current 
           status in hospital. </td>
           <td>
            <script type="text/javascript">
<!--
                function MM_openBrWindow(theURL, winName, features) { //v2.0
                    window.open(theURL, winName, features);
                }
//-->
            </script> 
             <a href="records/staff_record.aspx" onclick="MM_openBrWindow('records/staff_record.aspx','google','scrollbars=yes,width=800,height=650'); return false;">View Record</a>
           
           </td>
           </tr>

            <tr>
           <td><b><u>Patient Details :</u></b><br/>There are many patients in the Hospital 
           And we need to keep track of their details like personel details, Next Of Kin details,
           Ward Allocated and current medication status in hospital. </td>
           <td>
            <script type="text/javascript">
<!--
                function MM_openBrWindow(theURL, winName, features) { //v2.0
                    window.open(theURL, winName, features);
                }
//-->
            </script> 
             <a href="records/patient_record.aspx" onclick="MM_openBrWindow('records/patient_record.aspx','google','scrollbars=yes,width=800,height=650'); return false;">View Record</a>
           
           </td>
           </tr>

           </table>

</td>
<td style=" width:35%; ">
          
</td>
</tr>
</table>

</asp:Content>

