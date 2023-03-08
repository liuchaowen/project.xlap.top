<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->
<!--#include file="inc_conn.asp"-->

<%
siteid = Request("siteid")
if siteid="" then siteid=CFG_DefaultSite

tTitle = Lang_Admin_Me & "-" & Lang_aOption

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_Admin_Me)
Response.Write replace(Style_Tips,"$Tips",Lang_aOption_Tips)

Response.Write replace(Style_MainTop,"$MainName",Lang_aOption)

if Request("SaveNum")<>"" then

SaveNum		= clng(Trim(Request("SaveNum")))
CanGuest	= clng(Trim(Request("CanGuest")))
S_Gra		= Request("GRAH") & Request("GRAT") & Request("GRAZ")

if SaveNum>100 then SaveNum=100
if CanGuest>2 then CanGuest=2
if CanGuest<0 then CanGuest=0

if S_Gra="" then S_Gra="DT"

' Ð´ÈëÊý¾Ý¿â
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from site where site_id =" & siteid
rs.Open sql,conn,3,3

	rs("S_SaveNum")	= SaveNum
	rs("S_Canguest") = Canguest
	rs("S_Gra") = S_Gra
	rs.Update
	strok = Lang_aOption_ok

rs.close

set rs=nothing


%>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="340">
<tr><td><%=strok%></td></tr>
</table>

<%

else

set rsread=conn.execute("select * from Site where site_id=" & siteid)
if rsread.eof then Response.Redirect "help.asp"

GRAS=rsread("S_Gra")
%>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="340">
  <form action="Admin_O.asp" method="post">
  <input name="siteid" type="hidden"  value="<%=siteid%>">
  <tr>
    <td class="fonts"><%=Lang_aOption_SaveNum%></td><td><input size="5" name="SaveNum" class="input" value="<%=rsread("S_SaveNum")%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aOption_Canguest%></td><td>&nbsp;</td>
  </tr>
  <tr>
	<td colspan="2"><p style="line-height: 120%; margin-left: 18; margin-right: 0; margin-top: 0; margin-bottom: 9">
	<INPUT type="radio" name="CanGuest" value="0" <%if rsread("S_CanGuest")=0 then Response.Write "checked"%>> <%=Lang_aOption_Can_0%>&nbsp;
	<INPUT type="radio" name="CanGuest" value="1" <%if rsread("S_CanGuest")=1 then Response.Write "checked"%>> <%=Lang_aOption_Can_1%>&nbsp;
	<INPUT type="radio" name="CanGuest" value="2" <%if rsread("S_CanGuest")=2 then Response.Write "checked"%>> <%=Lang_aOption_Can_2%>
	</p></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aOption_GRA%></td><td>&nbsp;</td>
  </tr>
  <tr>
	<td colspan="2">
	<table align="center">
	  <tr>
	    <td><%=Lang_aOption_GRA_H%></td>
	    <td width="100">
	      <INPUT type="radio" name="GRAH" value="D" <%if instr(gras,"D") then Response.Write "checked"%>> <%=Lang_aOption_GRA_D%><br>
	      <INPUT type="radio" name="GRAH" value="B" <%if instr(gras,"B") then Response.Write "checked"%>> <%=Lang_aOption_GRA_B%><br>
	      <INPUT type="radio" name="GRAH" value="IV" <%if instr(gras,"IV") then Response.Write "checked"%>> <%=Lang_aOption_GRA_IV%>
	    </td>
	    <td rowspan="2"><%=Lang_aOption_GRA_Z%></td>
	    <td width="100" rowspan="2">
	      <INPUT type="radio" name="GRAZ" value="d" <%if instr(gras,"d") then Response.Write "checked"%>> <%=Lang_aOption_GRA_D%><br>
	      <INPUT type="radio" name="GRAZ" value="b" <%if instr(gras,"b") then Response.Write "checked"%>> <%=Lang_aOption_GRA_B%><br>
	      <INPUT type="radio" name="GRAZ" value="iv" <%if instr(gras,"iv") then Response.Write "checked"%>> <%=Lang_aOption_GRA_IV%><br>
	      <INPUT type="radio" name="GRAZ" value="" <%if (instr(gras,"d")=0) and (instr(gras,"b")=0) and (instr(gras,"iv")=0) then Response.Write "checked"%>> <%=Lang_aOption_GRA_No%>
	    </td>
	  </tr>
	  <tr>
	    <td><%=Lang_aOption_GRA_T%></td>
	    <td>
	      <INPUT type="checkbox" name="GRAT" value="T" <%if instr(gras,"T") then Response.Write "checked"%>> <%=Lang_aOption_GRA_T%><br>
	    </td>
	  </tr>
	</table>
	</td>
  </tr>
  <tr>
    <td><br><%=Lang_Admin_submit%></td><td>&nbsp;</td>
  </tr>
  </form>
</table>

<%
Response.Write Style_MainBottom
Response.Write replace(Style_MainTop,"$MainName",Lang_aOption_GRA_Model)
%>
<table align="center">
  <tr>
    <td align="center" width="170"><img border="1" style="border-color:red" src="style/images/gra_D.gif"><br><%=Lang_aOption_GRA_D & "," & Lang_aOption_GRA_H%></td>
    <td align="center" width="170" rowspan="2"><img border="1" style="border-color:red" src="style/images/gra_IV.gif"><br><%=Lang_aOption_GRA_IV & "," & Lang_aOption_GRA_H%></td>
  </tr>
  <tr>
    <td align="center" width="170"><img border="1" style="border-color:red" src="style/images/gra_B.gif"><br><%=Lang_aOption_GRA_B & "," & Lang_aOption_GRA_H%></td>
  </tr>
  <tr>
    <td align="center" colspan="2"><img border="1" style="border-color:red" src="style/images/gra_sIV.gif"><br><%=Lang_aOption_GRA_IV & "," & Lang_aOption_GRA_Z%></td>
  </tr>
  <tr>
    <td align="center" width="170"><img border="1" style="border-color:red" src="style/images/gra_sd.gif"><br><%=Lang_aOption_GRA_D & "," & Lang_aOption_GRA_Z%></td>
    <td align="center" width="170"><img border="1" style="border-color:red" src="style/images/gra_sb.gif"><br><%=Lang_aOption_GRA_B & "," & Lang_aOption_GRA_Z%></td>
  </tr>
</table>
<%
end if

Response.Write Style_MainBottom

Response.Write Style_Bottom
%>