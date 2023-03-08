<!--#include file="inc_check.asp"-->
<%
U_TZone	= Request("TZone")
if U_TZone="" then
	U_TZone=Request.Cookies("AJSTAT")("TimeZone")
	if U_TZone="" or isempty(U_TZone) or isnull(U_TZone) then U_TZone = Site_MasterTimeZone
else
	Response.Cookies("AJSTAT")("TimeZone")= U_TZone
	Response.Cookies("AJSTAT").Expires=dateadd("d",100,date() )
end if

U_Lang	= Request("Lang")
if U_Lang="" then
	U_Lang = Request.Cookies("AJSTAT")("Language")
	if U_Lang= "" or isempty(U_Lang) or isnull(U_Lang) then
		vLang = Request.ServerVariables("HTTP_ACCEPT_LANGUAGE")
		vLang = split(vLang,",")(0)
		vLang = split(vLang,";")(0)

		select case trim(LCASE(vLang))
			case "zh-cn"
				U_Lang="CHS"
			case "zh-tw"
				U_Lang="CHT"
			case "zh-hk"
				U_Lang="CHT"
			case "zh"
				U_Lang="CHT"
			case else
				U_Lang="ENG"
		end select
	end if
else
	Response.Cookies("AJSTAT")("Language")= U_Lang
	Response.Cookies("AJSTAT").Expires=dateadd("d",100,date() )
end if

U_Lang=UCase(U_Lang)

if U_Lang <> Site_MasterLang then
	Site_Name = Site_Name_ENG
	Site_Content = Site_Content_ENG
end if
%>