<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="drug_record_notused.aspx.cs" Inherits="records_drug_record" %>

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
         <!--#include file="../left_sidebar.aspx"-->
     s
 <td style=" width:80%; ">
           <b><u>Search Drug Form:</u></b> <br /><br />

           
           <table style=" width:80%; ">
                
                <tr>
                <td>
        Drug Name :  
        </td>
                <td>
                     <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td>
        <asp:Button ID="btnsearch" runat="server" Text="Search" 
            onclick="btnsearch_Click" />        
            </td>
                </tr>

                
               </table>

 </td>
 </tr>
 </table>      

</asp:Content>

