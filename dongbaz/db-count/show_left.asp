<!--#include file="inc_show.asp"-->
<%
Response.Write replace(Style_Header2,"$Title",Site_Name & "-" & Lang_Item_LastUser)
%>
<body topmargin="0" rightmargin="0" leftmargin="0" style="background-image:url('style/images/left_back.gif')">
<base target="ajstatmain<%=CFG_cachename%>">

  <SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
    var current;
	NS4 = (document.layers) ? 1 : 0;
    with (document) {
        write("<STYLE TYPE='text/css'>");
        if (NS4) {
            write(".hiddd {position:absolute; visibility:visible}");
        }
        else {
            write(".hiddd {display:none}")
        }
        write("</STYLE>");
    }

  var aj_img1=new Image();
  aj_img1.src="style/images/touming.gif";
  var aj_img2=new Image();
  aj_img2.src="style/images/icon_l.gif";
  var aj_img3=new Image();
  aj_img3.src="style/images/icon_k.gif";
  var aj_img4=new Image();
  aj_img4.src="style/images/icon_h.gif";

  // convert all characters to lowercase to simplify testing 
  var agt=navigator.userAgent.toLowerCase();
  // Note: On IE5, these return 4, so use is_ie5up to detect IE5. 
  var is_major = parseInt(navigator.appVersion); 
  var is_minor = parseFloat(navigator.appVersion); 
  var is_nav  = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1) 
                && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1) 
                && (agt.indexOf('webtv')==-1)); 
  var is_nav3 = (is_nav && (is_major == 3));
  var is_nav4up = (is_nav && (is_major >= 4));
  var is_ie   = (agt.indexOf("msie") != -1);
  var is_ie4up  = (is_ie  && (is_major >= 4));
  

	function headerDisplay(fordiv)
	{ 
      var headerBox, visible, hidden, toit, ccimg;
	
	  if((is_nav4up || is_ie4up))
	  {
        if (document.layers)
	    {
	      visible = 'show';
		  hidden = 'hide';
		  headerBox = document.layers[fordiv];
		  ccimg = document.layers[fordiv + 'i'];
		  if (headerBo.visibility==visible) {
			  headerBo.visibility=hidden;
			  ccimg.src='style/images/icon_h.gif';
		  }
		  else
		  {
			  headerBo.visibility=visible;
			  ccimg.src='style/images/icon_k.gif';
	      }
	    }
	    else if (document.all)
	    {
			if (document.all(fordiv).style.display == 'none')
			{
			  document.all(fordiv).style.display = 'block';
			  document.all(fordiv+'i').src='style/images/icon_k.gif'
			}
			else
			{
			  document.all(fordiv).style.display = 'none';
			  document.all(fordiv+'i').src='style/images/icon_h.gif'
			}
	    }
		else if (document.getElementById)
		{
		  visible = 'visible';
		  hidden = 'hidden';
		  headerBox = document.getElementById(fordiv).style;
		  ccimg = document.getElementById(fordiv+'i');
		  if (headerBo.visibility==visible) {
			  headerBo.visibility=hidden;
			  ccimg.src='style/images/icon_h.gif'
		  }
		  else
		  {
			  headerBo.visibility=visible;
			  ccimg.src='style/images/icon_k.gif'
		  }
		}
      }
	  return;
	}
	
  </SCRIPT>
<table  border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#ffffff">
  <tr><td><img src="style/images/left_top.gif"></td></tr>
  <tr><td background="style/images/left_mid.gif">
    

<p style="line-height: 110%; margin-left: 18; margin-right: 0; margin-top: 0; margin-bottom: 0">
<img src="style/images/icon_l.gif"> <a href="show_main.asp?siteid=<%=siteid%>"><%=Lang_Item_Main%></a><br>
<%if CFG_SaveOnline then%><img src="style/images/icon_l.gif"> <a href="show_online.asp?siteid=<%=siteid%>"><%=Lang_Item_Online%></a><br><%end if%>
<img src="style/images/icon_l.gif"> <a href="show_LastUser.asp?siteid=<%=siteid%>"><%=Lang_Item_LastUser%></a><br>


<span onclick="javascript:headerDisplay('aa');"><img id="aai" name="aai" src="style/images/icon_k.gif"> <%=Lang_Left_PV%><br></span>
  <span name="aa" id="aa">
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_hour.asp?siteid=<%=siteid%>"><%=Lang_Item_hour%></a><br>
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_day.asp?siteid=<%=siteid%>"><%=Lang_Item_Day%></a><br>
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_month.asp?siteid=<%=siteid%>"><%=Lang_Item_Month%></a><br>
  </span>
<%if Site_Bigsite = 0  then%>


