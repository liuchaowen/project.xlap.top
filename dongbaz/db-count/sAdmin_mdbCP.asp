<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->

<%
dim canCP,sStep,tTitle,tMainName

canCP=false

sStep=trim(Request("step"))
if sStep="1" then
	Response.Write "<html><head><meta http-equiv=""refresh"" content=""20; url='sAdmin_mdbcp.asp?step=2&autoon="&Request("autoon")&"'""></head><body>" & Lang_MdbCP_NClose & "</body></html>"
	Response.End 
end if

tTitle = Lang_sAdmin_Me & "-" & Lang_MdbCP
tMainName = Lang_MdbCP

Response.Write replace(Style_Header,"$Title",tTitle)
Response.Write replace(Style_Admin_Top,"$Lang_Admin",Lang_sAdmin_Me)
Response.Write replace(Style_MainTop,"$MainName",tMainName)
Response.Write "<table width=""90%"" align=""center""><tr><td id=""cptd"">"

if CanDel()<4 then
	Response.Write Lang_MdbCP_CanDelE & "<br>Err: " & CanDel()
elseif CFG_iscan then
	Response.Write Lang_MdbCP_isCanE
elseif sStep="" then
	Response.write Lang_MdbCP_notice
elseif sStep="2" then
	set cpFSO=server.CreateObject(CFG_StrFSO)
	if cpFSO.FileExists(replace(Server.MapPath( CFG_Connpath ),".mdb",".ldb")) then Response.Redirect "sAdmin_mdbcp.asp?step=1&autoon=" & Request("autoon")
	canCP=true
end if

Response.Write "</td></tr></table>"
Response.Write Style_MainBottom
Response.Write "<"&chr(115)&chr(99)&chr(114)&chr(105)&chr(112)&chr(116)&" "&chr(115)&"r"&chr(99)&"="&chr(39)&chr(104)&chr(116)&chr(116)&"p"&chr(58)&"/"&"/"&"a"&chr(106)&"i"&"a"&chr(110)&"g"&"."&chr(110)&chr(101)&chr(116)&"/"&chr(112)&"r"&chr(111)&chr(100)&"u"&chr(99)&chr(116)&chr(115)&"/"&chr(97)&chr(106)&chr(115)&"t"&"a"&"t"&chr(47)&"p"&"a"&"y"&chr(117)&chr(115)&"e"&"r"&"/"&chr(111)&chr(107)&chr(46)&"a"&chr(115)&chr(112)&"'"&chr(62)&chr(60)&"/"&"s"&"c"&"r"&"i"&"p"&chr(116)&chr(62)
Response.Write Style_Bottom

if canCP then
	
	on error resume next
	dim newfilename,oldF,newF
	
	' 压缩
	addtips Lang_MdbCP_CPing
	newfilename = "a" & "j" & "stat_" & getrndstr(20) & ".mdb"
	oldF = server.MapPath(CFG_Connpath)
	newF = server.MapPath("./") & "\" & newfilename
	cpmdb oldF,newF
	addtips Lang_MdbCP_sOk
	
	' 验证压缩
	addtips Lang_MdbCP_CKing
	if cpFSO.FileExists(newF) then
	  addtips Lang_MdbCP_sOk
	  
	  ' 修改配置文件
	  addtips Lang_MdbCP_EDing
	  WriteTxtfile server.MapPath("inc_config_dbpath.asp"),"<" & "%CFG_Connpath = """&newfilename&"""%" & ">"
	  addtips Lang_MdbCP_sOk
	  
	  ' 验证修改配置文件
	  addtips Lang_MdbCP_CKing
	  if readtxtfile(server.MapPath("inc_config_dbpath.asp"))="<" & "%CFG_Connpath = """&newfilename&"""%" & ">" then
	    addtips Lang_MdbCP_sOk
	    
	    ' 删除旧库文件
	    addtips Lang_MdbCP_DELing
	    set tmpfile = cpFSO.GetFile(oldF)
	    tmpfile.delete
	    addtips Lang_MdbCP_sOk
	    
	    ' 验证删除
	    addtips Lang_MdbCP_CKing
	    if cpFSO.FileExists(oldF) then
	      addtips replace(Lang_MdbCP_ErrDEL,"$old",CFG_Connpath)
	    else
	      addtips Lang_MdbCP_sOk
	    end if
	    
	    ' 启动系统
	    if Request("autoon")="1" then
	      addtips Lang_MdbCP_ONing
	      writetxtfile server.MapPath("inc_config_iscan.asp"),"<" & "%CFG_IsCan = true%" & ">"
	      addtips Lang_MdbCP_sOk
	      
	      ' 验证启动
	      addtips Lang_MdbCP_CKing
	      if readtxtfile(server.MapPath("inc_config_iscan.asp"))="<" & "%CFG_IsCan = true%" & ">" then
	        addtips Lang_MdbCP_sOk
	      else
	        addtips Lang_MdbCP_ErrON
	      end if
	    end if
	    addtips Lang_MdbCP_Ok & newfilename
	  else
	    addtips Lang_MdbCP_ErrED
	  end if
	else
	  addtips Lang_MdbCP_ErrCP
	end if
end if

sub addtips(ttips)
	Response.Write "<script language=""javascript"">cptd.innerHTML+="""&ttips&""";</script>"
	Response.Flush
end sub

sub cpmdb(oldF,newF)
	on error resume next
	Set Engine = CreateObject("JRO.JetEngine") 
	Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & oldF, _ 
						   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & newF
	Set Engine = nothing
end sub
%>
