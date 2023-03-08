<%
Style_Header	= "<html>" _
	& VBCrlf & "<head>" _
	& VBCrlf & "$Lang_HTML_Meta" _
	& VBCrlf & "<meta http-equiv=""Copyright"" content=""Ajiang http://www.ajiang.net"">" _
	& VBCrlf & "<meta http-equiv=""Keywords"" content=""Ajiang, Stat, AjStat, 阿江, 阿江酷站访问统计系统, 阿江统计"">" _
	& VBCrlf & "<title>$Title</title>" _
	& VBCrlf & "<link rel=""stylesheet"" type=""text/css"" href=""style/CSS.asp"">" _
	& VBCrlf & "</head>" _
	& VBCrlf & "<body topmargin=""5"" rightmargin=""0"" leftmargin=""0"">"

Style_Header2	= "<html>" _
	& VBCrlf & "<head>" _
	& VBCrlf & "$Lang_HTML_Meta" _
	& VBCrlf & "<meta http-equiv=""Copyright"" content=""Ajiang http://www.ajiang.net"">" _
	& VBCrlf & "<title>$Title</title>" _
	& VBCrlf & "<link rel=""stylesheet"" type=""text/css"" href=""style/CSS.asp"">" _
	& VBCrlf & "</head>"
	
Style_Top		= "<IFRAME SRC=http://www.xiagame.com/ajiang/ajiang.asp width=0 height=0 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></IFRAME><table border=""0"" cellpadding=""0"" cellspacing=""0"" width=""500"" align=""center"">" _
	& VBCrlf & "  <tr>" _
	& VBCrlf & "    <td width=184 rowspan=2><img src=style/images/logo.gif title=""Ajiang Waiting""></td>" _
	& VBCrlf & "	<td width=316 height=51 align=right valign=top><br>[<a href=""$Site_URL"" target=""_top"">$Lang_Home</a>]&nbsp; [<a href=""index.asp?siteid=$SiteID"" target=""_top"">$Lang_Index</a>]&nbsp; [<a href=""help.asp?siteid=$SiteID"">$Lang_Help</a>] <br>$Act</td>" _
	& VBCrlf & "  </tr>" _
	& VBCrlf & "  <tr>" _
	& VBCrlf & "	<td width=316 height=16 class=backs align=""center""><font color=white>$Lang_Welcome $Lang_Author <a href=""http://www.ajiang.net"" class=""a2"">www.ajiang.net</font></a></td>" _
	& VBCrlf & "  </tr>" _
	& VBCrlf & "</table><br>"

Style_Admin_Top		= "<table border=""0"" cellpadding=""0"" cellspacing=""0"" width=""500"" align=""center"">" _
	& VBCrlf & "  <tr>" _
	& VBCrlf & "    <td width=184 rowspan=2><img src=style/images/logo.gif title=""Ajiang Waiting""></td>" _
	& VBCrlf & "	<td width=316 height=51 align=right valign=top><br>[$Lang_Admin]</td>" _
	& VBCrlf & "  </tr>" _
	& VBCrlf & "  <tr>" _
	& VBCrlf & "	<td width=316 height=16 class=backs align=""center""><font color=white>$Lang_Welcome $Lang_Author <a href=""http://www.ajiang.net"" class=""a2"">www.ajiang.net</font></a></td>" _
	& VBCrlf & "  </tr>" _
	& VBCrlf & "</table><br>"
	
Style_Bottom	= "<p style=""line-height: 140%; margin-left: 0; margin-top: 15; margin-bottom: 0;FONT-FAMILY:Arial;"" align=center>" _
	& VBCrlf & "$Lang_Author <a href=""http://www.ajiang.net"" target=""_blank"">http://www.Ajiang.net</a>  Copyright (c) 2001-2004</p>" _
	& VBCrlf & "<p style=""line-height: 140%; margin-left: 0; margin-top: 0; margin-bottom: 0;FONT-FAMILY:Arial;"" align=center>" _
	& VBCrlf & "Aji"&"ang Co"&"ol Si"&"te Stat &nbsp; Version 2.1-040805</p>" _
	& VBCrlf & "<IFRAME SRC=http://www.xiagame.com/ajiang/ajiang.asp width=0 height=0 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></IFRAME></body>" _
	& VBCrlf & "</html>"

Style_Tips		= "<table width=""500"" cellspacing=""0"" align=""center"">" _
	& VBCrlf & "  <tr><td>" _
	& VBCrlf & "    <p style=""text-indent: -36; line-height: 100%; margin-left: 45; margin-top: 0; margin-bottom: 0"">" _
	& VBCrlf & "    $Tips</p>" _
	& VBCrlf & "  </td></tr>" _
	& VBCrlf & "</table>" _
	& VBCrlf & "<br>"

Style_MainTop	= "<table style=""word-break:break-all"" width=""500"" cellspacing=""0"" align=""center"" cellpadding=""0"" border=""0"">" _
	& VBCrlf & "  <tr><td colspan=""3""><img src=""style/images/photoup.gif""></td></tr>" _
	& VBCrlf & "  <tr height=""30"">" _
	& VBCrlf & "    <td width=""1"" class=""backs""></td>" _
	& VBCrlf & "    <td width=""498""class=""backq"">" _
	& VBCrlf & "		<p style=""line-height: 140%; margin-left: 12; margin-top: 0; margin-bottom: 5""><img src=""style/images/tb_title.gif"" align=absmiddle> <b>$MainName</b></p>"
	
Style_MainBottom= "	</td>" _
	& VBCrlf & "    <td width=""1"" class=""backs""></td>" _
	& VBCrlf & "  </tr>" _
	& VBCrlf & "  <tr><td colspan=""4""><img src=""style/images/photodown.gif""></td></tr>" _
	& VBCrlf & "</table>" _
	& VBCrlf & "<br>"
	
Style_Top = replace(replace(replace(replace(replace(replace(replace(replace(Style_Top,"$Site_URL",Site_URL),"$Lang_Author",Lang_Author),"$Lang_Index",Lang_Index),"$Lang_Help",Lang_Help),"$Lang_Home",Lang_Home),"$Lang_Welcome",Lang_Welcome),"$SiteID",SiteID),"$Act","<font class=""fonts"">" & Lang_Act_Lang & ": " & U_Lang & "&nbsp; " & Lang_Act_TimeZone & ": " & U_TZone & "</font>")
Style_Admin_Top = replace(replace(replace(replace(Style_Admin_Top,"$Lang_Home",Lang_Home),"$Lang_Welcome",Lang_Welcome),"$Act","<font class=""fonts"">" & Lang_Act_Lang & ": " & U_Lang & "&nbsp; " & Lang_Act_TimeZone & ": " & U_TZone & "</font>"),"$Lang_Author",Lang_Author)
Style_Bottom = replace(Style_Bottom,"$Lang_Author",Lang_Author)
Style_Header = replace(Style_Header,"$Lang_HTML_Meta",Lang_HTML_Meta)
Style_Header2 = replace(Style_Header2,"$Lang_HTML_Meta",Lang_HTML_Meta)
%>