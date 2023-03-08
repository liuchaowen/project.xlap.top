<!--#include file="inc_show.asp"-->

<%
Response.Write replace(Style_Header,"$Title",Site_Name & "-" & Lang_Item_Month)
Response.Write Style_Top
Response.Write replace(Style_Tips,"$Tips",Lang_Month_Tips)

' 最近31天
set slMonth=new ajgraph
slMonth.reArr 11,6
set rslMonth=conn.execute("select top 12 sum(V_View),sum(V_IP),Month(V_DTime+"&U_TZone&"/24),max(V_DTime) from View where Site_ID=" _
			& SiteID & " and V_DTime <= #"&dateadd("h",0-CFG_ZoneServer,now())&"# and V_DTime>=#"&dateadd("m",-11,datevalue(dateadd("h",0-CFG_ZoneServer,now())))&"# group by month(V_DTime+"&U_TZone&"/24) order by max(V_DTime) desc")
U_now = dateadd("h",U_TZone-CFG_ZoneServer,now())

i=11
j=Year(u_now) & "-" & Month(u_now) & "-1"
do while not rslMonth.eof
  if rslMonth(2)=Month(j) then
	slMonth.ArrData(i,0)=rslMonth(2) & Lang_Month_Mo
	slMonth.ArrData(i,1)=rslMonth(2)
	slMonth.ArrData(i,2)=rslMonth(1)
	slMonth.ArrData(i,4)=rslMonth(0)
	rslMonth.movenext
  else
	slMonth.ArrData(i,0)=month(j) & Lang_Month_Mo
	slMonth.ArrData(i,1)=month(j)
	slMonth.ArrData(i,2)=0
	slMonth.ArrData(i,4)=0
  end if
  j=dateadd("m",-1,j)
  if i=0 then exit do
  i=i-1
loop

slMonth.colwidth=15
slMonth.mousemodel="$0" & vbcrlf & Lang_Visitors & ": $2, $3%" & vbcrlf & Lang_PageView & ": $4, $5%"
slMonth.exec

' 绘图
Response.Write replace(Style_MainTop,"$MainName",Lang_Month_Last)
if instr(Site_Gra,"D") then Response.Write slMonth.Gra("D")
if instr(Site_Gra,"B") then Response.Write slMonth.Gra("B")
if instr(Site_Gra,"I") then Response.Write slMonth.Gra("I")
if instr(Site_Gra,"V") then Response.Write slMonth.Gra("V")
Response.Write "<center><span class=""gra2"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_Visitors & " " & slMonth.TotalI _
				& "&nbsp; <span class=""gra"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_PageView & " " & slMonth.TotalV & "</center>"
Response.Write Style_MainBottom


' 所有月份
set sMonth=new ajgraph
sMonth.reArr 11,6
set rsMonth=conn.execute("select sum(V_View),sum(V_IP),Month(V_DTime+"&U_TZone&"/24) from View where Site_ID=" _
			& SiteID & " group by Month(V_DTime+"&U_TZone&"/24) order by Month(V_DTime+"&U_TZone&"/24)")
for i=0 to 11
  if not rsMonth.eof then
	if rsMonth(2)=i+1 then
	sMonth.ArrData(i,0)=rsMonth(2) & Lang_Month_Mo
	sMonth.ArrData(i,1)=rsMonth(2)
	sMonth.ArrData(i,2)=rsMonth(1)
	sMonth.ArrData(i,4)=rsMonth(0)
	rsMonth.movenext
	else
	sMonth.ArrData(i,0)=i+1 & Lang_Month_Mo
	sMonth.ArrData(i,1)=i+1
	sMonth.ArrData(i,2)=0
	sMonth.ArrData(i,4)=0
	end if
  else
	sMonth.ArrData(i,0)=i+1 & Lang_Month_Mo
	sMonth.ArrData(i,1)=i+1
	sMonth.ArrData(i,2)=0
	sMonth.ArrData(i,4)=0
  end if
next
sMonth.ColWidth=15
sMonth.mousemodel="$0" & vbcrlf & Lang_Visitors & ": $2, $3%" & vbcrlf & Lang_PageView & ": $4, $5%"
sMonth.exec

