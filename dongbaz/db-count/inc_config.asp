<%

' ======================== 参 数 设 置 ===========================

public CFG_Connpath,CFG_DefaultSite,CFG_ZoneServer,CFG_IPLong,CFG_CheckOnlineS,CFG_CacheName,CFG_isCan,CFG_SaveOnline_0,CFG_AutoDel,CFG_AutoDelBig,CFG_SaveOnline

' 数据库路径
%>
<!--#include file="inc_config_dbpath.asp"-->
<%
' 默认站点的ID
CFG_DefaultSite		= 1

' 服务器所在时区
CFG_ZoneServer		= 8

' IP保存位数
CFG_IPLong			= 1

' 检测在线用户间隔（秒）
CFG_CheckOnlineS	= 40

' 服务器缓存名称
CFG_CacheName		= "ajiang_stat"

' 统计器启用
%>
<!--#include file="inc_config_isCan.asp"-->
<%

' 自动删除×天前的内容信息
CFG_AutoDel			= 3

' 对于大站，自动删除×天前的内容信息
CFG_AutoDelBig		= 1

' 允许使用在线用户统计的站点
CFG_SaveOnline_0	= "All"

' 超管用户名
CFG_sAdminName		= "admin"

' 超管密码
CFG_sAdminPass		= "admin"

' FSO名称
CFG_StrFSO			= "Scripting.FileSystemObject"


' ===================== 公用代码，请勿修改 =======================

Public SiteID

SiteID = Request("SiteID")
if SiteID = "" then SiteID = CFG_DefaultSite
if IsNumeric(Siteid)=false then Response.Redirect "help.asp?errid=5"

CFG_SaveOnline		= CFG_CanSave(SiteID,CFG_SaveOnline_0)

function CFG_CanSave(SiteID,CanSiteID)
  select case lcase(CanSiteID)
    case "all"
	  CFG_CanSave=true
    case "no"
      CFG_CanSave=false
    case else
      if instr(","&CanSiteID&",",","&SiteID&",") then
	    CFG_CanSave=true
      else
	    CFG_CanSave=false
      end if
  end select
end function
%>