<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->
<!--#include file="inc_conn.asp"-->

<%

tTitle = Lang_sAdmin_Me & "-" & Lang_Acc
tMainName = Lang_Acc

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_sAdmin_Me)
Response.Write replace(Style_MainTop,"$MainName",tMainName)

%>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="460">
  <tr align="center" class="fonts">
    <td width="25">ID</td>
    <td><%=Lang_Acc_SiteName%></td>
    <td><%=Lang_Acc_SiteURL1%></td>
    <td><%=Lang_Acc_MaName%></td>
    <td><%=Lang_Acc_StartTime%></td>
    <td><%=Lang_Acc_Can%></td>
    <td><%=Lang_Acc_Mng%></td>
  </tr>
  <tr><td colspan="7"><hr class="fonts" size="1"></td></tr>
<%
set rs=conn.execute("select * from site")
do while not rs.eof
%>
  <tr height="15">
    <td><%=rs("Site_id")%></td>
    <td><a href="index.asp?siteid=<%=rs("Site_id")%>" target="_blank"><%=rs("S_Name")%></a></td>
    <td><a href="<%=rs("S_URL1")%>" target="_blank"><%=replace(rs("S_URL1"),"http://","")%></a></td>
    <td title="<%=Lang_Acc_MaTimeZone & ": " & rs("S_MasterTimeZone")%>"><a href="mailto:<%=S_MasterEmail%>"><%=rs("S_MasterName")%></a></td>
    <td title="<%=rs("S_StartTime")%>"><%=datevalue(rs("S_StartTime"))%></td>
    <td align="center"><%
	  Response.Write makecan(rs("S_Can"),rs("S_Bigsite"))
    %></td>
    <td><a href="index.asp?siteid=<%=rs("Site_ID")%>" target="_blank"><%=Lang_Acc_Mng%></a>
        <a href="sAdmin_siteedit.asp?siteid=<%=rs("Site_ID")%>"><%=Lang_Acc_EditCan%></a>
    </td>
  </tr>
<%
  rs.movenext
loop
%>
</table>
<%
Response.Write Style_MainBottom
Response.Write Style_Bottom

function makecan(canlist,dBigSite)
  
  dim tipstr_0,tipstr_1,picstr
  tipstr_0="":tipstr_1="":picstr=""
  
  cancan = "," & canlist & ","
  for i = 0 to ubound(Lang_AE_)
    if instr(cancan,"," & i & ",") then
      tipstr_1 = tipstr_1 & Lang_AE_(i) & vbcrlf
      if dBigSite then
        picstr = picstr & "<span style=""BACKGROUND-color: red;font-size:1px;BORDER: none;height:3px;width:3px""></span>"
	  else
        picstr = picstr & "<span class=""gra2"" style=""BORDER: none;height:3px;width:3px""></span>"
	  end if
    else
      tipstr_0 = tipstr_0 & Lang_AE_(i) & vbcrlf
      picstr = picstr & "<span class=""gra"" style=""BORDER: none;height:3px;width:3px""></span>"
    end if
  next
  
  makecan = "<span title="""&Lang_AE_yes&vbcrlf&tipstr_1&vbcrlf&Lang_AE_no&vbcrlf&tipstr_0&""" style=""BACKGROUND-color: white;BORDER: #000000 1px solid;height:3px;"">" & picstr & "</span>"
  
end function
%>