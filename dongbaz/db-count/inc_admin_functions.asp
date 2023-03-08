<%
' 检查组件是否被支持的自定义函数
Function IsObj(strObj)
	on error resume next
	IsObj=false
	dim TestObj
	set TestObj=server.CreateObject (strObj)
	If -2147221005 <> Err then
		IsObj = True
		set testobj=nothing
	end if
End function

' 获得数据库文件大小的自定义函数
Function getfilesize(filename)
	on error resume next
	getfilesize = 0
	set FsoObj2=server.CreateObject(CFG_StrFSO)
	if Err<>0 then getfilesize=-1:exit function
	set fileOBJ = FsoObj2.getFile(filename)
	getfilesize=fileobj.size
	set fileobj = nothing
	set fsoobj2 = nothing
End function

' 检查组件是否被支持的自定义函数
Function CanDel
	on error resume next
	Err.Clear
	tempfile=server.MapPath("./") & "\tempfile.txt"
	set FsoObj=server.CreateObject(CFG_StrFSO)
	if Err <> 0 then CanDel=0:exit function
	set tempfileOBJ = FsoObj.CreateTextFile(tempfile,true)
	if Err <> 0 then CanDel=1:exit function
	tempfileOBJ.WriteLine "Only for test. Ajiang ASPcheck"
	if Err <> 0 then CanDel=2:exit function
	tempfileOBJ.close
	Set tempfileOBJ = FsoObj.GetFile(tempfile)
	tempfileOBJ.Delete 
	if Err <> 0 then CanDel=3:exit function
	set tempfileOBJ=nothing
	CanDel=4
End function

' 写入文本文件的子程序
sub WriteTxtfile(thedatafile,texts)
	on error resume next
	set fso=server.CreateObject(CFG_StrFSO)
	set thefile=fso.CreateTextFile (thedatafile)
	thefile.write(texts)
	thefile.close
	set thefile=nothing
	set fso=nothing
end sub

' 读取文本文件的自定义函数
function ReadTxtfile(thedatafile)
	on error resume next
	set fso=server.CreateObject(CFG_StrFSO)
	set thefile=fso.OpenTextFile (thedatafile)
	ReadTxtfile=thefile.readall
	thefile.close
	set thefile=nothing
	set fso=nothing
end function

' 生成任意字串
function getrndstr(howlen)
  server.ScriptTimeout = 5
  dim strlen,strout
  strlen=0
  strout=""
  do while strlen<howlen
    Randomize
    rndid=int(rnd * 74)+48
    if (rndid>=49 and rndid<=57) or (rndid>=97 and rndid<=122) or (rndid>=65 and rndid<=90) then
	  strout=strout & chr(rndid)
	  strlen=strlen+1
	end if
  loop
  getrndstr=strout
end function
%>