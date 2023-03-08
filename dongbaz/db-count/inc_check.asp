<%
function findfilename(inpath)
  findfilename=right(inpath,len(inpath)-instrrev(inpath,"/"))
end function
spname = lcase(findfilename(Request.ServerVariables("SCRIPT_NAME")))

isM = false
isSM = false
if session.Contents(CFG_CacheName & "_SiteMaster_" & siteid) then isM = true
if session.Contents(CFG_CacheName & "_sAdmin") then isSM = true

if left(spname,9) = "index.asp" then
  if (isM=false) and (isSM=false) and Site_CanGuest=0 then
    Response.Redirect "help.asp?errid=1&helpid=4&siteid=" & siteid
  elseif (isM=false) and (isSM=false) and Site_CanGuest=1 then
    Response.Redirect "show_Main.asp?siteid=" & siteid
  end if
elseif left(spname,13) = "show_main.asp" and (isM=false) and (isSM=false) and Site_CanGuest<1 then
  Response.Redirect "help.asp?errid=1&helpid=4&siteid=" & siteid
elseif left(spname,5)="show_" and left(spname,13) <> "show_main.asp"  and (isM=false) and (isSM=false) and Site_CanGuest < 2 then
  Response.Redirect "help.asp?errid=1&helpid=4&siteid=" & siteid
elseif left(spname,6)="admin_" and (isM=false) and (isSM=false) then
  Response.Redirect "help.asp?errid=2&helpid=4&siteid=" & siteid
elseif left(spname,7)="sadmin_" and isSM=false then
  Response.Redirect "help.asp?errid=3&helpid=4&siteid=" & siteid
end if
%>