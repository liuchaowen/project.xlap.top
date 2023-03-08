<%
Lang_HTML_Meta	= "<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"">" _
				  & VBCrlf & "<meta http-equiv=""Content-Language"" content=""zh-cn"">"

Lang_OnOff			= "[启动/停止]统计系统"
Lang_OnOff_On		= "统计系统正在运行中。"
Lang_OnOff_Off		= "统计系统已暂停使用。"
Lang_OnOff_TurnOn	= "立即启动"
Lang_OnOff_TurnOff	= "立即停止"
Lang_OnOff_NoFSO	= "您的服务器不支持FSO组件，无法在线停止和启动统计系统，要停止和启动统计系统，请参看使用说明书中的相应内容。"

' ===================== 下面的代码不要修改 ========================
' 替换文本
Lang_LastUser_Tips		= replace(Lang_LastUser_Tips,"$Site_SaveNum",Site_SaveNum)

%>