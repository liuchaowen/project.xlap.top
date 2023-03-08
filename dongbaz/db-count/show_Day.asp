<!--#include file="inc_show.asp"-->

<%
Response.Write replace(Style_Header,"$Title",Site_Name & "-" & Lang_Item_Day)
Response.Write Style_Top
Response.Write replace(Style_Tips,"$Tips",Lang_Day_Tips)

' 最近31天
set slDay=new ajgraph
slDay.reArr 30,6
set rslDay=conn.execute("select top 31 sum(V_View),sum(V_IP),datevalue(V_DTime+"&U_TZone&"/24) from View where Site_ID=" _
			& SiteID & " and V_DTime <= #"&dateadd("h",0-CFG_ZoneServer,now())&"# group by datevalue(V_DTime+"&U_TZone&"/24) order by datevalue(V_DTime+"&U_TZone&"/24) desc")
U_now = dateadd("h",U_TZone-CFG_ZoneServer,now())

i=30
j=datevalue(u_now)
do while not rslDay.eof
  if Day(rslDay(2))=Day(j) then
	slDay.ArrData(i,0)=cDay0(rslDay(2))
	slDay.ArrData(i,1)=cDay(rslDay(2))
	slDay.ArrData(i,2)=rslDay(1)
	slDay.ArrData(i,4)=rslDay(0)
	rslDay.movenext
  else
	slDay.ArrData(i,0)=cDay0(j)
	slDay.ArrData(i,1)=cDay(j)
	slDay.ArrData(i,2)=0
	slDay.ArrData(i,4)=0
  end if
  j=dateadd("d",-1,j)
  if i=0 then exit do
  i=i-1
loop

slDay.colwidth=13
slDay.mousemodel="$0" & vbcrlf & Lang_Visitors & ": $2, $3%" & vbcrlf & Lang_PageView & ": $4, $5%"
slDay.exec

' 绘图
Response.Write replace(Style_MainTop,"$MainName",Lang_Day_Last)
if instr(Site_Gra,"D") then Response.Write slDay.Gra("D")
if instr(Site_Gra,"B") then Response.Write slDay.Gra("B")
if instr(Site_Gra,"I") then Response.Write slDay.Gra("I")
if instr(Site_Gra,"V") then Response.Write slDay.Gra("V")
Response.Write "<center><span class=""gra2"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_Visitors & " " & slDay.TotalI _
				& "&nbsp; <span class=""gra"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_PageView & " " & slDay.TotalV & "</center>"
Response.Write Style_MainBottom


' 所有月份
set sDay=new ajgraph
sDay.reArr 30,6
set rsDay=conn.execute("select sum(V_View),sum(V_IP),day(V_DTime+"&U_TZone&"/24) from View where Site_ID=" _
			& SiteID & " group by Day(V_DTime+"&U_TZone&"/24) order by Day(V_DTime+"&U_TZone&"/24)")
for i=0 to 30
  if not rsday.eof then
	if rsDay(2)=i+1 then
	sDay.ArrData(i,0)=rsDay(2) & Lang_Day_Dy
	sDay.ArrData(i,1)=rsDay(2)
	sDay.ArrData(i,2)=rsDay(1)
	sDay.ArrData(i,4)=rsDay(0)
	rsDay.movenext
	else
	sDay.ArrData(i,0)=i+1 & Lang_Day_Dy
	sDay.ArrData(i,1)=i+1
	sDay.ArrData(i,2)=0
	sDay.ArrData(i,4)=0
	end if
  else
	sDay.ArrData(i,0)=i+1 & Lang_Day_Dy
	sDay.ArrData(i,1)=i+1
	sDay.ArrData(i,2)=0
	sDay.ArrData(i,4)=0
  end if
next
sDay.ColWidth=13
sDay.mousemodel="$0" & vbcrlf & Lang_Visitors & ": $2, $3%" & vbcrlf & Lang_PageView & ": $4, $5%"
sDay.exec

' 绘图
Response.Write replace(Style_MainTop,"$MainName",Lang_Day_All)
if instr(Site_Gra,"D") then Response.Write sDay.Gra("D")
if instr(Site_Gra,"B") then Response.Write sDay.Gra("B")
if instr(Site_Gra,"I") then Response.Write sDay.Gra("I")
if instr(Site_Gra,"V") then Response.Write sDay.Gra("V")
Response.Write "<center><span class=""gra2"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_Visitors & " " & sDay.TotalI _
				& "&nbsp; <span class=""gra"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_PageView & " " & sDay.TotalV & "</center>"
