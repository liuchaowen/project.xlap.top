<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->

<%

tTitle = Lang_sAdmin_Me & "-" & Lang_OnOff
tMainName = Lang_OnOff

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_sAdmin_Me)
Response.Write replace(Style_MainTop,"$MainName",tMainName)
Response.Write "<table width=""90%"" align=""center""><tr><td>"


if IsObj(CFG_StrFSO) then
  OnOff=Request("OO")
  select case OnOff
  case "1"
	writetxtfile server.MapPath("inc_config_iscan.asp"),"<" & "%CFG_IsCan = true%" & ">"
	if readtxtfile(server.MapPath("inc_config_iscan.asp"))="<" & "%CFG_IsCan = true%" & ">" then
		Response.Write Lang_OnOff_OnOk & "<br>" & Lang_OnOff_On
	else
		Response.Write Lang_OnOff_Err
	end if
  case "0"
	writetxtfile server.MapPath("inc_config_iscan.asp"),"<" & "%CFG_IsCan = false%" & ">"
	if readtxtfile(server.MapPath("inc_config_iscan.asp"))="<" & "%CFG_IsCan = false%" & ">" then
		Response.Write Lang_OnOff_OffOk & "<br>" & Lang_OnOff_Off
	else
		Response.Write Lang_OnOff_Err
	end if
  case else
    if CFG_isCan then
		Response.Write Lang_OnOff_On & "<br>[<a href = ""sAdmin_OnOff.asp?OO=0"">" & Lang_OnOff_TurnOff & "</a>]"
	else
		Response.Write Lang_OnOff_Off & "<br>[<a href = ""sAdmin_OnOff.asp?OO=1"">" & Lang_OnOff_TurnOn & "</a>]"
	end if
  end select
else
    if CFG_isCan then
		Response.Write Lang_OnOff_On & "<br><br>"
	else
		Response.Write Lang_OnOff_Off & "<br><br>"
	end if
	Response.Write Lang_OnOff_NoFSO
end if


Response.Write "</td></tr></table>"
Response.Write Style_MainBottom
Response.Write Style_Bottom
%>