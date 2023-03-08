<!--#include file="inc_Lang_inc.asp"-->
<%

select case U_Lang
	case "CHS"
%>
<!--#include file="Language/CHS/Lang_FunctionLang.asp"-->
<%
	case "CHT"
%>
<!--#include file="Language/CHT/Lang_FunctionLang.asp"-->
<%
	case else
%>
<!--#include file="Language/ENG/Lang_FunctionLang.asp"-->
<%
end select

function cLang(Langj)
  select case U_Lang
	case "CHS"
	  clang=clangchs(langj)
	case "CHT"
	  clang=clangcht(langj)
	case else
	  clang=clangeng(langj)
  end select
end function

function cClient(strcj,tClient)
  select case U_Lang
	case "CHS"
	  cClient=cClientchs(strcj,tClient)
	case "CHT"
	  cClient=cClientcht(strcj,tClient)
	case else
	  cClient=cClienteng(strcj,tClient)
  end select
end function
%>
