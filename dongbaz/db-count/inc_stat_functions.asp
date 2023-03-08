<%

' ********************************************************
'                自 定 义 函 数 和 子 程 序
' ********************************************************

' 保存客户端信息
Sub SaveClient(SNum,SCon)
	set tmprs=conn.Execute("select * from Client where C_Type=" & SNum & " and C_Content='"&SCon&"' and Site_Id=" & SiteID)
	if tmprs.eof then
		conn.Execute ("insert into Client (Site_id,C_Type,C_Content,C_Total,C_Yesterday,C_Today,C_LastTime) Values("&Siteid&","&SNum&",'"&SCon&"',1,0,1,'"&truenow&"')")
	else
	    conn.Execute ("update Client set C_Total=C_Total+1,C_Today=C_Today+1,C_LastTime='"&truenow&"'  where C_Type=" & SNum & " and C_Content='"&SCon&"' and Site_Id=" & SiteID)
	end if
	set tmprs=nothing
end Sub

' 保存内容信息
sub SaveOP(SNum,SCon,SCon2)
	SCon=replace(SCon,"'","''")
	SCon2=replace(SCon2,"'","''")
	set tmprs=conn.Execute("select id from Origin_Page where O_Type=" & SNum & " and O_Content='"&SCon&"' and Site_Id=" & SiteID)
	if tmprs.eof then
		conn.Execute ("insert into Origin_Page (Site_id,O_Type,O_Content,O_LastURL,O_Total,O_Yesterday,O_Today,O_LastTime) Values("&Siteid&","&SNum&",'"&SCon&"','"&SCon2&"',1,0,1,now()-"&CFG_ZoneServer&"/24)")
	else
	    conn.Execute ("update Origin_Page set O_Total=O_Total+1,O_Today=O_Today+1,O_LastURL='"&SCon2&"',O_LastTime=now()-"&CFG_ZoneServer&"/24 where O_Type=" & SNum & " and O_Content='"&SCon&"' and Site_Id=" & SiteID)
	end if
	set tmprs=nothing
end sub

' 保存大站模式信息
Sub SaveBig(SNum,SCon)
	set tmprs=conn.Execute("select * from BigSite where B_Type=" & SNum & " and B_Content='"&SCon&"' and Site_Id=" & SiteID)
	if tmprs.eof then
		conn.Execute "insert into BigSite (Site_ID,B_type,B_Content,B_Total,B_LastTime) VALUES("&Siteid&","&Snum&",'"&SCon&"',1,(now()-"&CFG_ZoneServer&"/24))"
	else
	    conn.Execute ("update BigSite set B_Total=B_Total+1,B_LastTime=(now()-"&CFG_ZoneServer&"/24) where B_Type=" & SNum & " and B_Content='"&SCon&"' and Site_Id=" & SiteID)
	end if
	set tmprs=nothing
end Sub

' 找到当前URL对应的站点
function findhost(furl)
	if furl<> "" then
	ffurl		= split(furl,"/")
	findhost	= ffurl(2)
	if left(findhost,8)="192.168." or left(findhost,3)="10." or findhost="127.0.0.1" or instr(findhost,".")=0 then findhost="LAN"
	else 
	findhost	= ""
	end if
end function

' 找到文件地址的全路径
Function finddir(filepath)
	finddir=left(filepath,instrRev(filepath,"/")-1)
end Function

' 从URL中获取关键词
function findKeystr(urlstr)
  dim regEx,vKey,vP,findKeystr1
  findkeystr=""
  vP = "(?:yahoo.+?[\?|&]p=|openfind.+?q=|google.+?q=|lycos.+?query=|aol.+?query=|onseek.+?keyword=|search\.tom.+?word=|search\.qq\.com.+?word=|zhongsou\.com.+?word=|search\.msn\.com.+?q=|yisou\.com.+?p=|sina.+?word=|sina.+?query=|sina.+?_searchkey=|sohu.+?word=|sohu.+?key_word=|sohu.+?query=|163.+?q=|baidu.+?word=|3721\.com.+?name=|Alltheweb.+?q=)([^&]*)"
  set regEx=new regexp
  regEx.Global = true
  regEx.IgnoreCase = true
  regEx.Pattern = vP

  set Matches = regEx.Execute(urlstr)
  for each Match in Matches
	' 没有使用subMatches是因为有的服务器可能并没有安装VBS5.5版本
	findKeystr1 = regEx.replace(Match.value,"$1")
  next

  if findKeystr1<> "" then
    findkeystr=lcase(decodeURI(findkeystr1))
    if findkeystr = "undefined" then
	  findkeystr = URLDecode(findKeystr1)
    end if
  end if
