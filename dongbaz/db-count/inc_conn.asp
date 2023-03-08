<%
public conn
set conn=server.createobject("adodb.connection")
DBPath = Server.MapPath( CFG_Connpath )
conn.Open "driver={Microsoft Access Driver (*.mdb)};dbq=" & DBPath

sub closeconn
	conn.Close
	set conn=nothing
end sub
%>