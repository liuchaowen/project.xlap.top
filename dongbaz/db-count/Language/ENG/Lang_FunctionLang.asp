<%
function cClienteng(strcj,tClient)
  select case tClient
  case 2
    cClienteng=clang(strcj)
  case 4
    cClienteng=replace(strcj,",","¡Á")
  case 5
    cClienteng="2<sup>" & strcj & "</sup> Colors"
  case 6
    cClienteng="Visit for " & strcj & " times"
  case 8
    cClienteng="View " & strcj & " Pages/Visitor"
  case else
    cClienteng=strcj
  end select
end function


function cLangeng(Langj)
  clangeng=langj
end function
%>