<%t1=timer%>
<!--#include file="inc_show.asp"-->
<!--#include file="style/style_stat.asp"-->
<%

' =================
' 显示输出	
	
    theurl	= "http://" & Request.ServerVariables("http_host") & finddir(Request.ServerVariables("url"))	
	
	ststr=replace(ststr,"$THEURL",theurl)
	ststr=replace(ststr,"$siteid",siteid)

	if lcase(left(imgpath,4)) <> "http" then imgpath = theurl & "/" & imgpath
	
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
	
    if instr(ststr,"$total") or instr(ststr,"$p_total") then
	  ' 总访问量和浏览量
	  smain.getvi  "select sum(V_View),sum(V_IP) from View where Site_ID=" & SiteID
	  ok_Totalv = smain.g_v + S_oldpv
	  ok_Totali = smain.g_i + S_oldip
	  ststr = replace(ststr,"$totalv",longnum(ok_Totalv))
	  ststr = replace(ststr,"$total",longnum(ok_Totali))
	  ststr = replace(ststr,"$p_totalv",cimg(ok_Totalv))
	  ststr = replace(ststr,"$p_total",cimg(ok_Totali))
    end if
    if instr(ststr,"$today") or instr(ststr,"$p_today") then
	  ' 今日访问量和浏览量
	  smain.getvi "select sum(V_View),sum(V_IP) from View where V_DTime>=#"&day_(0)&"# and Site_ID=" & SiteID
	  ok_Todayv = smain.g_v
	  ok_Todayi = smain.g_i
	  ststr = replace(ststr,"$todayv",longnum(ok_Todayv))
	  ststr = replace(ststr,"$today",longnum(ok_Todayi))
	  ststr = replace(ststr,"$p_todayv",cimg(ok_Todayv))
	  ststr = replace(ststr,"$p_today",cimg(ok_Todayi))
    end if
    if instr(ststr,"$yesterday") or instr(ststr,"$p_yesterday") then
	  ' 昨日访问量和浏览量
	  smain.getvi "select sum(V_View),sum(V_IP) from View where V_DTime<#"&day_(0)&"# and V_DTime>=#"&day_(1)&"# and Site_ID=" & SiteID
	  ok_Yesterdayv = smain.g_v
	  ok_Yesterdayi = smain.g_i
	  ststr = replace(ststr,"$yesterdayv",longnum(ok_yesterdayv))
	  ststr = replace(ststr,"$yesterday",longnum(ok_yesterdayi))
	  ststr = replace(ststr,"$p_yesterdayv",cimg(ok_yesterdayv))
	  ststr = replace(ststr,"$p_yesterday",cimg(ok_yesterdayi))
    end if
    if instr(ststr,"$user") or instr(ststr,"$p_user") then
	  ' 当前用户的访问量和浏览量
	  ok_Useri = clng(Request.Cookies("Ajiang"&CFG_CacheName&SiteID)("Ajstat2"))		'当前用户访问量
	  ok_Userv = clng(Request.Cookies("AjStat"&CFG_CacheName&SiteID)("UserPages"))	'当前用户浏览页面总数
	  ststr = replace(ststr,"$userv",longnum(ok_Userv))
	  ststr = replace(ststr,"$user",longnum(ok_Useri))
	  ststr = replace(ststr,"$p_userv",cimg(ok_Userv))
	  ststr = replace(ststr,"$p_user",cimg(ok_Useri))
    end if
    if instr(ststr,"$online") or instr(ststr,"$p_online") then
	  ' 当前在线人数
      truenow = dateadd("h",0 - CFG_ZoneServer,now())
      onnnow = dateadd("s",-2.5 * CFG_CheckOnlineS,truenow)
      set rsonline = conn.execute("select count(*) from online where site_id=" & Siteid & " and  LastTime>#"&onnnow&"#")
	  ok_Online = rsonline(0)
	  ststr = replace(ststr,"$online",longnum(ok_Online))
	  ststr = replace(ststr,"$p_online",cimg(ok_Online))
    end if

Response.Write "document.write (""" & cjs(ststr) & """)"

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

function longnum(innum)
  longnum=cstr(innum)
  if numlong <> 0 then
    for i=numlong-1 to 1 step -1
      if innum < 10^i then longnum = "0" & longnum
    next
  end if
end function

function cimg(innum)
  ccstr=longnum(innum)
  for i = 1 to len(ccstr)
    numaj = mid(ccstr,i,1)
    cimg = cimg & "<img src='" & imgpath & "/" & numaj & ".gif'>"
  next
  cimg="<span style='BORDER: " & bordercolor & " " & bordersize & "px solid;'>" & cimg & "</span>"
end function

Function finddir(filepath)
	finddir=left(filepath,instrRev(filepath,"/")-1)
end Function

function cjs(injs)
    cjs=replace(replace(replace(injs,"    ",""),"/script","\/script"),chr(34),"\" & chr(34))
    cjs=replace(cjs,vbcrlf,chr(13))
    cjs=replace(cjs,chr(10),chr(13))
    cjs=replace(cjs,chr(13),"\n")
end function
%>