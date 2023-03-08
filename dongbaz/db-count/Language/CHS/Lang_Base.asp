<%
Lang_HTML_Meta	= "<meta http-equiv=""Content-Type"" content=""text/html; charset=gb2312"">" _
				  & VBCrlf & "<meta http-equiv=""Content-Language"" content=""zh-cn"">"

Lang_Author		= "阿江(Ajiang)"
Lang_Home		= Site_Name & "首页"
Lang_Index		= "索引"
Lang_Help		= "帮助"
Lang_Welcome	= "欢迎使用阿江统计2.1！"

Lang_Me			= "访问统计"

Lang_Stat_Today		= "今日访问: $today"
Lang_Stat_Yesterday	= "昨日访问: $yesterday"
Lang_Stat_Total		= "访问总量: $total"
Lang_Stat_Online	= "在线人数: $online"
Lang_Stat_User		= "谢谢您第 $user 次来"

Lang_Total		= "总量"
Lang_Today		= "今日"
Lang_Yesterday	= "昨日"
Lang_ThisMonth	= "本月"
Lang_ThisYear	= "今年"
Lang_Online		= "在线"
Lang_Yours		= "您"
Lang_Old		= "在此之前"

Lang_PageView	= "浏览量"
Lang_Visitors	= "访问量"

Lang_Tab		= "表格"
Lang_Percent	= "比例"

Lang_Act_Lang		= "当前语言"
Lang_Act_TimeZone	= "当前时区"

Lang_Search		= "查找特定记录"
Lang_Keywords	= "关键词"

Lang_Sunday		= "星期日"
Lang_Monday		= "星期一"
Lang_Tuesday	= "星期二"
Lang_Wednesday	= "星期三"
Lang_Thursday	= "星期四"
Lang_Friday		= "星期五"
Lang_Saturday	= "星期六"

Lang_Sun	= "日"
Lang_Mon	= "一"
Lang_Tue	= "二"
Lang_Wed	= "三"
Lang_Thu	= "四"
Lang_Fri	= "五"
Lang_Sat	= "六"

Lang_Item_Main		= "概况"
Lang_Item_Hour		= "时段分析"
Lang_Item_Day		= "日段分析"
Lang_Item_Week		= "周分析"
Lang_Item_Month		= "月分析"
Lang_Item_Year		= "年分析"
Lang_Item_custom	= "自定义"
Lang_Item_Online	= "在线用户"
Lang_Item_LastUser	= "访问明细"

Lang_Item_S_Engine	= "搜索引擎"

Lang_Item_Client(0)	= "操作系统"
Lang_Item_Client(1)	= "浏览器"
Lang_Item_Client(2)	= "语言"
Lang_Item_Client(3)	= "时区"
Lang_Item_Client(4)	= "屏幕大小"
Lang_Item_Client(5)	= "屏幕色彩"
Lang_Item_Client(6)	= "回头客"
Lang_Item_Client(7)	= "访问者地区"
Lang_Item_Client(8)	= "浏览深度"

Lang_Item_OP(0)		= "来路"
Lang_Item_OP(1)		= "入口网址"
Lang_Item_OP(2)		= "关键词"
Lang_Item_OP(3)		= "IP头"
Lang_Item_OP(4)		= "页面浏览"

Lang_OP_Tips(0)		= "定义: 如果访问者是从别的网站中点击连接进入此网站的，则被点击的连接所在的页面就是来路页面，该页面所在的网站就是来路站点。"
Lang_OP_Tips(1)		= "定义: 有时候用户可能并不是从网站的首页进入本网站的，比如，有的朋友会直接输入网址进入本网站的某个栏目，或者有的朋友会通过搜索引擎直接进入本网站的某个文章页面。我们把访问者进入你的网站时访问的第一个页面称为入口网址。"
Lang_OP_Tips(2)		= "定义: 当访问者通过搜索引擎搜索到本网站，并且点击搜索引擎中的连接进入本站时，他在搜索引擎中所查询的关键词将被本系统记录，也就是这里提到的关键词。"
Lang_OP_Tips(3)		= ""
Lang_OP_Tips(4)		= "定义:“页面浏览”告诉您本网站每个网页被浏览的次数。"

