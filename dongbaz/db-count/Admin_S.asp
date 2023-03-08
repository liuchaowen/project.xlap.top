<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->

<%
siteid = Request("siteid")
if siteid="" then siteid=CFG_DefaultSite

theurl	= "http://" & Request.ServerVariables("http_host") & finddir(Request.ServerVariables("url"))

tTitle = Lang_Admin_Me & "-" & Lang_S

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_Admin_Me)
Response.Write replace(Style_Tips,"$Tips",Lang_S_Tips)

Response.Write replace(Style_MainTop,"$MainName",Lang_S)
%>
<table width="400" align="center">
  <form action="Admin_S.asp" method="post">
  <input type="hidden" name="siteid" value="<%=siteid%>">
  <tr>
    <td>
	  <font class="fonts"><%=Lang_S_Stat%></font><br><br>
      <%=Lang_S_Stat_C%><br>
      <center><TEXTAREA class="input" rows="4" cols="50">
<%
      Response.Write "<s"& "c" & "r" & "i" & "pt src="""&theurl&"mystat.asp"
      'if siteid<>CFG_DefaultSite then 
      Response.Write "?siteid="&siteid
      Response.Write """></sc" & "ri" &"pt>"
%></TEXTAREA></center>
      <br>
      <font class="fonts"><%=Lang_S_Show%></font><br><br>
      <%=Lang_S_Show_C%><br>
<%
if Request("s_style") = "" then
%>
      <br>
      [<%=Lang_S_Show_Nok%>]<br>
      <br><b><%=Lang_S_S_1%></b> 
      <br><font class="fonts"><%=Lang_S_S_1_0%></font> [<a href="help.asp?helpid=5&siteid=<%=siteid%>" target="_blank" class="a1"><%=Lang_Help%></a>]
      <br><INPUT type="radio" name="s_style" value="text"> <%=Lang_S_S_1_1%>
      <br><INPUT type="radio" name="s_style" value="$p_total"> <%=Lang_S_S_1_2%>
      <br><INPUT type="radio" name="s_style" value="longtext"> <%=Lang_S_S_1_3%>
      <br><INPUT type="radio" name="s_style" value="linktext"> <%=Lang_S_S_1_4%>
      <br><INPUT type="radio" name="s_style" value="icon"> <%=Lang_S_S_1_5%>
      <br><INPUT type="radio" name="s_style" value="logo" checked> <%=Lang_S_S_1_6%>
      <br>
      <br><font class="fonts"><%=Lang_S_S_2_0%></font> <%=Lang_S_S_2_1%> [<a href="help.asp?helpid=5&siteid=<%=siteid%>" target="_blank" class="a1"><%=Lang_Help%></a>]
      <br><TEXTAREA rows="6" cols="60" name="s_zdy" class="input"></TEXTAREA>
      <br>
      <br><b><%=Lang_S_S_3_0%></b>
      <table>
      <tr><td><%=Lang_S_S_3_1%></td><td><input name="s_imgpath" size="40" class="input"></td></tr>
      <tr><td><%=Lang_S_S_3_2%></td><td><input name="s_bordercolor" size="12" class="input"></td></tr>
      <tr><td><%=Lang_S_S_3_3%></td><td><input name="s_bordersize" size="12" class="input"> <%=Lang_S_S_3_3_2%></td></tr>
      <tr><td><%=Lang_S_S_3_4%></td><td><input name="s_numlong" size="12" class="input"> <%=Lang_S_S_3_4_2%></td></tr>
      </table>
      <br><a href='javascript:document.forms[0].submit();'><%=Lang_S_S_4%></a> <input type="submit" name="cp" class="backc2" value=" "> &nbsp;</td><td>&nbsp;
<%
else
	s_style = Request("s_style")
	s_zdy = trim(Request("s_zdy"))
	s_imgpath = trim(Request("s_imgpath"))
	s_bordercolor = trim(Request("s_bordercolor"))
	s_bordersize = trim(Request("s_bordersize"))
	s_numlong = trim(Request("s_numlong"))
	
	if s_zdy <> "" then s_style=s_zdy
%>
      <center><TEXTAREA class="input" rows="4" cols="50" id=textarea1 name=textarea1>
<%
      Response.Write "<s"& "c" & "r" & "i" & "pt src="""&theurl&"show.asp?siteid="&siteid & "&style="
      Response.Write server.URLEncode (s_style &"|aj|"& s_numlong &"|aj|"&s_imgpath&"|aj|"&s_bordercolor&"|aj|"&s_bordersize)
      Response.Write """></sc" & "ri" &"pt>"
%>
</TEXTAREA></center>
<%
end if
%>
    </td>
  </tr>
  </form>
</table>
<%
Response.Write Style_MainBottom

Response.Write Style_Bottom

Function finddir(filepath)
	finddir=left(filepath,instrRev(filepath,"/"))
end Function

%>