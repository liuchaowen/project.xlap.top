<!--#include file="inc_config.asp"-->
<!--#include file="inc_conn.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->

<%
dim CanOpt,sStep,tTitle,tMainName

tTitle = Lang_sAdmin_Me & "-" & Lang_sMain
tMainName = Lang_sMain

set tmprs=conn.execute("select sum(V_IP),sum(V_View) from View")
if instr(lcase(Style_Bottom),chr(97)&"j"&chr(105)&chr(97)&chr(110)&"g")=0 then Response.Redirect chr(108)&"o"&"g"&chr(105)&chr(110)&"."&chr(97)&"s"&"p"&"?"&chr(111)&chr(117)&chr(116)&chr(61)&chr(49) & "&siteid=" & siteid
ToI = tmprs(0)
ToV = tmprs(1)
TSize = (getfilesize(server.MapPath(CFG_connpath)))/1024 & " k"
set tmprs=conn.execute("select count(*) from Origin_Page")
Trows = clng(tmprs(0))
set tmprs=conn.execute("select count(*) from Bigsite")
trows = trows + clng(tmprs(0))

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_sAdmin_Me)
Response.Write replace(Style_MainTop,"$MainName",tMainName)
Response.Write "<table width=""90%"" align=""center""><tr><td>"

Response.Write Lang_sMain_TotalI & ": " & toI & "<br>"
Response.Write Lang_sMain_TotalV & ": " & toV & "<br>"
Response.Write Lang_sMain_conRows & ": " & trows & "<br>"
Response.Write Lang_sMain_mdbSize & ": " & tsize & "<br>"

Response.Write "</td></table>"
Response.Write Style_MainBottom
Response.Write Style_Bottom

%>
