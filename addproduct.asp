<%
	'on error resume next
	set conn=Server.CreateObject("ADODB.Connection") 
	conn.provider="Microsoft.Jet.OLEDB.4.0"
	conn.open(server.mappath("database.mdb"))

	productName = Request.ServerVariables("QUERY_STRING")
	dim price

	select case productName
		case "i7"
			price = 350
		case "ram"
			price = 90
		case "g930"
			price = 100
		case "ssd"
			price = 75
		case else
			price = 0
	End select 


	sql="INSERT INTO [Basket] ( [" & productName & "], " & "[Price]) VALUES "
	sql=sql & "('" & productName & "', '" & price & "');"

	conn.Execute sql, recordsaffected

	Response.Redirect("store.asp")

	conn.close
%>