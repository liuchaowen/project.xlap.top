<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->
<!--#include file="inc_conn.asp"-->

<%
siteid = Request("siteid")

if siteid="" then siteid=CFG_DefaultSite

tTitle = Lang_sAdmin_Me & "-" & Lang_Edit

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_sAdmin_Me)
Response.Write replace(Style_Tips,"$Tips",Lang_Add_Tips)

Response.Write replace(Style_MainTop,"$MainName",Lang_Edit)

if Request("SIPS")<>"" then

BS			= Trim(Request("BS"))
SIPS		= clng(Trim(Request("SIPS")))
StatCan		= replace(Trim(Request("StatCan"))," ","")

if BS="" then BS=0
if SIPS<20 then SIPS=20
if SIPS>800 then SIPS=800

' Ð´ÈëÊý¾Ý¿â
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from site where site_id =" & siteid
rs.Open sql,conn,3,3

if Request("DELok")="YES" then
	rs.Delete 
	conn.execute ("delete * from BigSite where site_id=" & siteid)
	conn.execute ("delete * from Client where site_id=" & siteid)
	conn.execute ("delete * from Origin_Page where site_id=" & siteid)
	conn.execute ("delete * from Online where site_id=" & siteid)
	conn.execute ("delete * from View where site_id=" & siteid)
	strok = Lang_Edit_Del_ok
else

	rs("S_BigSite")	= BS
	rs("S_KillRefresh")	= SIPS
	rs("S_Can") = StatCan
	rs.Update
	strok = Lang_Edit_ok

end if

rs.close

set rs=nothing


%>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="340">
<tr><td><%=strok%></td></tr>
</table>

<%

else

set rsread=conn.execute("select * from Site where site_id=" & siteid)
if rsread.eof then Response.Redirect "sAdmin_Sitelist.asp"
%>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="340">
  <form action="sAdmin_SiteEdit.asp" method="post">
  <input name="siteid" type="hidden"  value="<%=siteid%>">
  <tr>
    <td>
      <br><%=Lang_Edit_info & ": " & rsread("site_id") & "-" & rsread("S_Name") & "/" & rsread("S_Name_ENG")%>
      <br><br><font class="fonts"><%=Lang_Add_Option%></font>
      <br><br>
      <table>
        <tr><td><%=Lang_Add_Mode%> </td><td><INPUT type="radio" name="BS" value="0" <%if rsread("S_BigSite") = 0 then Response.Write "checked"%>><%=Lang_Add_N%><br><INPUT type="radio" name="BS" value="1"  <%if rsread("S_BigSite") > 0 then Response.Write "checked"%>><%=Lang_Add_B%></td></tr>
        <tr><td><%=Lang_Add_SaveIPs%> </td><td><input name="SIPS" size="5" class="input" value="<%=rsread("S_Killrefresh")%>"></td></tr>
      </table>
      <br>
      <table align="center">
        <tr class="fonts"><td><%=Lang_AE_Item%></td><td><%=Lang_AE_Can%></td></tr>
        <tr><td colspan="2"><hr class="fonts" size="1"></td></tr>
<%
cancan = "," & rsread("S_Can") & ","

for i = 0 to ubound(Lang_AE_)
  Response.Write "<tr><td>"& i & ". " &Lang_AE_(i)&"</td><td align=""center""><input name=""StatCan"" value="""&i&""" type=""checkbox"""
  if instr(cancan,"," & i & ",") then Response.Write " checked"
  Response.Write "></td></tr>" & vbcrlf
next
%>
      </table>
      <br><br><font class="fonts"><%=Lang_Edit_Del%></font>
      <br><br><%=Lang_Edit_Del_Ask%>
      <br><input name="DELok" size="5">
      <br><br><%=Lang_Edit_submit%>
    </td>
  </tr>
  </form>
</table>

<%
end if

Response.Write Style_MainBottom

Response.Write Style_Bottom
%>