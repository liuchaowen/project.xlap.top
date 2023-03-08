<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->
<%
Response.Write replace(Style_Header2,"$Title",Lang_sAdmin_Me)
%>
<frameset cols="170,*" frameborder="NO" border="0" framespacing="0" rows="*"> 
  <frame name="countleftadmin" scrolling="auto" noresize src="sAdmin_left.asp">
  <frame name="ajstatmainadmin<%=CFG_cachename%>" src="sadmin_main.asp">
</frameset>
<noframes>
<body>
<a href="main.asp">noframes</a>
</body>
</noframes> 
</html>