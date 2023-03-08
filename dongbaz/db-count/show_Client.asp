<!--#include file="inc_show.asp"-->
<!--#include file="inc_Lang_Functionlang.asp"-->
<%

tTabTop = "<tr class=""fonts"" height=""16"" align=""center""><td width=""60"">&nbsp;</td><td width=""40"">"&Lang_Visitors&"</td><td width=""35"">"&Lang_Percent&"</td></tr>"
tClient = Request("C")
if tClient="" then tClient=0
tClient=clng(tClient)

tDay = Request("D")
select case tDay
case "T"
  tTitle = Site_Name & "-" & Lang_Me & "-" & Lang_Item_Client(tClient) & "(" & Lang_Today & ")"
  tMainName = Lang_Item_Client(tClient) & "(" & Lang_Today & ")"
  tSql = "select C_Content,C_Today from Client where site_id=" & SiteID & " and C_Type="&tClient&" and C_Today<>0 order by C_Today desc,C_Content"
  tTsql = "select count(*) from Client where site_id=" & SiteID & " and C_Type=" & tClient & " and C_Today<>0"
case "Y"
  tTitle = Site_Name & "-" & Lang_Me & "-" & Lang_Item_Client(tClient) & "(" & Lang_Yesterday & ")"
  tMainName = Lang_Item_Client(tClient) & "(" & Lang_Yesterday & ")"
  tSql = "select C_Content,C_Yesterday from Client where site_id=" & SiteID & " and C_Type="&tClient&" and C_Yesterday<>0 order by C_Yesterday desc,C_Content"
  tTsql = "select count(*) from Client where site_id=" & SiteID & " and C_Type=" & tClient & " and C_Yesterday<>0"
case else
  tTitle = Site_Name & "-" & Lang_Me & "-" & Lang_Item_Client(tClient)
  tMainName = Lang_Item_Client(tClient)
  tSql = "select C_Content,C_Total from Client where site_id=" & SiteID & " and C_Type="&tClient&" order by C_Total desc,C_Content"
  tTsql = "select count(*) from Client where site_id=" & SiteID & " and C_Type=" & tClient
end select

set rs=conn.execute(tSql)
set tmprs=conn.execute(ttsql)
set ajgra=new ajgraph

ajgra.reArr tmprs(0)-1,6
i=0
do while not rs.eof
  ajgra.ArrData(i,0)=cClient(rs(0),tClient)
  ajgra.ArrData(i,2)=rs(1)
  i=i+1
  rs.movenext
loop
ajgra.Exec
ajgra.TabHeader = tTabTop
ajgra.TabRow = "<tr height=""16"" align=""right""><td align=""left"">&nbsp;$0</td><td>$2&nbsp;</td><td>$3%&nbsp;</td></tr>"


Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write Style_Top
if tTips <> "" then Response.Write replace(Style_Tips,"$Tips",tTips)
Response.Write replace(Style_MainTop,"$MainName",tMainName)

Response.Write "<table align=""center""><tr><td>" & ajgra.TabGra(3) & "</td><td>" & ajgra.Gra("i") & "</td></tr></table>"

Response.Write Style_MainBottom
Response.Write Style_Bottom



%>
