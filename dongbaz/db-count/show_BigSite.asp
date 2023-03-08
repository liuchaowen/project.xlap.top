<!--#include file="inc_show.asp"-->
<%

tBigSite = Request("B")
if tBigSite="" then tBigSite=0
tBigSite = clng(tBigSite)

tOrder = Request("ord")
KeyW = Request("KeyW")
keyW = replace(KeyW,"'","''")

if KeyW <> "" then wherestr = " and B_Content like '%" & KeyW & "%'"


  tTitle = Site_Name & "-" & Lang_Me & "-" & Lang_Item_OP(tBigSite)
  tMainName = Lang_Item_OP(tBigSite)
  tSql = "select top 100 B_Content,B_Total,B_LastTime from BigSite where site_id=" & SiteID & " and B_Type="&tBigSite&"" & wherestr
  if tOrder="T" then 
    tSql = tSql & " order by B_LastTime desc"
  else
    tSql = tSql & " order by B_Total desc,B_Content"
  end if
  tTsql = "select count(*) from BigSite where site_id=" & SiteID & " and B_Type=" & tBigSite & wherestr

set rs=conn.execute(tSql)
set tmprs=conn.execute(ttsql)
set ajgra=new ajgraph

maxc=tmprs(0)
if maxc>=100 then maxc=100

tTabTBigSite = "<tr class=""fonts"" height=""16"" align=""center""><td>&nbsp;"&maxc&" of "&tmprs(0)&"</td><td width=""40"">"&Lang_Visitors&"</td><td width=""35"">"&Lang_Percent&"</td></tr>"

ajgra.reArr maxc-1,6
i=0
do while not rs.eof
  'on error resume next
  c0=replace(rs(0),"""","&#34")
  if c0="" and tBigSite=0 then
	ajgra.ArrData(i,0)=Lang_OP_NoOrigin
  else
    if tBigSite=4 then
      cc0="<a href="""&c0&""">" & lefts(findpages(c0),25) & "</a>"
    else
      cc0=lefts(c0,25)
    end if
	ajgra.ArrData(i,0)=replace(replace(replace(Lang_BigSite(tBigSite),"$0",c0),"$L0",cc0),"$2",rs(2)+(U_TZone/24))
  end if
  ajgra.ArrData(i,2)=rs(1)
  i=i+1
  rs.movenext
loop
ajgra.Exec
ajgra.TabHeader = tTabTBigSite
ajgra.TabRow = "<tr height=""16"" align=""right""><td align=""left"">&nbsp;$0</td><td>$2&nbsp;</td><td>$3%&nbsp;</td></tr>"


Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write Style_Top
if Lang_OP_Tips(tBigSite) <> "" then Response.Write replace(Style_Tips,"$Tips",Lang_OP_Tips(tBigSite))
if tOrder="T" then
  Response.Write replace(Style_Tips,"$Tips","<a href=""show_BigSite.asp?siteid="&siteid&"&B="&tBigSite&"&D="&tDay&"&KeyW="&server.URLEncode(KeyW)&""">"&Lang_OP_OrderCs&"</a>")
else
  Response.Write replace(Style_Tips,"$Tips","<a href=""show_BigSite.asp?siteid="&siteid&"&B="&tBigSite&"&D="&tDay&"&KeyW="&server.URLEncode(KeyW)&"&ord=T"">"&Lang_OP_OrderTime&"</a>")
end if
Response.Write replace(Style_MainTop,"$MainName",tMainName)

Response.Write "<table align=""center""><tr><td>" & ajgra.TabGra(3) & "</td><td>" & ajgra.Gra("i") & "</td></tr></table>"

Response.Write Style_MainBottom

Response.Write replace(Style_MainTop,"$MainName",Lang_Search)
%>
<table align="center"><form action="show_BigSite.asp" method=post><tr><td>
<input type="hidden" name="siteid" value="<%=siteid%>">
<input type="hidden" name="B" value="<%=tBigSite%>">
<input type="hidden" name="D" value="<%=tDay%>">
<%=Lang_Keywords%> <input name="KeyW" class="input" size=25>
<input type="submit" name="search" class="backc2" value=" "> &nbsp;
</td></tr></table>
<%
Response.Write Style_MainBottom

Response.Write Style_Bottom

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

function findpages(furl)
	on error resume next
	if furl<> "" then
	ffurl		= split(furl,"/")
	findpages	= replace(furl,ffurl(0)& "//" & ffurl(2),"")
	if findpages="" then findpages="/"
	else 
	findpages	= ""
	end if
end function

%>
