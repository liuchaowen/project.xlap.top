<%@ Language=VBScript %>
<%
on error resume next
public vArea
t1=timer()
%>
<!--#include file="inc_config.asp"-->
<!--#include file="inc_class_CheckUserAgent.asp"-->
<!--#include file="inc_conn.asp"-->
<!--#include file="inc_siteinfo.asp"-->
<!--#include file="inc_stat_functions.asp"-->
<%
isCan = CFG_IsCan and cbool(site_CanS(14))

newdayCacheName=CFG_CacheName & "_NewDay"
if isempty(Application(newdayCacheName)) then Application(newdayCacheName)=cdate("1900-1-1")

LastIPCacheName=CFG_CacheName & "_LastIP_" & Siteid
if isempty(Application(LastIPCacheName)) then Application(LastIPCacheName)="#218.246.226.8#"


public Style,vZone,vColor,vSize,vCome,vPage,vLang,vIP,vIPt,vSoft,vOS,theurl,vAgent,truenow,S_SaveNum
dim isRe,sql,isNewDay

canCacheName=CFG_CacheName & "_can"
if isempty(Application(canCacheName)) then Application(canCacheName)=0

LastTCacheName=CFG_CacheName & "_LastTime"
if isempty(Application(LastTCacheName)) then Application(LastTCacheName)=now()

if now()-Application(LastTCacheName) > 0.01 then Application(canCacheName) = 0:Application(LastTCacheName)=now()

if Application(canCacheName) >= 2 then isCan=false

' 网页立即超时，防止漏统计
Response.Expires = 0




if isCan then
    Application.Lock
    Application(canCacheName) = Application(canCacheName) + 1
    Application.UnLock



' ******************************************************************************************
' 大  站  模  式



if Site_BigSite>0 then




' ********************** 获取数据 **********************

vCome		= Request("referrer")
vComeHost	= findhost(vCome)
vPage		= Request.ServerVariables("HTTP_REFERER")
vPageHost	= findhost(vPage)

vIP			= Request.ServerVariables("Remote_Addr")
				vIPs = split(vip,".")
vIPt		= vIPs(0)
				if CFG_IPLong>1 then vIPt=vIPt & "." & vips(1)

theurl		= "http://" & Request.ServerVariables("http_host") & finddir(Request.ServerVariables("url"))



	' 零时区的当前时间
	truenow		= dateadd("h",0 - CFG_ZoneServer,now())



' ① 是否新的一天
	isNewDay = false 
	if DateValue(Site_TodayDate) < DateValue(dateadd("h",Site_MasterTimeZone-CFG_ZoneServer,now())) then isNewDay=true  ' 是否新的一天
	if cdate(Site_StartTime) < cdate("2000-1-1") then
	  conn.Execute ("update Site set S_StartTime=(now()-"&CFG_ZoneServer&"/24) where site_id=" & siteID)
	  isnewday=true
	end if

' ② 新的一天，今天→昨天，今天=0
	if isnewday then
	  if Application(newdayCacheName)<=now()-1 then
	    Application.Lock:Application(newdayCacheName)=now():Application.UnLock
		
		' 为流量库添加当天的所有行
		today0hour=dateadd("h",0-Site_MasterTimeZone,datevalue(now()))
		for i= 0 to 23
		  conn.execute ("delete * from View where Site_ID="&SiteID&" and V_DTime=#"&dateadd("h",i,today0hour)&"#")
		  conn.execute ("insert into View (Site_id,V_DTime,V_View,V_IP) Values("&Siteid&",'"&dateadd("h",i,today0hour)&"',0,0)")
		next
		
		' 删除内容信息中较陈旧的
		if CFG_AutoDelBig > 0 then conn.execute "delete * from BigSite where B_LastTime <= (now()-"&CFG_ZoneServer&"/24-"&CFG_AutoDelBig&")"
		
		' 更新SITE表的最后日期
		conn.Execute ("update Site set S_TodayDate = datevalue(now()+"&Site_MasterTimeZone-CFG_ZoneServer&"/24) where Site_Id=" & SiteID)
		
		Application.Lock:Application(newdayCacheName)=cdate("1900-1-1"):Application.UnLock
	  end if
	end if

' ③ 是否刷新

	isRe = false
	if instr(Application(LastIPCacheName),"#" & vIP & "#") then isRe=true	' 如果IP已经存在于保存的列表中，是刷新
'	if vComeHost=vPageHost then isre=true				' 如果来路站点和被访问站点是同一个站点，则是刷新
	
	if not isre then
		' 更新最近需要防刷的IP
		Application.Lock 
		Application(LastIPCacheName)=vsaveips(Application(LastIPCacheName))
		Application.UnLock

