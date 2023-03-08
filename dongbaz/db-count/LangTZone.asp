<!--#include file="inc_show.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="Style/CSS.asp" rel="stylesheet" type="text/css">
<title>Language and TimaZone</title>
</head>
<body>
<%
Response.Write replace(Style_MainTop,"$MainName","Language and TimeZone")
%>

<table width="400" border="0" align="center" cellpadding="0" cellspacing="0">
  <form action="index.asp" method="post" target="_top">
  <input type="hidden" name="siteid" value="<%=siteid%>">
    <tr> 
      <td><p>请选择时区<br>
          請選擇時區<br>
          Please Select TimeZone</p>
        <p>
          <select name="TZone">
            <% for i = -12 to 13 %>
            <option value="<%=i %>" <%if clng(U_TZone)=clng(i) then response.write " Selected"%>> 
            <%=i %>
            </option>
            <% next %>
          </select>
        </p></td>
      <td><p>请选择语言<br>
          請選擇語言<br>
          Please Select Language</p>
        <p> 
          <select name="Lang">
            <option value="CHS"<%if U_Lang="CHS" then response.write " selected"%>>简体中文 </option>
            <option value="CHT"<%if U_Lang="CHT" then response.write " selected"%>>繁體中文 </option>
            <option value="ENG"<%if U_Lang="ENG" then response.write " selected"%>>English </option>
          </select>
        </p></td>
    </tr>
    <tr> 
      <td colspan="2"><br>
          <input type="submit" name="Submit" value="OK 确定 確定">
      </td>
    </tr>
  </form>
</table>
<%
Response.Write Style_MainBottom
%>