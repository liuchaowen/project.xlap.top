<!--#include file="inc_config.asp"-->
<!--#include file="inc_conn.asp"-->
<!--#include file="inc_siteinfo.asp"-->
<!--#include file="inc_Lang_Base.asp"-->
<!--#include file="style/style_all.asp"-->
<%

Response.Write replace(Style_Header,"$Title",Site_Name & "-" & Lang_Helps)
Response.Write Style_Top

if Request("errid")<>"" then
  Response.Write replace(Style_MainTop,"$MainName",Lang_Help_Error)
%>
<table border="0" cellpadding="0" cellspacing="0" align="center" width="420">
  <tr>
    <td><font color="red"><%=Lang_Help_Err(clng(Request("errid")))%></font></td>
  </tr>
</table>
<%
  Response.Write Style_MainBottom
end if

Response.Write replace(Style_MainTop,"$MainName",Lang_Helps)
%>
<table border="0" cellpadding="0" cellspacing="0" align="center" width="420">
<%
if Request("helpid") <> "" then
%>
  <tr>
    <td height="24"><font class="fonts"><%=Lang_Help_Q(clng(Request("helpid")))%>:</font></td>
  </tr>
  <tr>
    <td><%=Lang_Help_A(clng(Request("helpid")))%>:</td>
  </tr>
<%
else
  Response.Write "<tr><td><ul>"
  for i=0 to ubound(Lang_Help_Q)
%>
  <li><a href="help.asp?helpid=<%=i%>"><%=Lang_Help_Q(i)%></a>
<%
  next
  Response.Write "</ul></td></tr>"
end if
%>
  <tr>
    <td align="right">[<a href="help.asp"><%=Lang_Help_List%></a>] &nbsp; <%=Lang_Help_Go%>:<font style="font-size:16px">&nbsp;</font></td>
  </tr>
</table>
<%
Response.Write Style_MainBottom

if isSM=false then
Response.Write replace(Style_MainTop,"$MainName",Lang_Login)
%>
<table border="0" cellpadding="0" cellspacing="0" align="center">
<form action="login.asp"  method="post" target="_top" id=form1 name=form1>
  <tr><td>
  <%if isM then%><input type="hidden" name="siteid" value=""><%else%><%=Lang_Login_ID%>:<input name="Siteid" size="3" value="<%=siteid%>" class="input">&nbsp;<%end if%>
  <%=Lang_Login_UN%>:</td><td><input name="MaName" size="10" class="input">&nbsp;
  <%=Lang_login_PW%>:</td><td><input name="MaPass" type="password" size="10" class="input">&nbsp;
  </td><td colspan="3" height="30"><%=Lang_Login_submit%></td></tr>
</form>
</table>
<%
Response.Write Style_MainBottom
end if

Response.Write Style_Bottom
%>