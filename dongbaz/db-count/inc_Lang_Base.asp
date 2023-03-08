<!--#include file="inc_Lang_inc.asp"-->
<%
dim Lang_Item_Client(8)
dim Lang_Item_OP(4)
dim Lang_OP_Tips(4)
dim Lang_OP(4)
dim Lang_BigSite(4)
dim Lang_sc_engine(16,1)
dim Lang_Help_Q(7)
dim Lang_Help_A(7)
dim Lang_Help_Err(6)

select case U_Lang
	case "CHS"
%>
<!--#include file="Language/CHS/Lang_Base.asp"-->
<%
	case "CHT"
%>
<!--#include file="Language/CHT/Lang_Base.asp"-->
<%
	case else
%>
<!--#include file="Language/ENG/Lang_Base.asp"-->
<%
end select
%>
