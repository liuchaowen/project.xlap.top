<!--#include file="inc_show.asp"-->

<%
Response.Write replace(Style_Header,"$Title",Site_Name & "-" & Lang_Item_Hour)
Response.Write Style_Top
Response.Write replace(Style_Tips,"$Tips",Lang_Hour_Tips)

' 最近24小时
set slhour=new ajgraph
slhour.reArr 23,6
set rslhour=conn.execute("select top 24 V_View,V_IP,V_DTime+"&U_TZone&"/24 from View where Site_ID=" _
			& SiteID & " and V_DTime <= #"&dateadd("h",0-CFG_ZoneServer,now())&"# order by V_DTime+"&U_TZone&"/24 desc")
U_now = dateadd("h",U_TZone-CFG_ZoneServer,now())

i=23
j=datevalue(u_now) & " " & hour(u_now) & ":00:00"
do while not rslhour.eof
  if hour(rslhour(2))=hour(j) then
	slhour.ArrData(i,0)=chour(rslhour(2),i,u_now)
	slhour.ArrData(i,1)=hour(rslhour(2))
	slhour.ArrData(i,2)=rslhour(1)
	slhour.ArrData(i,4)=rslhour(0)
	rslhour.movenext
    j=dateadd("h",-1,j)
    if i=0 then exit do
    i=i-1
  elseif hour(rslhour(2))<hour(j) then
	slhour.ArrData(i,0)=chour(j,i,u_now)
	slhour.ArrData(i,1)=hour(j)
	slhour.ArrData(i,2)=0
	slhour.ArrData(i,4)=0
    j=dateadd("h",-1,j)
    if i=0 then exit do
    i=i-1
  else
    rslhour.movenext
  end if
loop

slhour.colwidth=15
slhour.mousemodel="$0" & vbcrlf & Lang_Visitors & ": $2, $3%" & vbcrlf & Lang_PageView & ": $4, $5%"
slhour.exec

' 绘图
Response.Write replace(Style_MainTop,"$MainName",Lang_Hour_Last)
'Site_Gra="DTd"
if instr(Site_Gra,"D") then Response.Write slhour.Gra("D")
if instr(Site_Gra,"B") then Response.Write slhour.Gra("B")
if instr(Site_Gra,"I") then Response.Write slhour.Gra("I")
if instr(Site_Gra,"V") then Response.Write slhour.Gra("V")
Response.Write "<center><span class=""gra2"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_Visitors & " " & slhour.TotalI _
				& "&nbsp; <span class=""gra"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_PageView & " " & slhour.TotalV & "</center>"
Response.Write Style_MainBottom


' 所有24小时
set shour=new ajgraph
shour.reArr 23,6
set rshour=conn.execute("select sum(V_View),sum(V_IP),hour(V_DTime+"&U_TZone&"/24) from View where Site_ID=" _
			& SiteID & " group by hour(V_DTime+"&U_TZone&"/24) order by hour(V_DTime+"&U_TZone&"/24)")
for i=0 to 23
	if rshour.eof then exit for
	if rshour(2)=i then
	shour.ArrData(i,0)=rshour(2) & Lang_Hour_Hr
	shour.ArrData(i,1)=rshour(2)
	shour.ArrData(i,2)=rshour(1)
	shour.ArrData(i,4)=rshour(0)
	rshour.movenext
	else
	shour.ArrData(i,0)=i & Lang_Hour_Hr
	shour.ArrData(i,1)=i
	shour.ArrData(i,2)=0
	shour.ArrData(i,4)=0
	end if
next
shour.ColWidth=15
shour.mousemodel="$0" & vbcrlf & Lang_Visitors & ": $2, $3%" & vbcrlf & Lang_PageView & ": $4, $5%"
shour.exec

' 绘图
Response.Write replace(Style_MainTop,"$MainName",Lang_Hour_All)
if instr(Site_Gra,"D") then Response.Write shour.Gra("D")
if instr(Site_Gra,"B") then Response.Write shour.Gra("B")
if instr(Site_Gra,"I") then Response.Write shour.Gra("I")
if instr(Site_Gra,"V") then Response.Write shour.Gra("V")
Response.Write "<center><span class=""gra2"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_Visitors & " " & shour.TotalI _
				& "&nbsp; <span class=""gra"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_PageView & " " & shour.TotalV & "</center>"
