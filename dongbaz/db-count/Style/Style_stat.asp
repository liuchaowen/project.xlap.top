<%
'纯文本
Style_Stat_Text	= "$total"

'详细的纯文本
Style_Stat_Text2	= "$lang_stat_total<br>$lang_stat_today<br>$lang_stat_yesterday<br>$lang_stat_online<br>$lang_stat_user"

'带有连接和悬停文字的文本
Style_Stat_Text3	= "<a href='$THEURL/index.asp?siteid=$siteid' target='_blank' title=" _
				  & "'$lang_stat_total\n$lang_stat_today\n$lang_stat_yesterday\n$lang_stat_user'" _
				  & " style='color: #000000'>$total</a>"

'图标
Style_Stat_ICON	= "<a href='$THEURL/index.asp?siteid=$siteid' target='_blank' title=" _
				  & "'$lang_stat_total\n$lang_stat_today\n$lang_stat_yesterday\n$lang_stat_user'" _
				  & " style='color: #000000'><img style='filter: Alpha(Opacity=68);' border='0' src='$THEURL/style/images/stat_icon.gif'></a>"

'LOGO
Style_Stat_LOGO	= "<span style='width:88;height:31;BACKGROUND-IMAGE: url($THEURL/style/images/stat_counter.gif);filter: Alpha(Opacity=68);'>" _
				  & "<span style='width:58;height:12;margin-top:4;margin-left:24'>" _
				  & "<marquee behavior='loop' scrollDelay='100' scrollAmount='3'onmouseover='javascript:scrollAmount=1' onmouseout='javascript:scrollAmount=3'>" _
				  & "<a href='$THEURL/index.asp?siteid=$siteid' target='_blank' style='font-size: 12px;FONT-FAMILY:Arial, Verdana, san-serif;color:#407526; text-decoration: none'>" _
				  & "$lang_stat_total &nbsp; $lang_stat_today &nbsp; $lang_stat_yesterday &nbsp; $lang_stat_online &nbsp; $lang_stat_user" _
				  & "</a></marquee></span></span>"








' ================
' 下面的代码用来生成最终模板，不可以删除
on error resume next
public style,ststr,numlong,imgpath,bordercolor,bordersize
style = Lcase(trim(Request("style")))
oostr=split(style,"|aj|")
style=oostr(0)
if ubound(oostr)>=1 then
	numlong=clng(oostr(1))
else
	numlong=0
end if
if ubound(oostr)>=2 then
	imgpath=oostr(2)
else
	imgpath="numpic/001"
end if
if ubound(oostr)>=3 then
	bordercolor = oostr(3)
else
	bordercolor = "#000000"
end if
if ubound(oostr)>=4 then
	bordersize = oostr(4)
else
	bordersize = 0
end if


select case style
case "text"
  ststr = Style_Stat_Text
case "longtext"
  ststr = Style_Stat_Text2
case "linktext"
  ststr = Style_Stat_Text3
case "icon"
  ststr = Style_Stat_ICON
case "logo"
  ststr = Style_Stat_LOGO
case "","none"
  ststr = ""
case else
  ststr = style
end select

ststr = replace(ststr,"$lang_stat_total",lang_stat_total)
ststr = replace(ststr,"$lang_stat_today",lang_stat_today)
ststr = replace(ststr,"$lang_stat_yesterday",lang_stat_yesterday)
ststr = replace(ststr,"$lang_stat_user",lang_stat_user)
ststr = replace(ststr,"$lang_stat_online",lang_stat_online)

%>