<span onclick="javascript:headerDisplay('bb');"><img id="bbi" name="bbi" src="style/images/icon_h.gif"> <%=Lang_Left_Today%><br></span>
  <span name="bb" id="bb" class="hiddd" style="display:none">
<%if site_CanS(9) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_S_Engine.asp?siteid=<%=siteid%>&D=T"><%=Lang_Item_S_Engine%></a><br><%end if%>
<%if site_CanS(11) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=2&D=T"><%=Lang_Item_OP(2)%></a><br><%end if%>
<%if site_CanS(0) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=0&D=T"><%=Lang_Item_Client(0)%></a><br><%end if%>
<%if site_CanS(1) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=1&D=T"><%=Lang_Item_Client(1)%></a><br><%end if%>
<%if site_CanS(5) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=5&D=T"><%=Lang_Item_Client(5)%></a><br><%end if%>
<%if site_CanS(4) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=4&D=T"><%=Lang_Item_Client(4)%></a><br><%end if%>
<%if site_CanS(2) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=2&D=T"><%=Lang_Item_Client(2)%></a><br><%end if%>
<%if site_CanS(3) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=3&D=T"><%=Lang_Item_Client(3)%></a><br><%end if%>
<%if site_CanS(12) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=3&D=T"><%=Lang_Item_OP(3)%></a><br><%end if%>
<%if site_CanS(7) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=7&D=T"><%=Lang_Item_Client(7)%></a><br><%end if%>
<%if site_CanS(6) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=6&D=T"><%=Lang_Item_Client(6)%></a><br><%end if%>
<%if site_CanS(8) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=8&D=T"><%=Lang_Item_Client(8)%></a><br><%end if%>
<%if site_CanS(10) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=1&D=T"><%=Lang_Item_OP(1)%></a><br><%end if%>
<%if site_CanS(9) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=0&D=T"><%=Lang_Item_OP(0)%></a><br><%end if%>
<%if site_CanS(13) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=4&D=T"><%=Lang_Item_OP(4)%></a><br><%end if%>
  </span>


<span onclick="javascript:headerDisplay('cc');"><img id="cci" name="cci" src="style/images/icon_h.gif"> <%=Lang_Left_Yesterday%><br></span>
  <span name="cc" id="cc" class="hiddd" style="display:none">
<%if site_CanS(9) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_S_Engine.asp?siteid=<%=siteid%>&D=Y"><%=Lang_Item_S_Engine%></a><br><%end if%>
<%if site_CanS(11) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=2&D=Y"><%=Lang_Item_OP(2)%></a><br><%end if%>
<%if site_CanS(0) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=0&D=Y"><%=Lang_Item_Client(0)%></a><br><%end if%>
<%if site_CanS(1) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=1&D=Y"><%=Lang_Item_Client(1)%></a><br><%end if%>
<%if site_CanS(5) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=5&D=Y"><%=Lang_Item_Client(5)%></a><br><%end if%>
<%if site_CanS(4) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=4&D=Y"><%=Lang_Item_Client(4)%></a><br><%end if%>
<%if site_CanS(2) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=2&D=Y"><%=Lang_Item_Client(2)%></a><br><%end if%>
<%if site_CanS(3) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=3&D=Y"><%=Lang_Item_Client(3)%></a><br><%end if%>
<%if site_CanS(12) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=3&D=Y"><%=Lang_Item_OP(3)%></a><br><%end if%>
<%if site_CanS(7) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=7&D=Y"><%=Lang_Item_Client(7)%></a><br><%end if%>
<%if site_CanS(6) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=6&D=Y"><%=Lang_Item_Client(6)%></a><br><%end if%>
<%if site_CanS(8) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=8&D=Y"><%=Lang_Item_Client(8)%></a><br><%end if%>
<%if site_CanS(10) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=1&D=Y"><%=Lang_Item_OP(1)%></a><br><%end if%>
<%if site_CanS(9) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=0&D=Y"><%=Lang_Item_OP(0)%></a><br><%end if%>
<%if site_CanS(13) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=4&D=Y"><%=Lang_Item_OP(4)%></a><br><%end if%>
  </span>

<%if site_CanS(9) or site_CanS(11) then%>
<span onclick="javascript:headerDisplay('dd');"><img id="ddi" name="ddi" src="style/images/icon_k.gif"> <%=Lang_Item_S_Engine%><br></span>
  <span id="dd" name="dd">
<%if site_CanS(9) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_S_Engine.asp?siteid=<%=siteid%>"><%=Lang_Item_S_Engine%></a><br><%end if%>
<%if site_CanS(11) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=2"><%=Lang_Item_OP(2)%></a><br><%end if%>
  </span>
<%end if%>


