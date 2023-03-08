<!--#include file="inc_show.asp"-->
<%
Response.Write replace(Style_Header,"$Title",Site_Name & "-" & Lang_Item_LastUser)
Response.Write Style_Top
Response.Write replace(Style_MainTop,"$MainName",Lang_Item_Main)


	' 得到浏览者的当前时间
	U_now = dateadd("h",U_TZone-CFG_ZoneServer,now())
    
    ' 得到浏览者的今日、昨日、本月1日、本年元旦的时间
	dim day_(3),day_a(3)
	day_a(0)=datevalue(U_now)			' 今日凌晨0点
	day_a(1)=dateadd("d",-1,day_a(0))		' 昨日凌晨0点
	day_a(2)=cdate(year(day_a(0)) & "-" & month(day_a(0)) & "-1")	' 本月1日凌晨0点
	day_a(3)=cdate(year(day_a(0)) & "-1-1")						' 今年1月1日凌晨0点

	' 将浏览者时间转换为零时区时间
	for i=0 to 3
		day_(i)=dateadd("h",0-U_TZone,day_a(i))
	next
		
	set smain=new gvn
	
	' 总访问量和浏览量
	smain.getvi  "select sum(V_View),sum(V_IP) from View where Site_ID=" & SiteID
	ok_Totalv = smain.g_v 
	ok_Totali = smain.g_i
	
	' 今日访问量和浏览量
	smain.getvi "select sum(V_View),sum(V_IP) from View where V_DTime>=#"&day_(0)&"# and Site_ID=" & SiteID
	ok_Todayv = smain.g_v
	ok_Todayi = smain.g_i
	
	' 昨日访问量和浏览量
	smain.getvi "select sum(V_View),sum(V_IP) from View where V_DTime<#"&day_(0)&"# and V_DTime>=#"&day_(1)&"# and Site_ID=" & SiteID
	ok_Yesterdayv = smain.g_v
	ok_Yesterdayi = smain.g_i
	
	' 本月访问量和浏览量
	smain.getvi "select sum(V_View),sum(V_IP) from View where V_DTime>=#"&day_(2)&"# and Site_ID=" & SiteID
	ok_tMonthv = smain.g_v
	ok_tMonthi = smain.g_i

	' 本年访问量和浏览量
	smain.getvi "select sum(V_View),sum(V_IP) from View where V_DTime>=#"&day_(3)&"# and Site_ID=" & SiteID
	ok_tYearv = smain.g_v
	ok_tYeari = smain.g_i

	' 当前用户的访问量和浏览量
	ok_Useri = clng(Request.Cookies("Ajiang"&CFG_CacheName&SiteID)("Ajstat2"))		'当前用户访问量
	ok_Userv = clng(Request.Cookies("AjStat"&CFG_CacheName&SiteID)("UserPages"))	'当前用户浏览页面总数

	' 开始统计日期
	ok_StartT = dateadd("h",U_TZone,Site_StartTime)
	
	' 统计天数
	ok_Days = formatnumber(round(dateadd("h",0-CFG_ZoneServer,now())-Site_StartTime,2),,true)
	
	' 最高浏览量
	smain.getvi "select top 1 sum(V_View),datevalue(V_DTime + "&U_TZone&"/24) from View where Site_ID="&SiteID&" group by datevalue(V_DTime + "&U_TZone&"/24) order by sum(V_View) desc"
	
	ok_maxv = smain.g_v
	ok_maxvDate = smain.g_i
	
	' 最高访问量
	smain.getvi "select top 1 sum(V_ip),datevalue(V_DTime + "&U_TZone&"/24) from View where Site_ID="&SiteID&" group by datevalue(V_DTime + "&U_TZone&"/24) order by sum(V_ip) desc"
	ok_Maxi = smain.g_v
	ok_maxiDate = smain.g_i
	
	' 最低浏览量
	smain.getvi  "select top 1 sum(V_View),datevalue(V_DTime + "&U_TZone&"/24) from View where Site_ID="&SiteID&" and V_DTime>=#"&dateadd("h",-1,Site_StartTime)&"# and V_DTime<=(now()-"&CFG_ZoneServer&"/24) group by datevalue(V_DTime + "&U_TZone&"/24) order by sum(V_View)"
	ok_minv = smain.g_v
	ok_minvDate =smain.g_i
	
	' 最低访问量
	smain.getvi "select top 1 sum(V_ip),datevalue(V_DTime + "&U_TZone&"/24) from View where Site_ID="&SiteID&" and V_DTime>=#"&dateadd("h",-1,Site_StartTime)&"# and V_DTime<=(now()-"&CFG_ZoneServer&"/24) group by datevalue(V_DTime + "&U_TZone&"/24) order by sum(V_ip)"
	ok_Mini = smain.g_v
	ok_miniDate = smain.g_i
	
	' 日均
	if ok_days>0 then
	ok_Avei = round(ok_Totali/ok_days)
	ok_Avev = round(ok_Totalv/ok_days)
	end if

	' 预计今日
	if ok_Yesterday<>0 then
	  ok_Inteni = round((ok_Todayi/(U_now-day_a(0))+ok_Yesterdayi+ok_Avei)/3)
	  ok_Intenv = round((ok_Todayv/(U_now-day_a(0))+ok_Yesterdayv+ok_Avev)/3)
	else
	  ok_Inteni = round((ok_Todayi/(U_now-day_a(0))+ok_Avei)/2)
	  ok_Intenv = round((ok_Todayv/(U_now-day_a(0))+ok_Avev)/2)
	end if
	if ok_Inteni<ok_Todayi then ok_Inteni=ok_Todayi
	if ok_Intenv<ok_Todayv then ok_Intenv=ok_Todayv
	
	  ' 当前在线人数
      truenow = dateadd("h",0 - CFG_ZoneServer,now())
      onnnow = dateadd("s",-2.5 * CFG_CheckOnlineS,truenow)
      set rsonline = conn.execute("select count(*) from online where site_id=" & Siteid & " and  LastTime>#"&onnnow&"#")
	  ok_Online = rsonline(0)