' 绘图
Response.Write replace(Style_MainTop,"$MainName",Lang_Month_All)
if instr(Site_Gra,"D") then Response.Write sMonth.Gra("D")
if instr(Site_Gra,"B") then Response.Write sMonth.Gra("B")
if instr(Site_Gra,"I") then Response.Write sMonth.Gra("I")
if instr(Site_Gra,"V") then Response.Write sMonth.Gra("V")
Response.Write "<center><span class=""gra2"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_Visitors & " " & sMonth.TotalI _
				& "&nbsp; <span class=""gra"" style=""height:10;width:10;border:#000000 1px solid;""></span>&nbsp;" & Lang_PageView & " " & sMonth.TotalV & "</center>"
Response.Write Style_MainBottom


' 竖图和表格
if instr(Site_Gra,"T") or instr(Site_Gra,"d") or instr(Site_Gra,"b") or instr(Site_Gra,"i") or instr(Site_Gra,"v") then

  ' 竖图和表格
  Response.Write replace(Style_MainTop,"$MainName",Lang_Month_Last & "(" & Lang_Tab & ")") & "<table align=""center""><tr>"
  if instr(Site_Gra,"T") then
    slMonth.TabHeader = "<tr class=""fonts"" height=""16"" align=""center""><td width=""60"">&nbsp;</td><td width=""40"">"&Lang_Visitors&"</td><td width=""35"">"&Lang_Percent&"</td><td width=""40"">"&Lang_PageView&"</td><td width=""35"">"&Lang_Percent&"</td></tr>"
    slMonth.TabRow = "<tr height=""16"" align=""right""><td align=""left"">&nbsp;$0</td><td>$2&nbsp;</td><td>$3%&nbsp;</td><td>$4&nbsp;</td><td>$5%&nbsp;</td></tr>"
    Response.Write "<td>" & slMonth.TabGra(5) & "</td>"
  end if
  if instr(Site_Gra,"d") or instr(Site_Gra,"b") or instr(Site_Gra,"i") or instr(Site_Gra,"v") then Response.Write "<td width=""10"">&nbsp;</td>"
  if instr(Site_Gra,"d") then Response.Write "<td>" & slMonth.Gra("d") & "</td>"
  if instr(Site_Gra,"b") then Response.Write "<td>" & slMonth.Gra("b") & "</td>"
  if instr(Site_Gra,"i") then Response.Write "<td>" & slMonth.Gra("i") & "</td>"
  if instr(Site_Gra,"v") then Response.Write "<td>" & slMonth.Gra("v") & "</td>"
  Response.Write "</tr></table>" & Style_MainBottom

  ' 竖图和表格
  Response.Write replace(Style_MainTop,"$MainName",Lang_Month_All & "(" & Lang_Tab & ")") & "<table align=""center""><tr>"
  if instr(Site_Gra,"T") then
    sMonth.TabHeader = "<tr class=""fonts"" height=""16"" align=""center""><td width=""60"">&nbsp;</td><td width=""40"">"&Lang_Visitors&"</td><td width=""35"">"&Lang_Percent&"</td><td width=""40"">"&Lang_PageView&"</td><td width=""35"">"&Lang_Percent&"</td></tr>"
    sMonth.TabRow = "<tr height=""16"" align=""right""><td align=""left"">&nbsp;$0</td><td>$2&nbsp;</td><td>$3%&nbsp;</td><td>$4&nbsp;</td><td>$5%&nbsp;</td></tr>"
    Response.Write "<td>" & sMonth.TabGra(5) & "</td>"
  end if
  if instr(Site_Gra,"d") or instr(Site_Gra,"b") or instr(Site_Gra,"i") or instr(Site_Gra,"v") then Response.Write "<td width=""10"">&nbsp;</td>"
  if instr(Site_Gra,"d") then Response.Write "<td>" & sMonth.Gra("d") & "</td>"
  if instr(Site_Gra,"b") then Response.Write "<td>" & sMonth.Gra("b") & "</td>"
  if instr(Site_Gra,"i") then Response.Write "<td>" & sMonth.Gra("i") & "</td>"
  if instr(Site_Gra,"v") then Response.Write "<td>" & sMonth.Gra("v") & "</td>"
  Response.Write "</tr></table>" & Style_MainBottom
end if


Response.Write Style_Bottom
%>