end function

' 找到IP地址对应的地区
function findArea(vIP)
  dim inIP,inIPnum,inIPs
  inIP=vip
  inIPs=split(inIP,".")
  inIPnum=16777216*inips(0) + 65536*inips(1) + 256*inips(2) + inips(3)
  set connip=server.createobject("adodb.connection")
  connip.Open "driver={Microsoft Access Driver (*.mdb)};dbq=" & Server.MapPath("ip.mdb")
  set rsip=connip.Execute("select ip1,ip2,country from address where ip2>="&inipnum&" and ip1<=" _
		& inipnum & " order by ip2-ip1")
  if rsip.eof then
    findArea=""
  else
    findArea=rsip("country")
    if instr(findarea,"未知") then findarea=""
  end if
end function

' 写入最后访问的用户
Sub SaveLastUser()
	CacheName=CFG_CacheName & "_Last_" & Siteid
	if isempty(Application(CacheName)) then
		Application(CacheName)=vIP & "#AjStat2#" & vAgent & "#AjStat2#" & vPage & "#AjStat2#" & vComeHost & "#AjStat2#" & vcome & "#AjStat2#" & truenow
	else
		onA=split(Application(CacheName),Vbcrlf)
		onAs=ubound(onA)
		strOut=vIP & " " & vArea & "#AjStat2#" & vAgent & "#AjStat2#" & vPage & "#AjStat2#" & vComeHost & "#AjStat2#" & vcome & "#AjStat2#" & truenow
		j=1
		for i=0 to onAs step 1
			strOut=strOut & vbcrlf & onA(i)
			j=j+1
			if j>= Site_SaveNum then exit for
		next
		Application.Lock
		Application(CacheName)=strOut
		Application.UnLock 
	end if
end sub

' 更新要保存的IP
function vsaveips(inips)
	vsaveips=left(inips,len(inips)-1)
	vsaveips=right(vsaveips,len(vsaveips)-1)
	howip=split(vsaveips,"#")
	if ubound(howip) < Site_KillRefresh then
		vsaveips="#" & vsaveips & "#" & vip & "#"
	else
		vsaveips=replace("#" & vsaveips,"#" & howip(0) & "#","#") & "#" & vip & "#"
	end if
end function


' 解开URL编码的函数(这是别人写的,我查到的地方标注为: 来源： CSDN  作者： dyydyy )
Function URLDecode(enStr)
  dim deStr
  dim c,i,v
  deStr=""
  for i=1 to len(enStr)
    c=Mid(enStr,i,1)
    if c="%" then
      v=eval("&h"+Mid(enStr,i+1,2))
      if v<128 then
        deStr=deStr&chr(v)
        i=i+2
      else
        if isvalidhex(mid(enstr,i,3)) then
          if isvalidhex(mid(enstr,i+3,3)) then
            v=eval("&h"+Mid(enStr,i+1,2)+Mid(enStr,i+4,2))
            deStr=deStr&chr(v)
            i=i+5
          else
            v=eval("&h"+Mid(enStr,i+1,2)+cstr(hex(asc(Mid(enStr,i+3,1)))))
            deStr=deStr&chr(v)
            i=i+3 
          end if 
        else 
          destr=destr&c
        end if
      end if
    else
      if c="+" then
        deStr=deStr&" "
      else
        deStr=deStr&c
      end if
    end if
  next
  URLDecode=deStr
end function

function isvalidhex(str)
  isvalidhex=true
  str=ucase(str)
  if len(str)<>3 then isvalidhex=false:exit function
  if left(str,1)<>"%" then isvalidhex=false:exit function
  c=mid(str,2,1)
  if not (((c>="0") and (c<="9")) or ((c>="A") and (c<="Z"))) then isvalidhex=false:exit function
  c=mid(str,3,1)
  if not (((c>="0") and (c<="9")) or ((c>="A") and (c<="Z"))) then isvalidhex=false:exit function
end function

%>
<script language="javascript" runat="server" type="text/javascript">	
//解码URI
function decodeURI(furl){
	var a=furl;
	try{return decodeURIComponent(a)}catch(e){return 'undefined'};
	return '';
}
</script>