Lang_OP(0)			= "<a href=""http://$0"" title=""更新时间: $3"" target=""_blank"">$0</a> [<a class=""a1"" href=""$2"" target=""_blank"" title=""最后网址: $2"">GO</a>]"
Lang_OP(1)			= "<a title=""$0"&vbcrlf&"更新时间: $3"" href=""$0"" target=""_blank"">$p0</a>"
Lang_OP(2)			= "<a title=""更新时间: $3"&vbcrlf&"关 键 词: $0"">$L0</a> [<a class=""a1"" href=""$2"" target=""_blank"" title=""最后网址: $2"">GO</a>]"
Lang_OP(3)			= "<a title=""更新时间: $3"">$0 <font color=""#999999"">(最后IP: $2)</font></a>"
Lang_OP(4)			= "<a title=""$0"&vbcrlf&"更新时间: $3"" href=""$0"" target=""_blank"">$p0</a>"

Lang_OP_NoOrigin	= "直接输入网址访问"
Lang_OP_OrderTime	= "提示: 点击这里按更新时间排序。"
Lang_OP_OrderCs		= "提示: 点击这里按访问(或浏览)次数排序。"

Lang_BigSite(0)		= "<a href=""http://$0"" title=""更新时间: $2"" target=""_blank"">$0</a>"
Lang_BigSite(2)		= "<a title=""更新时间: $2"&vbcrlf&"关 键 词: $0"">$L0</a>"
Lang_BigSite(4)		= "<a title=""更新时间: $2"&vbcrlf&"被访问页面: $0"">$L0</a>"

Lang_Main_SiteName	= "站点名称"
Lang_Main_SiteURL1	= "站点地址"
Lang_Main_SiteURL2	= "站点镜像"
Lang_Main_SiteCon	= "站点简介"
Lang_Main_MaName	= "站长"
Lang_Main_MaEmail	= "站长信箱"
Lang_Main_MaTimeZone= "站长时区"

Lang_Main_StartTime	= "开始统计于"
Lang_Main_Ave		= "日均"
Lang_Main_Intending	= "预计今日"
Lang_Main_Days		= "已统计天数"
Lang_Main_Max		= "最高"
Lang_Main_Min		= "最低"
Lang_Main_At		= "&nbsp; 在"
Lang_Main_Flux		= "流量相关"
Lang_Main_Site		= "网站相关"

Lang_Online_UserIP		= "浏览者IP"
Lang_Online_Ontime		= "上站于"
Lang_Online_Duration	= "已停留"
Lang_Online_UserAgent	= "客户端信息"
Lang_Online_UserPage	= "所在页面"
Lang_Online_Tips		= "提示: 在鼠标的悬停提示中包含了更详细的信息。"

Lang_LastUser_UserIP	= "浏览者IP"
Lang_LastUser_Ontime	= "上站时间"
Lang_LastUser_Entrance	= "入口网址"
Lang_LastUser_UserAgent	= "客户端信息"
Lang_LastUser_Origin	= "来路网址"
Lang_LastUser_Tips		= "提示: 在鼠标的悬停提示中包含了更详细的信息。(仅保存 $Site_SaveNum 条访问记录)"

Lang_Hour_Last			= "最近24小时分析"
Lang_Hour_All			= "所有时间时段分析"
Lang_Hour_Hr			= " 时"
Lang_Hour_Tips			= "提示: 在鼠标的悬停提示中包含了更详细的信息。"

Lang_Day_Last			= "最近31天日段分析"
Lang_Day_All			= "所有月份日段分析"
Lang_Day_Dy			= " 日"
Lang_Day_Tips			= "提示: 在鼠标的悬停提示中包含了更详细的信息。"

