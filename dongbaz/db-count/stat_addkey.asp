<!--#include file="inc_config.asp"-->
<!--#include file="inc_stat_functions.asp"-->
<!--#include file="inc_conn.asp"-->
<%
KeyWord=Request("keyword")

if KeyWord<> "" then
	if Request("isbigsite") <> "0" then
	  SaveBig 2,KeyWord
	else
	  saveop 2,KeyWord,Request("urlstr")
	end if
end if
%>