Response.Write Style_MainBottom


' 竖图和表格
if instr(Site_Gra,"T") or instr(Site_Gra,"d") or instr(Site_Gra,"b") or instr(Site_Gra,"i") or instr(Site_Gra,"v") then

  ' 竖图和表格
  Response.Write replace(Style_MainTop,"$MainName",Lang_Day_Last & "(" & Lang_Tab & ")") & "<table align=""center""><tr>"
  if instr(Site_Gra,"T") then
    slDay.TabHeader = "<tr class=""fonts"" height=""16"" align=""center""><td width=""60"">&nbsp;</td><td width=""40"">"&Lang_Visitors&"</td><td width=""35"">"&Lang_Percent&"</td><td width=""40"">"&Lang_PageView&"</td><td width=""35"">"&Lang_Percent&"</td></tr>"
    slDay.TabRow = "<tr height=""16"" align=""right""><td align=""left"">&nbsp;$0</td><td>$2&nbsp;</td><td>$3%&nbsp;</td><td>$4&nbsp;</td><td>$5%&nbsp;</td></tr>"
    Response.Write "<td>" & slDay.TabGra(5) & "</td>"
  end if
  if instr(Site_Gra,"d") or instr(Site_Gra,"b") or instr(Site_Gra,"i") or instr(Site_Gra,"v") then Response.Write "<td width=""10"">&nbsp;</td>"
  if instr(Site_Gra,"d") then Response.Write "<td>" & slDay.Gra("d") & "</td>"
  if instr(Site_Gra,"b") then Response.Write "<td>" & slDay.Gra("b") & "</td>"
  if instr(Site_Gra,"i") then Response.Write "<td>" & slDay.Gra("i") & "</td>"
  if instr(Site_Gra,"v") then Response.Write "<td>" & slDay.Gra("v") & "</td>"
  Response.Write "</tr></table>" & Style_MainBottom

  ' 竖图和表格
  Response.Write replace(Style_MainTop,"$MainName",Lang_Day_All & "(" & Lang_Tab & ")") & "<table align=""center""><tr>"
  if instr(Site_Gra,"T") then
    sDay.TabHeader = "<tr class=""fonts"" height=""16"" align=""center""><td width=""60"">&nbsp;</td><td width=""40"">"&Lang_Visitors&"</td><td width=""35"">"&Lang_Percent&"</td><td width=""40"">"&Lang_PageView&"</td><td width=""35"">"&Lang_Percent&"</td></tr>"
    sDay.TabRow = "<tr height=""16"" align=""right""><td align=""left"">&nbsp;$0</td><td>$2&nbsp;</td><td>$3%&nbsp;</td><td>$4&nbsp;</td><td>$5%&nbsp;</td></tr>"
    Response.Write "<td>" & sDay.TabGra(5) & "</td>"
  end if
  if instr(Site_Gra,"d") or instr(Site_Gra,"b") or instr(Site_Gra,"i") or instr(Site_Gra,"v") then Response.Write "<td width=""10"">&nbsp;</td>"
  if instr(Site_Gra,"d") then Response.Write "<td>" & sDay.Gra("d") & "</td>"
  if instr(Site_Gra,"b") then Response.Write "<td>" & sDay.Gra("b") & "</td>"
  if instr(Site_Gra,"i") then Response.Write "<td>" & sDay.Gra("i") & "</td>"
  if instr(Site_Gra,"v") then Response.Write "<td>" & sDay.Gra("v") & "</td>"
  Response.Write "</tr></table>" & Style_MainBottom
end if


Response.Write Style_Bottom

function cDay0(sD)
  if weekday(sD)=1 then
    cDay0=sD & " (" & Lang_Sunday & ")"
  elseif weekday(sD)=7 then
    cDay0=sD & " (" & Lang_Saturday & ")"
  else
    cDay0=(sD)
  end if
end function

function cDay(sD)
  if weekday(sD)=1 then
    cDay="<font color=""red"">" & day(sD) & "</font>"
  elseif weekday(sD)=7 then
    cDay="<font class=""fonts"">" & day(sD) & "</font>"
  else
    cDay=day(sD)
  end if
end function
%>