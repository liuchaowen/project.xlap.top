<%

' ======================== �� �� �� �� ===========================

public CFG_Connpath,CFG_DefaultSite,CFG_ZoneServer,CFG_IPLong,CFG_CheckOnlineS,CFG_CacheName,CFG_isCan,CFG_SaveOnline_0,CFG_AutoDel,CFG_AutoDelBig,CFG_SaveOnline

' ���ݿ�·��
%>
<!--#include file="inc_config_dbpath.asp"-->
<%
' Ĭ��վ���ID
CFG_DefaultSite		= $CFG0

' ����������ʱ��
CFG_ZoneServer		= $CFG1

' IP����λ��
CFG_IPLong			= $CFG2

' ��������û�������룩
CFG_CheckOnlineS	= $CFG3

' ��������������
CFG_CacheName		= "$CFG4"

' ͳ��������
%>
<!--#include file="inc_config_isCan.asp"-->
<%

' �Զ�ɾ������ǰ��������Ϣ
CFG_AutoDel			= $CFG5

' ���ڴ�վ���Զ�ɾ������ǰ��������Ϣ
CFG_AutoDelBig		= $CFG6

' ����ʹ�������û�ͳ�Ƶ�վ��
CFG_SaveOnline_0	= "$CFG7"

' �����û���
CFG_sAdminName		= "$CFG8"

' ��������
CFG_sAdminPass		= "$CFG9"

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