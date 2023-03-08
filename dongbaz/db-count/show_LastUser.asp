<!--#include file="inc_show.asp"-->
<%
Response.Write replace(Style_Header,"$Title",Site_Name & "-" & Lang_Item_LastUser)
Response.Write Style_Top
Response.Write replace(Style_Tips,"$Tips",Lang_LastUser_Tips)
Response.Write replace(Style_MainTop,"$MainName",Lang_Item_LastUser)

%>
<table border="0" cellpadding="0" cellspacing="0" width="460" align=center>
<tr class="fonts">
  <td width="18"></td>
  <td width="140"><%=Lang_LastUser_UserIP%></td>
  <td width="58" align="center"><%=Lang_LastUser_Ontime%></td>
  <td width="104"><%=Lang_LastUser_Origin%></td>
  <td width="140"><%=Lang_LastUser_Entrance%></td>
</tr>
<tr height="12"><td colspan="5"><hr class=fonts size=1></td></tr>
<%
  truenow = dateadd("h",0 - CFG_ZoneServer,now())
  onnnow = dateadd("s",-2.5 * CFG_CheckOnlineS,truenow)

	CacheName=CFG_CacheName & "_Last_" & Siteid
	LastUser=Application(CacheName)
	rs=split(LastUser,vbcrlf)
	i=0
for i= 0 to ubound(rs)

  UL=split(rs(i),"#AjStat2#")
  ' 获得Ontime的当前时区格式
  OOntime=dateadd("h",U_TZone,UL(5))
  
  Response.Write "<tr height=""15"" title=""" & Lang_LastUser_Origin & ": "&UL(4)&vbcrlf& Lang_LastUser_Entrance _
			 & ": " &UL(2)&vbcrlf& Lang_LastUser_UserAgent & ": " &UL(1)&"""><td>" _ 
			 & i+1 & "</td><td>" & UL(0) & "</td><td align=""right""><a title="""&OOntime&""">" _
			 & timevalue(OOntime) & "</a>&nbsp;</td><td><a href="""&UL(4)&""" target=""_blank"">" _
			 & left(UL(3),25) & "</a></td><td><a href="""&UL(2)&""" target=""_blank"">" & left(findpages(UL(2)),22) _
			 & "</a></td></tr>"
next
%>
</table>
<%

Response.Write Style_MainBottom
Response.Write Style_Bottom


' 自定义函数

function findpages(furl)
  if furl<> "" then
	ffurl		= split(furl,"/")
	findpages	= replace(furl,ffurl(0)& "//" & ffurl(2),"")
	if findpages="" then findpages="/"
  else 
	findpages	= ""
  end if
end function
%>