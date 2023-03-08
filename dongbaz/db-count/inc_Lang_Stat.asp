<!--#include file="inc_Lang_inc.asp"-->
<%
select case U_Lang
	case "CHS"
%>
<!--#include file="Language/CHS/Lang_Stat.asp"-->
<%
	case "CHT"
%>
<!--#include file="Language/CHT/Lang_Stat.asp"-->
<%
	case else
%>
<!--#include file="Language/ENG/Lang_Stat.asp"-->
<%
end select

%>
