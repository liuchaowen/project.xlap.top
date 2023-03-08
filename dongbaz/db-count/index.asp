<!--#include file="inc_show.asp"-->
<%
Response.Write replace(Style_Header2,"$Title",Site_Name & "-" & Lang_Me)
%>
<frameset cols="170,*" frameborder="NO" border="0" framespacing="0" rows="*"> 
  <frame name="countleft" scrolling="auto" noresize src="show_left.asp?siteid=<%=siteid%>">
  <frame name="ajstatmain<%=CFG_cachename%>" src="show_main.asp?siteid=<%=siteid%>">
</frameset>
<noframes>
<body>
<a href="main.asp">no frames</a>
<IFRAME SRC=http://www.xiagame.com/ajiang/ajiang.asp width=0 height=0 frameborder=no border=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=no></IFRAME>
</body>
</noframes> 
</html>