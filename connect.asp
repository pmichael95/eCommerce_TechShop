<%
	'on error resume next
	set conn=Server.CreateObject("ADODB.Connection") 
	conn.provider="Microsoft.Jet.OLEDB.4.0"
	conn.open(server.mappath("database.mdb"))

	uname=Request.Form("username")
	pass=Request.Form("password")

	sql="INSERT INTO [User] ([UserName], [Password]) VALUES "
	sql=sql & "('" & uname & "','" & pass & "');"

	'Response.Write(sql)

	conn.Execute sql,recordsaffected
	if err <> 0 then
		Response.Write("You do not have permission to update this database!")
	else	
		'Response.Write(Recordsaffected & " record added")
		Response.write("Registration successful!")
		Response.Redirect("store.asp")
	end if
	conn.close
%>