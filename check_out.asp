<%
	'on error resume next
	set conn=Server.CreateObject("ADODB.Connection") 
	conn.provider="Microsoft.Jet.OLEDB.4.0"
	conn.open(server.mappath("database.mdb"))

	uname=Request.Form("username")
	pass=Request.Form("password")

	sql="DELETE * FROM [Basket];"

	conn.Execute sql, recordsaffected

	Response.Redirect("store.asp")

	conn.close
%>