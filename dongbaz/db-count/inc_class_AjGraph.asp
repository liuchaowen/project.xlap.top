<%

' ======================================================================
'
' 阿江统计绘图类  阿江版权所有，引用时请保持完成性并请勿删除版权信息
' 
' ArrData(x,y) 数组中y的含义
' 0 详细说明，1 简要说明，2 访问量，3 访问量比例%，4 浏览量，5 浏览量比例%，6 鼠标右键文字
'
' Gra(gtype) 中gtype的含义
' 横图 D 叠放柱图，B 并排柱图，I 仅访问量，V 仅浏览量
'      T 表格
' 竖图 d 叠放柱图，b 并排柱图，i 仅访问量，v 仅浏览量
'
' ======================================================================
class AjGraph
  public ColWidth,RowModel,MouseModel,TabRow,TabHeader,ArrData(),TotalI,TotalV
  private arX,arY,Max4I,Max4V,Max4All,BorModel,UprModel,TabModel,Back_L,Back_M,Back_R,B2_T,B2_B,B2_M,MaxI,MaxV

  Private Sub Class_Initialize()
    TotalI = 0
    TotalV = 0
    MaxI = 0
    MaxV = 0
    Back_L = "style/images/tu_back_left.gif"
    Back_M = "style/images/tu_back.gif"
    Back_R = "style/images/tu_back_right.gif"
    B2_T = "style/images/tu_back_up.gif"
    B2_M = "style/images/tu_back_2.gif"
    B2_B = "style/images/tu_back_down.gif"
    BorModel = "<table border=""0"" cellpadding=""0"" cellspacing=""0"" align=""center"">" _
			& vbcrlf & "<tr>" _
			& vbcrlf & "<td valign=""top"" rowspan=""2""><p align=""right"" style=""line-height: 12px; margin-right: 2"">$a<br><br>0</p></td>" _
			& vbcrlf & "<td width=""10"" valign=""top""><img src="""&Back_L&""" width=""10""></td>" _
			& vbcrlf & "$b" _
			& vbcrlf & "<td width=""10"" valign=""top""><img src="""&Back_R&""" width=""10""></td></tr>" _
			& vbcrlf & "<tr height=""20"" align=""center"" style=""letter-spacing:-2;font-family:Arial;font-size:12px""><td></td>" _
			& vbcrlf & "$c" _
			& vbcrlf & "<td></td></tr></table>"
	UprModel = "<table border=""0"" cellpadding=""0"" cellspacing=""0"" align=""center"">" _
			& vbcrlf & "<tr height=""16""><td></td><td>&nbsp;</td></tr>" _
			& vbcrlf & "<tr height=""12""><td></td><td valign=""bottom"" width=""101""><img src="""&B2_T&"""></td></tr>" _
			& vbcrlf & "$d" _
			& vbcrlf & "<tr height=""12""><td></td><td valign=""top""><img src="""&B2_B&"""></td></tr>" _
			& vbcrlf & "</table>"
	TabModel = "<table border=""0"" cellpadding=""0"" cellspacing=""0"" align=""center"">" _
			& vbcrlf & "$e"  _
			& vbcrlf &  "<tr height=""12""><td colspan=""$f""><hr size=""1"" class=""fonts""></td></tr>" _
			& vbcrlf & "$g" _
			& vbcrlf &  "<tr height=""12""><td colspan=""$f""><hr size=""1"" class=""fonts""></td></tr>" _
			& vbcrlf & "</table>"
  end sub

  ' 重定义数组
  public sub reArr(arrX,arrY)
    redim ArrData(arrX,arrY)
    arX=arrX
    arY=arrY
  end sub

  ' 执行运算  
  public sub Exec()
    on error resume next
    for i=0 to arX
	  TotalI = TotalI + ArrData(i,2)
	  TotalV = TotalV + ArrData(i,4)
	  if ArrData(i,2)>MaxI then MaxI=ArrData(i,2)
	  if ArrData(i,4)>MaxV then MaxV=ArrData(i,4)
    next
    if TotalI>0 then
      for i=0 to arX
        ArrData(i,3) = formatnumber(round(Arrdata(i,2)*100/TotalI,1),1,true)
      next
    end if
    if TotalV>0 then
      for i=0 to arX
        ArrData(i,5) = formatnumber(round(ArrData(i,4)*100/TotalV),1,true)
      next
    end if
    for i=0 to arX
      ArrData(i,6)=MouseModel
      for j= arY to 0 step -1
        ArrData(i,6) = replace(ArrData(i,6),"$" & j,ArrData(i,j))
      next
    next
	Max4I = findmax4(MaxI)
	Max4V = findmax4(MaxV)
	if Max4V>Max4I then
	  Max4All = Max4V
	else
	  Max4All = Max4I
	end if
  end sub
  
  ' 绘制访问量横图
  public function Gra(gType)
    dim str1,str2,str3
    select case gType
	  ' 横图
	  case "B"		' 并排 访问量浏览量组合图
	    str1 = Max4All & "<br><br>" & Max4All*3/4 & "<br><br>" & Max4All/2 & "<br><br>" & Max4All/4
		for i=0 to arX
	      str2 = str2 & "<td align=""center"" valign=""bottom"" width="""&ColWidth&""" background="""&back_M&""" title="""&ArrData(i,6)&"""><span " _
				& "class=""gra"" style=""width:5;height:"&ArrData(i,4)*100/Max4All&"""></span><span class=""gra2"" style=""width:5;height:"&ArrData(i,2)*100/Max4All&""">" _
				& "</span></td>"
		  str3 = str3 & "<td width="""&ColWidth&""" title="""&ArrData(i,6)&""">" & ArrData(i,1) & "</td>"
	    next
	  case "D"		' 堆叠 访问量浏览量组合图
	    str1 = Max4All & "<br><br>" & Max4All*3/4 & "<br><br>" & Max4All/2 & "<br><br>" & Max4All/4
		for i=0 to arX
	      str2 = str2 & "<td align=""center"" valign=""bottom"" width="""&ColWidth&""" background="""&back_M&""" title="""&ArrData(i,6)&"""><span " _
				& "class=""gra2"" style=""width:10;height:"&ArrData(i,4)*100/Max4All&"""><span class=""gra"" style=""width:10;border:0px;height:"&(ArrData(i,4)-ArrData(i,2))*100/Max4All&"""></span>" _
				& "</span></td>"
		  str3 = str3 & "<td width="""&ColWidth&""" title="""&ArrData(i,6)&""">" & ArrData(i,1) & "</td>"
	    next
	  case "I"		' 访问量图
	    str1 = Max4I & "<br><br>" & Max4I*3/4 & "<br><br>" & Max4I/2 & "<br><br>" & Max4I/4
		for i=0 to arX
	      str2 = str2 & "<td align=""center"" valign=""bottom"" width="""&ColWidth&""" background="""&back_M&""" title="""&ArrData(i,6)&"""><span " _
				& "class=""gra2"" style=""width:10;height:"&ArrData(i,2)*100/Max4I&"""></span></td>"
		  str3 = str3 & "<td width="""&ColWidth&""" title="""&ArrData(i,6)&""">" & ArrData(i,1) & "</td>"
	    next
	  case "V"		' 浏览量图
	    str1 = Max4V & "<br><br>" & Max4V*3/4 & "<br><br>" & Max4V/2 & "<br><br>" & Max4V/4
		for i=0 to arX
	      str2 = str2 & "<td align=""center"" valign=""bottom"" width="""&ColWidth&""" background="""&back_M&""" title="""&ArrData(i,6)&"""><span " _
				& "class=""gra"" style=""width:10;height:"&ArrData(i,4)*100/Max4V&"""></span></td>"
		  str3 = str3 & "<td width="""&ColWidth&""" title="""&ArrData(i,6)&""">" & ArrData(i,1) & "</td>"
	    next
	  ' 竖图
	  case "d"		' 堆叠图
		for i=0 to arX
	      str1 = str1 & "<tr height=""16"" title="""&ArrData(i,6)&"""><td align=""right"">"&ArrData(i,1)&"&nbsp;</td><td background="""&B2_M&"""><span class=""gra2"" style=""width:"&ArrData(i,2)*100/Max4All&";height:10;border-left:#000000 1px solid;border-bottom:none""></span><span class=""gra"" style=""width:"&ArrData(i,4)*100/Max4All-ArrData(i,2)*100/Max4All&";height:10;border:none""></span></td></tr>"
	    next
	  case "b"		' 并排图
		for i=0 to arX
	      str1 = str1 & "<tr height=""16"" title="""&ArrData(i,6)&"""><td align=""right"">"&ArrData(i,1)&"&nbsp;</td><td background="""&B2_M&"""><span class=""gra2"" style=""width:"&ArrData(i,2)*100/Max4All&";height:5;border-left:#000000 1px solid;border-bottom:none""></span><br><span class=""gra"" style=""width:"&ArrData(i,4)*100/Max4All&";height:5;border-left:#000000 1px solid;border-bottom:none""></span></td></tr>"
	    next
	  case "i"		' 访问量图
		for i=0 to arX
	      str1 = str1 & "<tr height=""16"" title="""&ArrData(i,6)&"""><td align=""right"">"&ArrData(i,1)&"&nbsp;</td><td background="""&B2_M&"""><span class=""gra2"" style=""width:"&ArrData(i,2)*100/Max4I&";height:10;border-left:#000000 1px solid;border-bottom:none""></span></td></tr>"
	    next
	  case "v"		' 浏览量图
		for i=0 to arX
	      str1 = str1 & "<tr height=""16"" title="""&ArrData(i,6)&"""><td align=""right"">"&ArrData(i,1)&"&nbsp;</td><td background="""&B2_M&"""><span class=""gra"" style=""width:"&ArrData(i,4)*100/Max4V&";height:10;border-left:#000000 1px solid;border-bottom:none""></span></td></tr>"
	    next
	end select

	if gType= "D" or gType= "B" or gType= "I" or gType= "V" then
	  Gra = replace(replace(replace(BorModel,"$a",str1),"$b",str2),"$c",str3)
	else
	  Gra = replace(UprModel,"$d",str1)
	end if
	
	Gra=vbcrlf & "<!--A"&"j"&"ia"&"ng Stat 2.0-->" & vbcrlf & Gra & vbcrlf & "<!--A"&"j"&"ia"&"ng Stat 2.0-->" & vbcrlf

  end function

  function TabGra(tCols)
    dim str1,str2
    for i=0 to arX
	  str2 = TabRow
      for j=arY to 0 step -1
	    str2=replace(str2,"$" & j,ArrData(i,j))
      next
	  str1=str1 & str2
    next
	TabGra=replace(replace(replace(TabModel,"$e",TabHeader),"$f",tCols),"$g",str1)
  end function

  ' 找到一个合适的4的倍数
  private function findmax4(inmax)
    if inmax<=4 then
      findmax4=4
    elseif inmax<80 then
      findmax4 = (int(inmax/4)+1)*4
    elseif inmax<400 then
      findmax4 = (int(inmax/20)+1)*20
    elseif inmax<800 then
      findmax4 = (int(inmax/40)+1)*40
    elseif inmax<2000 then
      findmax4 = (int(inmax/80)+1)*80
    else
      findmax4 = (int(inmax/400)+1)*400
    end if
  end function
  
end class
%>