<%if site_CanS(0) or site_CanS(1) or site_CanS(5) or site_CanS(4) or site_CanS(2) or site_CanS(3) or site_CanS(12) or site_CanS(7) then%>
<span onclick="javascript:headerDisplay('ee');"><img id="eei" name="eei" src="style/images/icon_h.gif"> <%=Lang_Left_Client%><br></span>
  <span name="ee" id="ee" class="hiddd" style='display:none'>
<%if site_CanS(0) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=0"><%=Lang_Item_Client(0)%></a><br><%end if%>
<%if site_CanS(1) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=1"><%=Lang_Item_Client(1)%></a><br><%end if%>
<%if site_CanS(5) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=5"><%=Lang_Item_Client(5)%></a><br><%end if%>
<%if site_CanS(4) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=4"><%=Lang_Item_Client(4)%></a><br><%end if%>
<%if site_CanS(2) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=2"><%=Lang_Item_Client(2)%></a><br><%end if%>
<%if site_CanS(3) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=3"><%=Lang_Item_Client(3)%></a><br><%end if%>
<%if site_CanS(12) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=3"><%=Lang_Item_OP(3)%></a><br><%end if%>
<%if site_CanS(7) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=7"><%=Lang_Item_Client(7)%></a><br><%end if%>
  </span>
<%end if%>

<%if site_CanS(6) or site_CanS(8) then%>
<span onclick="javascript:headerDisplay('ff');"><img id="ffi" name="ffi" src="style/images/icon_k.gif"> <%=Lang_Left_Like%><br></span>
  <span name="ff" id="ff">
<%if site_CanS(6) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=6"><%=Lang_Item_Client(6)%></a><br><%end if%>
<%if site_CanS(8) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_Client.asp?siteid=<%=siteid%>&C=8"><%=Lang_Item_Client(8)%></a><br><%end if%>
  </span>
<%end if%>


<%if site_CanS(10) or site_CanS(9) or site_CanS(13) then%>
<span onclick="javascript:headerDisplay('gg');"><img id="ggi" name="ggi" src="style/images/icon_k.gif"> <%=Lang_Left_Con%><br></span>
  <span name="gg" id="gg">
<%if site_CanS(10) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=1"><%=Lang_Item_OP(1)%></a><br><%end if%>
<%if site_CanS(9) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=0"><%=Lang_Item_OP(0)%></a><br><%end if%>
<%if site_CanS(13) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_OP.asp?siteid=<%=siteid%>&O=4"><%=Lang_Item_OP(4)%></a><br><%end if%>
  </span>
<%end if%>


<%else%>


<span onclick="javascript:headerDisplay('hh');"><img id="hhi" name="hhi" src="style/images/icon_k.gif"> <%=Lang_Left_BigSite%><br></span>
  <span name="hh" id="hh">
<%if site_CanS(9) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_BigSite.asp?siteid=<%=siteid%>&B=0"><%=Lang_Item_OP(0)%></a><br><%end if%>
<%if site_CanS(9) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_S_Engine.asp?siteid=<%=siteid%>"><%=Lang_Item_S_Engine%></a><br><%end if%>
<%if site_CanS(11) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_BigSite.asp?siteid=<%=siteid%>&B=2"><%=Lang_Item_OP(2)%></a><br><%end if%>
<%if site_CanS(13) then%><img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="show_BigSite.asp?siteid=<%=siteid%>&B=4"><%=Lang_Item_OP(4)%></a><br><%end if%>
  </span>
<%end if%>

<%if isM=false and isSM=false then%>
<img src="style/images/icon_l.gif"> <a href="login.asp?siteid=<%=siteid%>"><%=Lang_Login%></a><br>
<%else%>
<span onclick="javascript:headerDisplay('ii');"><img id="iii" name="iii" src="style/images/icon_k.gif"> <%=Lang_Left_MM%><br></span>
  <span name="ii" id="ii">
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="Admin_O.asp?siteid=<%=siteid%>"><%=Lang_Left_MM1%></a><br>
	<img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="Admin_D.asp?siteid=<%=siteid%>"><%=Lang_Left_MM2%></a><br>
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="Admin_S.asp?siteid=<%=siteid%>"><%=Lang_Left_MM3%></a><br>
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="Admin_Clear.asp?siteid=<%=siteid%>"><%=Lang_Left_MM4%></a><br>
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="login.asp?out=1&siteid=<%=siteid%>" target="_top"><%=Lang_Left_MM5%></a><br>
  </span>

<%end if%>
  </td></tr>
  <tr><td><a href="LangTZone.asp?siteid=<%=siteid%>" title="Select Language or TimeZone"><img src="style/images/left_bo.gif" border="0"></a></td></tr>
</table>
</body>
</html>