%>
<table border="0" cellpadding="0" cellspacing="0" width="460" align=center>
<tr>
  <td width="225" valign=top>
  <table border="0" cellpadding="0" cellspacing="0" width="225">
    <tr height="16" class="fonts"><td colspan="2"><%=Lang_Main_Site%></td></tr>
    <tr height="16"><td colspan="2"><hr class=fonts size=1></td></tr>
    <tr height="16"><td width="65"><%=Lang_Main_SiteName%>: </td><td><%=Site_Name%></td></tr>
    <tr height="16"><td><%=Lang_Main_SiteURL1%></td><td><a href="<%=Site_URL%>" class="a1" target="_top"><%=Site_URL%></a></td></tr>
    <tr height="16"><td><%=Lang_Main_SiteURL2%></td><td><a href="<%=Site_URL2%>" class="a1" target="_top"><%=Site_URL2%></a></td></tr>
    <tr height="16"><td><%=Lang_Main_SiteCon%></td><td style="line-height: 135%"><%=Site_Content%></td></tr>
    <tr height="16"><td colspan="2"><hr class=fonts size=1></td></tr>
    <tr height="16"><td><%=Lang_Main_MaName%></td><td><%=Site_MasterName%> (<%=Site_MasterLang%>)</td></tr>
    <tr height="16"><td><%=Lang_Main_MaEmail%></td><td><%=Site_MasterEmail%></td></tr>
    <tr height="16"><td><%=Lang_Main_MaTimeZone%></td><td><%=Site_MasterTimeZone%></td></tr>
    <tr height="16"><td colspan="2"><hr class=fonts size=1></td></tr>
    <tr height="16"><td><%=Lang_Online%></td><td><%=ok_Online%></td></tr>
    <tr height="16"><td><%=Lang_Main_StartTime%></td><td><%=ok_StartT%></td></tr>
    <tr height="16"><td><%=Lang_Main_Days%></td><td><%=ok_Days%></td></tr>
