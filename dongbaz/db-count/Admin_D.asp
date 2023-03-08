<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->
<!--#include file="inc_conn.asp"-->

<%
siteid = Request("siteid")
if siteid="" then siteid=CFG_DefaultSite

tTitle = Lang_Admin_Me & "-" & Lang_aDetail

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_Admin_Me)
Response.Write replace(Style_Tips,"$Tips",Lang_aDetail_Tips)

Response.Write replace(Style_MainTop,"$MainName",Lang_aDetail)

if Request("S_Name")<>"" then

	S_Name				= csqlstr(Trim(Request("S_Name")),50)
	S_Name_ENG			= csqlstr(Trim(Request("S_Name_ENG")),100)
	S_Content			= csqlstr(Trim(Request("S_Content")),255)
	S_Content_ENG		= csqlstr(Trim(Request("S_Content_ENG")),255)
	S_URL1				= csqlstr(Trim(Request("S_URL1")),150)
	S_URL2				= csqlstr(Trim(Request("S_URL2")),150)
	S_Oldip				= clng(trim(Request("S_Oldip")))
	S_Oldpv				= clng(trim(Request("S_Oldpv")))
	S_MasterName		= csqlstr(Trim(Request("S_MasterName")),50)
	S_MasterUname		= csqlstr(Trim(Request("S_MasterUname")),50)
	S_MasterPassword	= csqlstr(Trim(Request("S_MasterPassword")),50)
	S_MasterEmail		= csqlstr(Trim(Request("S_MasterEmail")),50)
	S_MasterTimeZone	= clng(Trim(Request("S_MasterTimeZone")))
	S_MasterLang		= csqlstr(Trim(Request("S_MasterLang")),10)
	
if S_Name="" or S_Name_ENG="" or S_Content="" or S_Content_ENG="" or S_MasterUname="" or S_MasterPassword="" then
  Response.Clear
  Response.Redirect "help.asp?errid=0&helpid=0"
end if

' Ð´ÈëÊý¾Ý¿â
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from site where site_id =" & siteid
rs.Open sql,conn,3,3

	rs("S_Name")			= S_Name
	rs("S_Name_ENG")		= S_Name_ENG
	rs("S_Content")			= S_Content
	rs("S_Content_ENG")		= S_Content_ENG
	rs("S_URL1")			= S_URL1
	rs("S_URL2")			= S_URL2
	rs("S_Style")			= S_Oldip & "," & S_Oldpv
	rs("S_MasterName")		= S_MasterName
	rs("S_MasterUname")		= S_MasterUname
	rs("S_MasterPassword")	= S_MasterPassword
	rs("S_MasterEmail")		= S_MasterEmail
	rs("S_MasterTimeZone")	= S_MasterTimeZone
	rs("S_MasterLang")		= S_MasterLang
	rs.Update
	strok = Lang_aDetail_ok

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

MLang = rsread("S_MasterLang")
select Case MLang
  case "CHS"
    Lang_aDetail_Langlist = replace(replace(replace(Lang_aDetail_Langlist,"$CHS","selected"),"$CHT",""),"$ENG","")
  case "CHT"
    Lang_aDetail_Langlist = replace(replace(replace(Lang_aDetail_Langlist,"$CHT","selected"),"$CHS",""),"$ENG","")
  case else
    Lang_aDetail_Langlist = replace(replace(replace(Lang_aDetail_Langlist,"$ENG","selected"),"$CHT",""),"$CHS","")
end select

SSS = split(rsread("S_Style"),",")
if ubound(SSS)=1 then
  S_Oldip=SSS(0):S_Oldpv=SSS(1)
else
  S_Oldip=0:S_Oldpv=0
end if

%>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="340">
  <form action="Admin_D.asp" method="post">
  <input name="siteid" type="hidden"  value="<%=siteid%>">
  <tr>
    <td class="fonts"><%=Lang_aDetail_Name%></td><td><input size="35" name="S_Name" class="input" value="<%=rsread("S_Name")%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_Name_Eng%></td><td><input size="35" name="S_Name_ENG" class="input" value="<%=rsread("S_Name_ENG")%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_Content%></td><td><TEXTAREA rows="5" cols="34" name="S_Content" class="input"><%=rsread("S_Content")%></TEXTAREA></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_Content_Eng%></td><td><TEXTAREA rows="5" cols="34" name="S_Content_ENG" class="input"><%=rsread("S_Content_ENG")%></TEXTAREA></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_URL1%></td><td><input size="35" name="S_URL1" class="input" value="<%=rsread("S_URL1")%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_URL2%></td><td><input size="35" name="S_URL2" class="input" value="<%=rsread("S_URL2")%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_old%></td><td><%=Lang_aDetail_oldip%><input size="5" name="S_Oldip" class="input" value="<%=S_Oldip%>"> <%=Lang_aDetail_oldpv%><input size="5" name="S_Oldpv" class="input" value="<%=S_Oldpv%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_MasterName%></td><td><input size="15" name="S_MasterName" class="input" value="<%=rsread("S_MasterName")%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_MasterUname%></td><td><input size="15" name="S_MasterUname" class="input" value="<%=rsread("S_MasterUname")%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_MasterUpass%></td><td><input size="15" name="S_MasterPassword" class="input" value="<%=rsread("S_MasterPassword")%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_MasterEmail%></td><td><input size="25" name="S_MasterEmail" class="input" value="<%=rsread("S_MasterEmail")%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_MasterTZone%></td><td><input size="5" name="S_MasterTimeZone" class="input" value="<%=rsread("S_MasterTimeZone")%>"></td>
  </tr>
  <tr>
    <td class="fonts"><%=Lang_aDetail_MasterLang%></td><td><SELECT name="S_MasterLang" class="input"><%=Lang_aDetail_Langlist%></SELECT></td>
  </tr>

  <tr>
    <td><br><%=Lang_Admin_submit%></td><td>&nbsp;</td>
  </tr>
  </form>
</table>

<%
end if

Response.Write Style_MainBottom
Response.Write Style_Bottom

function csqlstr(inst,lenstr)
  'csqlstr=replace(instr,"'","''")
  csqlstr=left(inst,lenstr)
end function
%>