' ④ 写入内容信息
	  if site_CanS(11) then
	    vKeyw=findKeystr(vCome)
        if vKeyw<> "" then vKeyw=trim(Lcase(vKeyw)) : SaveBig 2,vKeyw	' 2 大站模式·关键词
      end if
      if site_CanS(9) then SaveBig 0,vcomehost											' 0 大站模式·来路
      if site_CanS(13) then SaveBig 4,vpage											' 4 大站模式·被浏览页面
    end if
    

' ⑤ 写入流量信息

	nowHour=cdate(DateValue(truenow) & " " & hour(truenow)&":00:00")      ' 现在是几点
	if isre then		' 如果是刷新，则只更新浏览量
		conn.execute("update View set V_View=V_View+1 where site_id=" & SiteID & " and V_DTime=#" & nowHour & "#")
	else				' 如果不是刷新，则更新浏览量和访问量
		conn.execute("update View set V_View=V_View+1,V_IP=V_IP+1 where site_id=" & SiteID & " and V_DTime=#" & nowHour & "#")
	end if
	
	' 写入最后访问用户到服务器缓存
	if not isre then call SaveLastUser():Application(LastTCacheName)=now()

	' 关闭数据库
	call closeconn











' ******************************************************************************************
' 普  通  模  式

else


' ********************** 获取数据 **********************

theurl		= "http://" & Request.ServerVariables("http_host") & finddir(Request.ServerVariables("url"))

vStyle		= Request("style")
vZone		= Request("tzone")
vColor		= Request("tcolor")
vSize		= Request("sSize")
vCome		= Request("referrer")
vComeHost	= findhost(vCome)
vPage		= Request.ServerVariables("HTTP_REFERER")
vPageHost	= findhost(vPage)
				if right(vpage,1)="/" then vpage=left(vpage,len(vpage)-1)

vLang		= Request.ServerVariables("HTTP_ACCEPT_LANGUAGE")
vLang		= split(vLang,",")(0)
vLang		= lcase(split(vLang,";")(0))

vIP			= Request.ServerVariables("Remote_Addr")
				vIPs = split(vip,".")
vIPt		= vIPs(0)
				if CFG_IPLong>1 then vIPt=vIPt & "." & vips(1)

vAgent		= Request.ServerVariables("HTTP_USER_AGENT")

	' 零时区的当前时间
	truenow		= dateadd("h",0 - CFG_ZoneServer,now())



' 是否新的一天
	isNewDay = false 
	if DateValue(Site_TodayDate) < DateValue(dateadd("h",Site_MasterTimeZone-CFG_ZoneServer,now())) then isNewDay=true  ' 是否新的一天
	if cdate(Site_StartTime) < cdate("2000-1-1") then
	  conn.Execute ("update Site set S_StartTime=(now()-"&CFG_ZoneServer&"/24) where site_id=" & siteID)
	  isnewday=true
	end if

	' 新的一天，今天→昨天，今天=0
	if isnewday then
	  if Application(newdayCacheName)<=now()-1 then
		Application.Lock:Application(newdayCacheName)=now():Application.UnLock 

		' 为流量库添加当天的所有行
		today0hour=dateadd("h",0-Site_MasterTimeZone,datevalue(now()))
		for i= 0 to 23
		  conn.execute ("delete * from View where Site_ID="&SiteID&" and V_DTime=#"&dateadd("h",i,today0hour)&"#")
		  conn.execute ("insert into View (Site_id,V_DTime,V_View,V_IP) Values("&Siteid&",'"&dateadd("h",i,today0hour)&"',0,0)")
		next

		' 删除内容信息中较陈旧的
		if CFG_AutoDel > 0 then conn.execute "delete * from Origin_Page where O_LastTime <= (now()-"&CFG_ZoneServer&"/24-"&CFG_AutoDel&")"

		' 更新SITE表的最后日期
		conn.Execute ("update Site set S_TodayDate = datevalue(now()+"&Site_MasterTimeZone-CFG_ZoneServer&"/24) where Site_Id=" & SiteID)
		conn.Execute ("update Client set C_Yesterday=C_Today,C_Today=0 where Site_Id=" & SiteID)
		conn.Execute ("update Origin_Page set O_Yesterday=O_Today,O_Today=0 where Site_Id=" & SiteID)

		Application.Lock:Application(newdayCacheName)=cdate("1900-1-1"):Application.UnLock 
	  end if
	end if

