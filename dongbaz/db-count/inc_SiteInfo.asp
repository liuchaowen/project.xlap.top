<%

set rsSite=conn.Execute("select * from Site where Site_ID="& SiteID)

if rssite.eof then Response.Redirect "help.asp?errid=4"

	Site_Name			= rsSite("S_Name")
	Site_Name_ENG		= rsSite("S_Name_ENG")
	Site_Content		= rsSite("S_Content")
	Site_Content_ENG	= rsSite("S_Content_ENG")
	Site_URL			= rsSite("S_URL1")
	Site_URL2			= rsSite("S_URL2")
	Site_StartTime		= rsSite("S_StartTime")
	Site_MasterName		= rsSite("S_MasterName")
	Site_MasterUname	= rsSite("S_MasterUname")
	Site_MasterPassword	= rsSite("S_MasterPassword")
	Site_MasterEmail	= rsSite("S_MasterEmail")
	Site_MasterTimeZone	= rsSite("S_MasterTimeZone")
	Site_MasterLang		= rsSite("S_MasterLang")
	Site_KillRefresh	= rsSite("S_KillRefresh")
	Site_SaveNum		= rsSite("S_SaveNum")
	Site_TodayDate		= rsSite("S_TodayDate")
	Site_CanGuest		= rsSite("S_CanGuest")
	Site_Gra			= rsSite("S_Gra")
	Site_Can			= rsSite("S_Can")
	Site_BigSite		= rsSite("S_BigSite")
	
	if Site_BigSite>0 then CFG_SaveOnline=false

SSS = split(rsSite("S_Style"),",")
if ubound(SSS)=1 then
  S_Oldip=SSS(0):S_Oldpv=SSS(1)
else
  S_Oldip=0:S_Oldpv=0
end if


dim site_CanS(14)
for i=0 to 14
	if instr("," & Site_Can & ",","," & i & ",") then
		site_CanS(i)=true
	else
		site_CanS(i)=false
	end if
next
%>