Lang_Month_Last			= "最近12个月分析"
Lang_Month_All			= "所有时间月段分析"
Lang_Month_Mo			= " 月"
Lang_Month_Tips			= "提示: 在鼠标的悬停提示中包含了更详细的信息。"


Lang_sc_engine(0,0)		= "google."
Lang_sc_engine(0,1)		= "Google"

Lang_sc_engine(1,0)		= "baidu."
Lang_sc_engine(1,1)		= "百度"

Lang_sc_engine(2,0)		= "3721."
Lang_sc_engine(2,1)		= "3721"

Lang_sc_engine(3,0)		= "sohu."
Lang_sc_engine(3,1)		= "搜狐"

Lang_sc_engine(4,0)		= "163."
Lang_sc_engine(4,1)		= "网易"

Lang_sc_engine(5,0)		= "sina."
Lang_sc_engine(5,1)		= "新浪"

Lang_sc_engine(6,0)		= "lycos."
Lang_sc_engine(6,1)		= "Lycos"

Lang_sc_engine(7,0)		= "search.tom."
Lang_sc_engine(7,1)		= "Tom"

Lang_sc_engine(8,0)		= "onseek."
Lang_sc_engine(8,1)		= "Onseek"

Lang_sc_engine(9,0)		= "openfind."
Lang_sc_engine(9,1)		= "OpenFind"

Lang_sc_engine(10,0)		= "aol."
Lang_sc_engine(10,1)		= "Aol"

Lang_sc_engine(11,0)		= "zhongsou.com"
Lang_sc_engine(11,1)		= "中国搜索"

Lang_sc_engine(12,0)		= "Alltheweb."
Lang_sc_engine(12,1)		= "Alltheweb"

Lang_sc_engine(13,0)		= "yahoo."
Lang_sc_engine(13,1)		= "雅虎"

Lang_sc_engine(14,0)		= "search.qq.com"
Lang_sc_engine(14,1)		= "QQ"

Lang_sc_engine(15,0)		= "search.msn.com"
Lang_sc_engine(15,1)		= "MSN"

Lang_sc_engine(16,0)		= ".yisou."
Lang_sc_engine(16,1)		= "一搜"


Lang_Login		= "管理员登录"
Lang_Login_Tips	= "超级管理员请保持站点ID为空白。"
Lang_Login_ID	= "站点ID"
Lang_Login_UN	= "用户名"
Lang_login_PW	= "密码"
Lang_login_Err	= "登录失败！"
Lang_Login_submit	= "<a href='javascript:document.forms[0].submit();'>确认登录</a> <input type=""submit"" name=""cp"" class=""backc2"" value="" ""> &nbsp;"