<%if S_Oldip>0 then%>
    <tr height="16"><td><%=Lang_Old%></td><td><%=Lang_Visitors & ":" & S_Oldip & "<br>" & Lang_PageView & ":" & S_Oldpv%></td></tr>
<%end if%>    
<%if isM=false and isSM=false then%>
    <tr height="16"><td colspan="2"><hr class=fonts size=1></td></tr>
    <tr height="16"><td colspan="2"> [<a class="a1" href="login.asp?siteid=<%=siteid%>" target="_top"><%=Lang_Login%></a>]</td></tr>
<%end if%>
  </table>
  </td>
  <td width="25"></td>
  <td width="210" valign=top>
  <table border="0" cellpadding="0" cellspacing="0" width="200">
    <tr height="16" class=fonts><td><%=Lang_Main_Flux%></td><td align="right"><%=Lang_Visitors%></td><td align="right"><%=Lang_PageView%></td></tr>
    <tr height="16"><td colspan="3"><hr class=fonts size=1></td></tr>
    <tr height="16"><td><%=Lang_Total%></td><td align="right"><%=ok_Totali%></td><td align="right"><%=ok_Totalv%></td></tr>
    <tr height="16" class="fonts"><td><%=Lang_Today%></td><td align="right"><%=ok_Todayi%></td><td align="right"><%=ok_Todayv%></td></tr>
    <tr height="16"><td><%=Lang_Yesterday%></td><td align="right"><%=ok_Yesterdayi%></td><td align="right"><%=ok_Yesterdayv%></td></tr>
    <tr height="16"><td><%=Lang_ThisMonth%></td><td align="right"><%=ok_tMonthi%></td><td align="right"><%=ok_tMonthv%></td></tr>
    <tr height="16"><td><%=Lang_ThisYear%></td><td align="right"><%=ok_tYeari%></td><td align="right"><%=ok_tYearv%></td></tr>
    <tr height="16"><td><%=Lang_Yours%></td><td align="right"><%=ok_Useri%></td><td align="right"><%=ok_Userv%></td></tr>
    <tr height="16"><td colspan="3"><hr class=fonts size=1></td></tr>
    <tr height="16"><td><%=Lang_Main_Max%></td><td align="right"><%=ok_Maxi%></td><td align="right"><%=ok_maxv%></td></tr>
    <tr height="16"><td><%=Lang_Main_At%></td><td align="right"><%=ok_maxiDate%></td><td align="right"><%=ok_maxvDate%></td></tr>
    <tr height="16"><td><%=Lang_Main_Min%></td><td align="right"><%=ok_Mini%></td><td align="right"><%=ok_Minv%></td></tr>
    <tr height="16"><td><%=Lang_Main_At%></td><td align="right"><%=ok_MiniDate%></td><td align="right"><%=ok_MinvDate%></td></tr>
    <tr height="16"><td colspan="3"><hr class=fonts size=1></td></tr>
    <tr height="16"><td><%=Lang_Main_Ave%></td><td align="right"><%=ok_Avei%></td><td align="right"><%=ok_Avev%></td></tr>
    <tr height="16"><td><%=Lang_Main_Intending%></td><td align="right"><%=ok_Inteni%></td><td align="right"><%=ok_Intenv%></td></tr>
  </table>
  </td>
</tr>
</table>
<%
Response.Write Style_MainBottom
Response.Write Style_Bottom

class gvn
  dim g_v,g_i
  public function getvi(sql)
	set tmprs=conn.execute(sql)
	if not tmprs.eof then
	  g_v=tmprs(0)
	  g_i=tmprs(1)
	else
	  g_v=0
	  g_i=0
	end if
	if isnull(g_v) then g_v=0
	if isnull(g_i) then g_i=0
  end function
end class


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