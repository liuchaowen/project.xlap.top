<!--#include file="inc_show.asp"-->
<%
Response.Write replace(Style_Header,"$Title",Site_Name & "-" & Lang_Item_Online)
Response.Write Style_Top
Response.Write replace(Style_Tips,"$Tips",Lang_Online_Tips)
Response.Write replace(Style_MainTop,"$MainName",Lang_Item_Online)

%>
<table border="0" cellpadding="0" cellspacing="0" width="460" align=center>
<tr class="fonts">
  <td width="18"></td>
  <td width="100"><%=Lang_Online_UserIP%></td>
  <td width="58" align="center"><%=Lang_Online_Ontime%></td>
  <td width="58" align="center"><%=Lang_Online_Duration%></td>
  <td><%=Lang_Online_UserPage%> & <%=Lang_Online_UserAgent%></td>
</tr>
<tr height="12"><td colspan="5"><hr class=fonts size=1></td></tr>
<%
  truenow = dateadd("h",0 - CFG_ZoneServer,now())
  onnnow = dateadd("s",-2.5 * CFG_CheckOnlineS,truenow)

set rs=conn.execute("select * from online where site_id=" & Siteid & " and  LastTime>#"&onnnow&"# order by OnTime desc")
i=0
do while not rs.eof
  i=i+1
  ' 获得Ontime的当前时区格式
  OOntime=dateadd("h",U_TZone,rs("OnTime"))
  ' 获得停留时间的分秒写法
  LLsttime=cstrtime(cdate(truenow-rs("Ontime")))
  
  Response.Write "<tr height=""16"" title=""" & Lang_Online_UserPage & ": "&rs("UserPage")&vbcrlf& Lang_Online_UserAgent & ": " &rs("UserAgent")&"""><td>"&i & "&nbsp;</td><td>" & rs("UserIP") & "</td><td align=""right""><a title="""&OOntime&""">" & timevalue(OOntime) & "</a>&nbsp;</td><td align=""right"">" & LLsttime & " &nbsp; </td><td><a href="""&rs("UserPage")&""" target=""_blank"">" & left(findpages(rs("UserPage")),35) & "</a></td></tr>"
  rs.movenext
loop
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

function cstrtime(Lsttime)
  cstrtime=""
  dminute=60*hour(Lsttime)+minute(Lsttime)
  dsecond=second(Lsttime)
  if dminute<>0 then cstrtime=dminute & "'"
  if dsecond<10 then cstrtime=cstrtime & "0"
  cstrtime=cstrtime & dsecond & """"
end function
%>