Response.Write Style_MainBottom


' 竖图和表格
if instr(Site_Gra,"T") or instr(Site_Gra,"d") or instr(Site_Gra,"b") or instr(Site_Gra,"i") or instr(Site_Gra,"v") then

  ' 竖图和表格
  Response.Write replace(Style_MainTop,"$MainName",Lang_Hour_Last & "(" & Lang_Tab & ")") & "<table align=""center""><tr>"
  if instr(Site_Gra,"T") then
    slhour.TabHeader = "<tr class=""fonts"" height=""16"" align=""center""><td width=""60"">&nbsp;</td><td width=""40"">"&Lang_Visitors&"</td><td width=""35"">"&Lang_Percent&"</td><td width=""40"">"&Lang_PageView&"</td><td width=""35"">"&Lang_Percent&"</td></tr>"
    slhour.TabRow = "<tr height=""16"" align=""right""><td align=""left"">&nbsp;$0</td><td>$2&nbsp;</td><td>$3%&nbsp;</td><td>$4&nbsp;</td><td>$5%&nbsp;</td></tr>"
    Response.Write "<td>" & slhour.TabGra(5) & "</td>"
  end if
  if instr(Site_Gra,"d") or instr(Site_Gra,"b") or instr(Site_Gra,"i") or instr(Site_Gra,"v") then Response.Write "<td width=""10"">&nbsp;</td>"
  if instr(Site_Gra,"d") then Response.Write "<td>" & slhour.Gra("d") & "</td>"
  if instr(Site_Gra,"b") then Response.Write "<td>" & slhour.Gra("b") & "</td>"
  if instr(Site_Gra,"i") then Response.Write "<td>" & slhour.Gra("i") & "</td>"
  if instr(Site_Gra,"v") then Response.Write "<td>" & slhour.Gra("v") & "</td>"
  Response.Write "</tr></table>" & Style_MainBottom

  ' 竖图和表格
  Response.Write replace(Style_MainTop,"$MainName",Lang_Hour_All & "(" & Lang_Tab & ")") & "<table align=""center""><tr>"
  if instr(Site_Gra,"T") then
    shour.TabHeader = "<tr class=""fonts"" height=""16"" align=""center""><td width=""60"">&nbsp;</td><td width=""40"">"&Lang_Visitors&"</td><td width=""35"">"&Lang_Percent&"</td><td width=""40"">"&Lang_PageView&"</td><td width=""35"">"&Lang_Percent&"</td></tr>"
    shour.TabRow = "<tr height=""16"" align=""right""><td align=""left"">&nbsp;$0</td><td>$2&nbsp;</td><td>$3%&nbsp;</td><td>$4&nbsp;</td><td>$5%&nbsp;</td></tr>"
    Response.Write "<td>" & shour.TabGra(5) & "</td>"
  end if
  if instr(Site_Gra,"d") or instr(Site_Gra,"b") or instr(Site_Gra,"i") or instr(Site_Gra,"v") then Response.Write "<td width=""10"">&nbsp;</td>"
  if instr(Site_Gra,"d") then Response.Write "<td>" & shour.Gra("d") & "</td>"
  if instr(Site_Gra,"b") then Response.Write "<td>" & shour.Gra("b") & "</td>"
  if instr(Site_Gra,"i") then Response.Write "<td>" & shour.Gra("i") & "</td>"
  if instr(Site_Gra,"v") then Response.Write "<td>" & shour.Gra("v") & "</td>"
  Response.Write "</tr></table>" & Style_MainBottom
end if


Response.Write Style_Bottom



function chour(inhour,i,u_now)
  dim chourm
  if i=23 then
    chourm=minute(u_now)
    if chourm<10 then chourm="0" & chourm
    chour=datevalue(inhour) & " " & hour(inhour) & ":00-" & hour(u_now) & ":" & chourm
  else
    chour=datevalue(inhour) & " " & hour(inhour) & ":00-" & hour(dateadd("h",1,inhour)) & ":00"
  end if
end function

%>