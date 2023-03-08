<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->
<!--#include file="inc_conn.asp"-->

<%
siteid = Request("siteid")
if siteid="" then siteid=CFG_DefaultSite

theurl	= "http://" & Request.ServerVariables("http_host") & finddir(Request.ServerVariables("url"))

tTitle = Lang_Admin_Me & "-" & Lang_Clear

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_Admin_Me)
Response.Write replace(Style_Tips,"$Tips",Lang_S_Tips)

Response.Write replace(Style_MainTop,"$MainName",Lang_Clear)
Response.Write "<table width=""90%"" align=""center""><tr><td>"

if Request("ok")="" then
  Response.Write Lang_Clear_0
  Response.Write Lang_Clear_1
else
  conn.execute "delete * from Bigsite where site_id=" & siteid
  Response.Write Lang_Clear_2
end if

Response.Write "</td></tr></table>"
Response.Write Style_MainBottom

Response.Write Style_Bottom

Function finddir(filepath)
	finddir=left(filepath,instrRev(filepath,"/"))
end Function

%>