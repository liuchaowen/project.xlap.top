<!--#include file="inc_show.asp"-->
<%

public strsql, tTitle, tMainName

tTabTop = "<tr class=""fonts"" height=""16"" align=""center""><td width=""80"">&nbsp;</td><td width=""40"">"&Lang_Visitors&"</td><td width=""35"">"&Lang_Percent&"</td></tr>"

tDay=Request("D")

set ajgra=new ajgraph

ajgra.reArr ubound(Lang_sc_engine,1),6

select case tDay
case "T"
  strsql = "O_Today"
  tTitle = Site_Name & "-" & Lang_Me & "-" & Lang_Item_S_Engine & "(" & Lang_Today & ")"
  tMainName = Lang_Item_S_Engine & "(" & Lang_Today & ")"
case "Y"
  strsql = "O_Yesterday"
  tTitle = Site_Name & "-" & Lang_Me & "-" & Lang_Item_S_Engine & "(" & Lang_Yesterday & ")"
  tMainName = Lang_Item_S_Engine & "(" & Lang_Yesterday & ")"
case else
  strsql = "O_Total"
  tTitle = Site_Name & "-" & Lang_Me & "-" & Lang_Item_S_Engine
  tMainName = Lang_Item_S_Engine
end select

for i= 0 to ubound(Lang_sc_engine,1)
  ajgra.ArrData(i,0)=Lang_sc_engine(i,1)
  ajgra.ArrData(i,2)=getCl(Lang_sc_engine(i,0))
next


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


function getCl(strsl)
  if Site_BigSite then
    sql="select sum(B_Total) from Bigsite where site_id="&siteid&" and b_type=0 and b_content like '%" & strsl & "%'"
  else
    sql="select sum("&strsql&") from Origin_Page where site_id="&siteid&" and O_Type=0 and O_Content like '%" & strsl & "%'"
  end if
  set rss = conn.execute(sql)
  getCl = rss(0)
  if isnull(getCl) then getCl=0
end function
%>
