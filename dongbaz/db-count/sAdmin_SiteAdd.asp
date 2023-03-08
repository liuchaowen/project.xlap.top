<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->
<!--#include file="inc_conn.asp"-->

<%

tTitle = Lang_sAdmin_Me & "-" & Lang_Add

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_sAdmin_Me)
Response.Write replace(Style_Tips,"$Tips",Lang_Add_Tips)

Response.Write replace(Style_MainTop,"$MainName",Lang_Add)

if Request("SiteName")<>"" then

SiteName	= Trim(Request("SiteName"))
EngName		= Trim(Request("EngName"))
SiteURL		= Trim(Request("SiteURL"))
MaName		= Trim(Request("MaName"))
MaTZ		= Trim(Request("MaTZ"))
MaLang		= Trim(Request("MaLang"))
BS			= Trim(Request("BS"))
SIPS		= clng(Trim(Request("SIPS")))
StatCan		= replace(Trim(Request("StatCan"))," ","")

if BS="" then BS=0
if MaTZ="" then MaTZ=CFG_ZoneServer
if maLang="" then malang="ENG"
if SIPS<20 then SIPS=20
if SIPS>300 then SIPS=300

' Ð´ÈëÊý¾Ý¿â
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from site where (site_id is null)"
rs.Open sql,conn,3,3

rs.AddNew 
rs("S_Name")	= SiteName
rs("S_Name_ENG")	= EngName
rs("S_URL1")	= SiteURL
rs("S_MasterName")	= MaName
rs("S_MasterTimeZone")	= MaTZ
rs("S_MasterLang")	= MaLang
rs("S_BigSite")	= BS
rs("S_KillRefresh")	= SIPS
rs("S_MasterUname") = "admin"
rs("S_MasterPassword") = "admin"
rs("S_Can") = StatCan

rs.Update
rs.close
set rs=nothing

set rs=conn.execute("select max(site_id) from site")

%>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="400">
<tr><td><%=replace(Lang_Add_ok,"$ID",rs(0))%></td></tr>
</table>

<%

else

%>
<table align="center" border="0" cellpadding="0" cellspacing="0">
  <form action="sAdmin_SiteAdd.asp" method="post">
  <tr>
    <td>
      <br><font class="fonts"><%=Lang_Add_Base%></font>
      <br><br>
      <table>
        <tr><td><%=Lang_Add_SiteName%>: </td><td><input name="SiteName" size="20" class="input"></td></tr>
        <tr><td><%=Lang_Add_EngName%>: </td><td><input name="EngName" size="20" class="input"></td></tr>
        <tr><td><%=Lang_Add_SiteURL1%>: </td><td><input name="SiteURL" size="40" class="input"></td></tr>
        <tr><td><%=Lang_Add_MaName%>: </td><td><input name="MaName" size="12" class="input">
        &nbsp;<%=Lang_Add_MaTimeZone%>: <input name="MaTZ" size="5" class="input">
        &nbsp;<%=Lang_Add_MaLang%>: <SELECT name="MaLang" class="input"><%=Lang_Add_LangList%></SELECT></td></tr>
      </table>
      <br><br><font class="fonts"><%=Lang_Add_Option%></font>
      <br><br>
      <table>
        <tr><td><%=Lang_Add_Mode%> </td><td><INPUT type="radio" name="BS" value="0" checked><%=Lang_Add_N%><br><INPUT type="radio" name="BS" value="1"><%=Lang_Add_B%></td></tr>
        <tr><td><%=Lang_Add_SaveIPs%> </td><td><input name="SIPS" value="50" size="5" class="input"></td></tr>
      </table>
      <br>
      <table align="center">
        <tr class="fonts"><td><%=Lang_AE_Item%></td><td><%=Lang_AE_Can%></td></tr>
        <tr><td colspan="2"><hr class="fonts" size="1"></td></tr>
<%
for i = 0 to ubound(Lang_AE_)
  Response.Write "<tr><td>"& i & ". " &Lang_AE_(i)&"</td><td align=""center""><input name=""StatCan"" value="""&i&""" type=""checkbox"""
  if i<6 or i>8 then Response.Write " checked"
  Response.Write "></td></tr>" & vbcrlf
next
%>
      </table>
      <br><br><%=Lang_Add_submit%>
    </td>
  </tr>
  </form>
</table>
<%
end if

Response.Write Style_MainBottom

Response.Write Style_Bottom
%>