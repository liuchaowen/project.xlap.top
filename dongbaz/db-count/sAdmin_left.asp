<!--#include file="inc_config.asp"-->
<!--#include file="inc_Lang_admin.asp"-->
<!--#include file="style/style_all.asp"-->
<!--#include file="inc_admin_functions.asp"-->
<%
Response.Write replace(Style_Header2,"$Title",Lang_sAdmin_Me)
%>
<body topmargin="0" rightmargin="0" leftmargin="0" style="background-image:url('style/images/left_back.gif')">
<base target="ajstatmainadmin<%=CFG_cachename%>">

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
<span onclick="javascript:headerDisplay('aa');"><img id="aai" name="aai" src="style/images/icon_k.gif"> <%=Lang_Left_Admin%><br></span>
  <span name="aa" id="aa">
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="sAdmin_main.asp"><%=Lang_Left_1%></a><br>
	<img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="sAdmin_Option.asp"><%=Lang_Left_2%></a><br>
	<img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="sAdmin_onoff.asp"><%=Lang_Left_3%></a><br>
	<img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="sAdmin_mdbcp.asp"><%=Lang_Left_4%></a><br>
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="sAdmin_sitelist.asp"><%=Lang_Left_5%></a><br>
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="sAdmin_SiteAdd.asp"><%=Lang_Left_6%></a><br>
  </span>
<span onclick="javascript:headerDisplay('bb');"><img id="bbi" name="bbi" src="style/images/icon_k.gif"> <%=Lang_Left_MM%><br></span>
  <span name="bb" id="bb">
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="Admin_O.asp"><%=Lang_Left_M1%></a><br>
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="sAdmin_SiteEdit.asp"><%=Lang_Left_M2%></a><br>
	<img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="Admin_D.asp"><%=Lang_Left_M3%></a><br>
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="Admin_S.asp"><%=Lang_Left_M4%></a><br>
    <img src="style/images/touming.gif" width="11"> <img src="style/images/icon_l.gif"> <a href="Admin_Clear.asp"><%=Lang_Left_M5%></a><br>
  </span>

<img src="style/images/icon_l.gif"> <a href="login.asp?out=1" target="_top"><%=Lang_Logout%></a><br>
<img src="style/images/icon_l.gif"> <a href="help.asp?siteid=<%=siteid%>"><%=Lang_Help%></a><br>

  </td></tr>
  <tr><td><img src="style/images/left_bo.gif"></td></tr>
</table>