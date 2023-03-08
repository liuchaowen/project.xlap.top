<!--#include file="inc_config.asp"-->
<!--#include file="inc_conn.asp"-->
<!--#include file="inc_siteinfo.asp"-->
<!--#include file="inc_Lang_Base.asp"-->
<!--#include file="style/style_all.asp"-->
<%

MaName = trim(Request.Form("MaName"))
MaPass = trim(Request.Form("MaPass"))
LoSiteid = trim(Request.Form("siteid"))
lOut = trim(Request("Out"))

if lOut<> "" then
  session.Contents(CFG_CacheName & "_SiteMaster_" & siteid) = false
  session.Contents(CFG_CacheName & "_sAdmin") = false
end if

if MaName <> "" then

  ' ===================================================================
  ' ·ÀÖ¹Í¬Ò»IP¶ñÒâ³¢ÊÔµÇÂ¼

  vIP			= Request.ServerVariables("Remote_Addr")

  LoginCacheName=CFG_CacheName & "_loginIP_" & Siteid
  if isempty(Application(LoginCacheName)) then Application(LoginCacheName)=""
  LoginsCacheName=CFG_CacheName & "_loginIPs_" & Siteid
  if isempty(Application(LoginsCacheName)) then Application(LoginsCacheName)=0

  if Application(LoginCacheName)=vIP then
    Application(LoginsCacheName)=Application(LoginsCacheName)+1
  else
    Application(LoginCacheName)=vIP
    Application(LoginsCacheName)=1
  end if
  
  if Application(LoginsCacheName) > 10 then Response.Redirect "help.asp?errid=6"

  ' ===================================================================

  if LoSiteid <> "" then
    if MaName=Site_MasterUname and MaPass=Site_MasterPassword then
      session.Contents(CFG_CacheName & "_SiteMaster_" & siteid) = true
      Application(LoginsCacheName)=0
      Response.Redirect "index.asp?siteid="& siteid
    else
      Response.Redirect "login.asp?error=1"
    end if
  else
    if MaName=CFG_sAdminName and MaPass=CFG_sAdminPass then
      session.Contents(CFG_CacheName & "_sAdmin") = true
      Application(LoginsCacheName)=0
      Response.Redirect "sAdmin_index.asp"
    else
      Response.Redirect "login.asp?error=1"
    end if
  end if

else

Response.Write replace(Style_Header,"$Title",Site_Name & "-" & Lang_Login)
Response.Write Style_Top
Response.Write replace(Style_Tips,"$Tips",Lang_Login_Tips)
Response.Write replace(Style_MainTop,"$MainName",Lang_Login)
%>
<table border="0" cellpadding="0" cellspacing="0" align="center">
<form action="login.asp"  method="post" target="_top">
<%if Request("error")<> "" then%>
  <tr><td colspan="2"><font color="red"><%=Lang_login_Err%></font></td></tr>
<%end if%>
  <tr><td><%=Lang_Login_ID%>:&nbsp; </td><td><input name="Siteid" size="5" value="<%=siteid%>" class="input"></td></tr>
  <tr><td><%=Lang_Login_UN%>:&nbsp; </td><td><input name="MaName" size="12" class="input"></td></tr>
  <tr><td><%=Lang_login_PW%>:&nbsp; </td><td><input name="MaPass" type="password" size="12" class="input"></td></tr>
  <tr><td colspan="2" height="30"><%=Lang_Login_submit%></td></tr>
</form>
</table>
<%
Response.Write Style_MainBottom
Response.Write Style_Bottom

end if
%>