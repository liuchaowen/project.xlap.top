<!--#include file="inc_show.asp"-->
<%

tOP = Request("O")
if tOP="" then tOP=0
tOP = clng(tOP)

tOrder = Request("ord")
KeyW = Request("KeyW")
keyW = replace(KeyW,"'","''")

if KeyW <> "" then wherestr = " and (O_LastURL like '%" & KeyW & "%' or O_Content like '%" & KeyW & "%')"

tDay = Request("D")

select case tDay
case "T"
  tTitle = Site_Name & "-" & Lang_Me & "-" & Lang_Item_OP(tOP) & "(" & Lang_Today & ")"
  tMainName = Lang_Item_OP(tOP) & "(" & Lang_Today & ")"
  tSql = "select top 100 O_Content,O_Today,O_LastURL,O_LastTime from Origin_Page where site_id=" & SiteID & " and O_Type="&tOP&" and O_Today<>0" & wherestr
  if tOrder="T" then 
    tSql = tSql & " order by O_LastTime desc"
  else
    tSql = tSql & " order by O_Today desc,O_Content"
  end if
  tTsql = "select count(*) from Origin_Page where site_id=" & SiteID & " and O_Type=" & tOP & " and O_Today<>0" & wherestr
case "Y"
  tTitle = Site_Name & "-" & Lang_Me & "-" & Lang_Item_OP(tOP) & "(" & Lang_Yesterday & ")"
  tMainName = Lang_Item_OP(tOP) & "(" & Lang_Yesterday & ")"
  tSql = "select top 100 O_Content,O_Yesterday,O_LastURL,O_LastTime from Origin_Page where site_id=" & SiteID & " and O_Type="&tOP&" and O_Yesterday<>0" & wherestr
  if tOrder="T" then 
    tSql = tSql & " order by O_LastTime desc"
  else
    tSql = tSql & " order by O_Yesterday desc,O_Content"
  end if
  tTsql = "select count(*) from Origin_Page where site_id=" & SiteID & " and O_Type=" & tOP & " and O_Yesterday<>0" & wherestr
case else
  tTitle = Site_Name & "-" & Lang_Me & "-" & Lang_Item_OP(tOP)
  tMainName = Lang_Item_OP(tOP)
  tSql = "select top 100 O_Content,O_Total,O_LastURL,O_LastTime from Origin_Page where site_id=" & SiteID & " and O_Type="&tOP&"" & wherestr
  if tOrder="T" then 
    tSql = tSql & " order by O_LastTime desc"
  else
    tSql = tSql & " order by O_Total desc,O_Content"
  end if
  tTsql = "select count(*) from Origin_Page where site_id=" & SiteID & " and O_Type=" & tOP & wherestr
end select

set rs=conn.execute(tSql)
set tmprs=conn.execute(ttsql)
set ajgra=new ajgraph

maxc=tmprs(0)
if maxc>=100 then maxc=100

tTabTop = "<tr class=""fonts"" height=""16"" align=""center""><td>&nbsp;"&maxc&" of "&tmprs(0)&"</td><td width=""40"">"&Lang_Visitors&"</td><td width=""35"">"&Lang_Percent&"</td></tr>"

ajgra.reArr maxc-1,6
i=0
do while not rs.eof
  c0=replace(rs(0),"""","&#34")
  c0=server.HTMLEncode(c0)
  if c0="" and tOP=0 then
	ajgra.ArrData(i,0)=Lang_OP_NoOrigin
  else
	ajgra.ArrData(i,0)=replace(replace(replace(replace(replace(Lang_OP(tOP),"$0",c0),"$2",rs(2)),"$p0",left(findpages(c0),35)),"$L0",lefts(c0,25)),"$3",dateadd("h",U_TZone,rs(3)))
  end if
  ajgra.ArrData(i,2)=rs(1)
  i=i+1
  rs.movenext
loop
ajgra.Exec
ajgra.TabHeader = tTabTop
ajgra.TabRow = "<tr height=""16"" align=""right""><td align=""left"">&nbsp;$0</td><td>$2&nbsp;</td><td>$3%&nbsp;</td></tr>"


Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write Style_Top
if Lang_OP_Tips(tOP) <> "" then Response.Write replace(Style_Tips,"$Tips",Lang_OP_Tips(tOP))

if tOrder="T" then
  Response.Write replace(Style_Tips,"$Tips","<a href=""show_OP.asp?siteid="&siteid&"&O="&tOP&"&D="&tDay&"&KeyW="&server.URLEncode(KeyW)&""">"&Lang_OP_OrderCs&"</a>")
else
  Response.Write replace(Style_Tips,"$Tips","<a href=""show_OP.asp?siteid="&siteid&"&O="&tOP&"&D="&tDay&"&KeyW="&server.URLEncode(KeyW)&"&ord=T"">"&Lang_OP_OrderTime&"</a>")
end if
Response.Write replace(Style_MainTop,"$MainName",tMainName)
Response.Write "<table align=""center""><tr><td>" & ajgra.TabGra(3) & "</td><td>" & ajgra.Gra("i") & "</td></tr>"
if keyW<>"" then Response.Write "<tr><td colspan=""2"" align=""center"">"&Lang_Total&": "&ajgra.TotalI&"</td></tr>"
Response.Write "</table>"
Response.Write Style_MainBottom

Response.Write replace(Style_MainTop,"$MainName",Lang_Search)
%>
<table align="center"><form action="show_OP.asp" method=post><tr><td>
<input type="hidden" name="siteid" value="<%=siteid%>">
<input type="hidden" name="O" value="<%=tOP%>">
<input type="hidden" name="D" value="<%=tDay%>">
<%=Lang_Keywords%> <input name="KeyW" class="input" size=25>
<input type="submit" name="search" class="backc2" value=" "> &nbsp;
</td></tr></table>
<%
Response.Write Style_MainBottom

Response.Write Style_Bottom

function findpages(furl)
	on error resume next
	if instr(furl,"/") <> 0 then
	ffurl		= split(furl,"/")
	findpages	= replace(furl,ffurl(0)& "//" & ffurl(2),"")
	if findpages="" then findpages="/"
	else 
	findpages	= ""
	end if
end function

function lefts(types,longN)
  dim ctypes,i,tc,cc,tt
  lefts=""
  ctypes=types
  cc=0
  for i=1 to longN
    if i>len(ctypes) then exit for
    tt=mid(ctypes,i,1)
	cc=cc+1
    if int(asc(tt))<0 then cc=cc+1
    lefts=lefts & tt
    if cc>=longN then exit for
  next
end function

%>
