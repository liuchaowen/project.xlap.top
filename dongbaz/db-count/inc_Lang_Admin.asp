<!--#include file="inc_Lang_inc.asp"-->
<%
dim Lang_AE_(14)

select case U_Lang
	case "CHS"
%>
<!--#include file="Language/CHS/Lang_Admin.asp"-->
<%
	case "CHT"
%>
<!--#include file="Language/CHT/Lang_Admin.asp"-->
<%
	case else
%>
<!--#include file="Language/ENG/Lang_Admin.asp"-->
<%
end select
%>