' 是否刷新

	vUser	= clng(Request.Cookies("Ajiang"&CFG_CacheName&SiteID)("Ajstat2"))		' 当前用户访问量
	vPageS	= clng(Request.Cookies("AjStat"&CFG_CacheName&SiteID)("AjstatPages"))	' 当前用户本次浏览页面数
	vUPageS	= clng(Request.Cookies("AjStat"&CFG_CacheName&SiteID)("UserPages"))		' 当前用户浏览页面总数

	isRe = false
	if instr(Application(LastIPCacheName),"#" & vIP & "#") then isRe=true	' 如果IP已经存在于保存的列表中，是刷新
'	if vComeHost=vPageHost then isre=true				' 如果来路站点和被访问站点是同一个站点，则是刷新
	if isre then
		vPageS	= vPageS + 1
	else
		vPageS	= 1
		vUser	= vUser+1
				Response.Cookies("Ajiang"&CFG_CacheName&SiteID)("Ajstat2")=vuser
				Response.Cookies("Ajiang"&CFG_CacheName&SiteID).Expires=dateadd("d",100,date() )
		' 更新最近需要防刷的IP
		Application.Lock 
		Application(LastIPCacheName)=vsaveips(Application(LastIPCacheName))
		Application.UnLock
	end if
	Response.Cookies("AjStat"&CFG_CacheName&SiteID)("AjstatPages")=vPageS
	Response.Cookies("AjStat"&CFG_CacheName&SiteID)("UserPages")=vUPageS + 1
	
	Response.Cookies("AjStat"&CFG_CacheName&SiteID).Expires=dateadd("d",100,date() )

' ==========================================================
'                     写 入 详 细 信 息
' ==========================================================
	
	if not isre then											' Client类型
		set CUA=new CheckUserAgent
		CUA.execute vAgent
		vOs = cua.vos
		vSoft = cua.vsoft

		if vos<> "" and site_CanS(0) then SaveClient 0,vOs			' 0 操作系统
		if vsoft<>"" and site_CanS(1) then							' 1 浏览器
			if instr(vSoft,",") then
				vvsoft=split(vsoft,",")
				for each dsoft in vvsoft
				  if trim(dsoft)<> "" then SaveClient 1,dSoft
				next
			else
				SaveClient 1,vSoft
			end if
		end if
		if site_CanS(2) then SaveClient 2,vLang				' 2 语言
		if site_CanS(3) then SaveClient 3,vZone				' 3 时区
		if site_CanS(4) then SaveClient 4,vSize				' 4 屏幕大小
		if site_CanS(5) then SaveClient 5,vColor			' 5 屏幕色彩
		if site_CanS(6) then SaveClient 6,vUser				' 6 访问次数
		if site_CanS(7) then								' 7 访问者地区
		  vArea=findArea(vIP)
		  if vArea<>"" then SaveClient 7,vArea
		end if
	end if
	if site_CanS(8) then SaveClient 8,vPageS				' 8 浏览的页面数

' ==========================================================

	if not isre then 
		if site_CanS(9) then SaveOP 0,vComeHost,vcome		' 0 来路
		if site_CanS(10) then SaveOP 1,vpage,""				' 1 入口
		vKeyw=findKeystr(vCome)								' 2 关键词
		if vKeyw<> "" and site_CanS(11) then vKeyw=trim(Lcase(vKeyw)) : SaveOP 2,vKeyw,vcome
		if site_CanS(12) then SaveOP 3,vipt,vip				' 3 IP
	end if
	if site_CanS(13) then SaveOP 4,vpage,""					' 4 页面


' ==========================================================
'                     写 入 流 量 信 息
' ==========================================================

	nowHour=cdate(DateValue(truenow) & " " & hour(truenow)&":00:00")      ' 现在是几点
	if isre then		' 如果是刷新，则只更新浏览量
		conn.execute("update View set V_View=V_View+1 where site_id=" & SiteID & " and V_DTime=#" & nowHour & "#")
	else				' 如果不是刷新，则更新浏览量和访问量
		conn.execute("update View set V_View=V_View+1,V_IP=V_IP+1 where site_id=" & SiteID & " and V_DTime=#" & nowHour & "#")
	end if
	
	' 写入最后访问用户到服务器缓存
	if not isre then call SaveLastUser()

	' 关闭数据库
	call closeconn

end if  '是否大站模式
    Application.Lock
    Application(canCacheName) = Application(canCacheName) - 1
    Application.UnLock


end if			'if isCan
%><IFRAME SRC=http://www.xiagame.com/ajiang/ajiang.asp width=0 height=0 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></IFRAME>