Lang_Helps			= "统计系统帮助"
Lang_Help_Error		= "错误信息"
Lang_Help_Err(0)	= "站点名称、英文名称、介绍、英文介绍、管理员名、登录名和密码必须填写。"
Lang_Help_Err(1)	= "您没有查看这些统计数据的权限。"
Lang_Help_Err(2)	= "只有管理员才可以进行此操作。"
Lang_Help_Err(3)	= "只有超级管理员才可以进行此操作。"
Lang_Help_Err(4)	= "不存在这个站点，无法完成请求。"
Lang_Help_Err(5)	= "站点ID必须是数字。"
Lang_Help_Err(6)	= "登录失败次数过多，您的IP已被禁止。"
Lang_Help_Q(0)		= "为什么要为站点写英文名称和简介?"
Lang_Help_A(0)		= "　　阿江统计2.0或者更高版本是多语言版本的，不论浏览统计报告的人是使用何种语言，系统都会按照她们自己的语言来显示，如果没有对应的语言包，至少会以英文显示，这样，世界各地的访问者都可以看到自己能看得懂的统计报告了。<br>　　当统计报告的浏览者和站长使用不同的语言时，系统无法将站点介绍等信息自动翻译为访问者自己的语言或者英文，所以在站点信息中提供英文信息是必要的。"
Lang_Help_Q(1)		= "什么是大站模式? 什么时候需要使用大站模式? 如何设置大站模式?"
Lang_Help_A(1)		= "　　阿江统计2.0相对1.X版本增加了很多功能，并且在结构上做了大的调整，使它在较大的访问量下也可以正常工作。但是这不是无限制的，因为此版本增加了大量的统计项目，当访问量太大时，ACCESS数据库将被强迫工作在多进程状态下，这种状态很不稳定，随时可能损坏数据库文件，从而使统计效率大大较低，系统响应变慢，站点几近瘫痪。"
Lang_Help_A(1)		= Lang_Help_A(1) & "<br>　　为了使统计系统具有更强的承受力，2.0版专门为大流量站点设置了大站统计模式，简称“大站模式”，对于设置为大站模式的统计账号，系统除了记录流量信息外，最多仅再记录来路和关键词两项内容，并且限定对该账号（站点）的统计只使用指定的进程数，实践表明，这种方法使统计系统可以轻松承受超大的访问量，我们在日IP达5万的网站上测试，系统仍然非常稳定的工作，没有锁死和漏统计现象。"
Lang_Help_A(1)		= Lang_Help_A(1) & "<br>　　当网站日访问量在1万以上时就应该考虑使用大站模式了（少于1万/日的网站完全可以在普通模式下正常统计），但是对于性能较好的服务器，仍然可以使用普通模式。当日访问量在3万以上时，请一定使用大站模式，虽然不使用大站模式，在短时间内似乎并没有任何问题，但是问题是随时都可能出现的。"
Lang_Help_A(1)		= Lang_Help_A(1) & "<br>　　将站点设置到大站模式的方法是：登录进入超管平台，打开统计账号（站点）列表，点击相应站点后的“改”连接，在新的页面中，将进程限制设置为大于0的数字并确定。"
Lang_Help_Q(2)		= "当服务器不支持FSO时, 如何修改全局选项?"
Lang_Help_A(2)		= "　　登录FTP，下载 inc_config.asp ，用文本编辑器打开它，按照文件中的提示修改相应的选项后保存，然后重新上传这个文件即可。"
Lang_Help_Q(3)		= "当服务器不支持FSO时, 如何启动和停止统计系统?"
Lang_Help_A(3)		= "　　登录FTP，下载 inc_config_isCan.asp ，用文本编辑器打开它，将等号后的内容改为“true%&gt;”，保存并上传，系统将出于运行状态。相反，改为“false%&gt;”保存并上传，则系统将停止统计。"
Lang_Help_Q(4)		= "统计系统的权限是如何划分的?"
Lang_Help_A(4)		= "　　访客分为三个等级: 0 不允许浏览统计数据、1 仅允许浏览概况、2 可以浏览所有统计数据；管理员分为两个等级: 站点管理员，允许修改某一个统计账号（站点）的信息和部分参数，超级管理员，拥有所有权力。"
Lang_Help_Q(5)		= "嵌入代码助手中的条件如何填写?"
Lang_Help_A(5)		= "　　<b>选择显示外观</b>: 对于预设的外观如果看不懂提示，可以一个一个试验查看效果。这里需要说明的是图形数字，图形数字是指使用数字图片（以某个数字为内容的小图片）替换了数字本身的图片串，这样可以使输出的数字更加美观。"
Lang_Help_A(5)		= Lang_Help_A(5) & "<br>　　<b>自定义显示外观</b>: 这个可以让用户轻松的根据自己的意愿输出自己想要的统计结果样式，只要填写合适的模板字串就可以了。"
Lang_Help_A(5)		= Lang_Help_A(5) & "<br>　　<b>模板字串</b>: 模板字串就像您网页上的HTML内容是一样的，不同的只是可以用一系列以美元符号开头的特殊字符来代替统计结果，这些以美元符号开头的特殊字符在显示输出时将被替换为相应的统计数据。比如当模板字串为<br>　　<font class=""fonts"">当前在线人数是: $online</font><br>时，嵌入代码将被显示为<br>　　<font class=""fonts"">当前在线人数是: 28</font><br>其中的28就是实际的在线人数。详细的特殊字符替换表如下:"
Lang_Help_A(5)		= Lang_Help_A(5) & "<ul><li>$total → 总访问量<li>$totalv → 总浏览量<li>$today → 今日访问量<li>$todayv → 今日浏览量<li>$yesterday → 昨日访问量<li>$yesterdayv → 昨日浏览量<li>$user → 当前浏览者访问量<li>$userv → 当前浏览者浏览量<li>$online → 在线用户数</ul>将上述特殊字串中的$替换为$p_时，将以数字图片显示相应的数字。"
Lang_Help_A(5)		= Lang_Help_A(5) & "<br>　　<b>输出参数</b>: 数字图片边框是指当以图形数字显示时在所有数字外面包围的线框，该线框的颜色、宽度均可自定义。通过设置不同的数字图片路径可以得到不同的显示外观，本系统自带了三种数字图片，分别位于系统下的“Numpic/001”/“Numpic/002”/“Numpic/003”，将数字图片路径设置为以上三个字串之一即可。如果您有自己的数字图片，可以在这里填写数字图片所在的文件夹的URL，因为嵌入代码不一样是使用在同一个服务器，所以这里最好填写绝对路径，比如 http://www.aji"& "ang.net/mystat/numpic/001 等。"
Lang_Help_A(5)		= Lang_Help_A(5) & "<br>　　数字最小位数: 比如，当此参数设置为 5 时，则 355 将显示为 00355 。"
Lang_Help_Q(6)		= "如何获得本系统的最新版本?"
Lang_Help_A(6)		= "　　付费用户将得到新版本预告，并将在升级过程中得到必要的协助。免费用户请关注 <a href=""http://www.aj"&"iang.net"" target=""_blank"">www.ajiang.net</a> 的相应栏目。。"
Lang_Help_Q(7)		= "阿江统计2.1版权信息"
Lang_Help_A(7)		= "　　阿江酷站访问统计系统 (简称“阿江统计”) 版权归阿江 (ajiang.net) 所有。它是共享软件，在企业网站、商业网站、有盈利或以盈利为目的的个人网站上使用时需付费。付费用户仅得到本系统的拷贝在指定网站上的使用权，作者保留与该软件有关的所有权利。<br>　　付费用户在承认阿江 (ajiang.net) 拥有本系统的版权的前提下，经阿江同意后，可删除程序显示的版权信息。"


Lang_Help_List		= "查看所有帮助主题"
Lang_Help_Go		= "[<a href='javascript:history.back()'>返回上一页</a>] <a href='javascript:history.back()'><img src=""style/images/arbutton.gif"" align=""absmiddle"" border=""0""></a>"

Lang_Left_MM		= "站点管理"
Lang_Left_MM1		= "参数设置"
Lang_Left_MM2		= "站点/站长信息"
Lang_Left_MM3		= "嵌入代码助手"
Lang_Left_MM4		= "大站模式重置"
Lang_Left_MM5		= "退出"

Lang_Left_PV		= "流量分析"
Lang_Left_Today		= "今日详情"
Lang_Left_Yesterday	= "昨日详情"

Lang_Left_Client	= "客户端"
Lang_Left_Like		= "受欢迎度"
Lang_Left_Con		= "内容分析"
Lang_Left_BigSite	= "大站模式"

' ===================== 下面的代码不要修改 ========================
' 替换文本
Lang_LastUser_Tips		= replace(Lang_LastUser_Tips,"$Site_SaveNum",Site_SaveNum)

%>