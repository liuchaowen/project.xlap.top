<%

' ======================== �� �� �� �� ===========================

public CFG_Connpath,CFG_DefaultSite,CFG_ZoneServer,CFG_IPLong,CFG_CheckOnlineS,CFG_CacheName,CFG_isCan,CFG_SaveOnline_0,CFG_AutoDel,CFG_AutoDelBig,CFG_SaveOnline

' ���ݿ�·��
%>
<!--#include file="inc_config_dbpath.asp"-->
<%
' Ĭ��վ���ID
CFG_DefaultSite		= 1

' ����������ʱ��
CFG_ZoneServer		= 8

' IP����λ��
CFG_IPLong			= 1

' ��������û�������룩
CFG_CheckOnlineS	= 40

' ��������������
CFG_CacheName		= "ajiang_stat"

' ͳ��������
%>
<!--#include file="inc_config_isCan.asp"-->
<%

' �Զ�ɾ������ǰ��������Ϣ
CFG_AutoDel			= 3

' ���ڴ�վ���Զ�ɾ������ǰ��������Ϣ
CFG_AutoDelBig		= 1

' ����ʹ�������û�ͳ�Ƶ�վ��
CFG_SaveOnline_0	= "All"

' �����û���
CFG_sAdminName		= "admin"

' ��������
CFG_sAdminPass		= "admin"

' FSO����
CFG_StrFSO			= "Scripting.FileSystemObject"


' ===================== ���ô��룬�����޸� =======================

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