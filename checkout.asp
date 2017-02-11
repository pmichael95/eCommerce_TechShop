<html>
<head>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<title>.: TechnoShop - Checkout :.</title>
</head>
<body>
<center><h1>Your shopping cart is...</h1></center>
<%
	set conn=Server.CreateObject("ADODB.Connection") 
    conn.provider="Microsoft.Jet.OLEDB.4.0"
    conn.open(server.mappath("database.mdb"))

    dim rs
    set rs=Server.CreateObject("ADODB.recordset")
    dim rs2
    set rs2=Server.CreateObject("ADODB.recordset")

    dim query
    query = "SELECT i7, ram, g930, ssd FROM [Basket];"
    rs.Open query, conn



    IF rs.EOF THEN
    	Response.write("Basket empty! Go <i><a href='store.asp'>shop</a></i>!")
    ELSE
	    do until rs.EOF
	    	IF rs.fields.Item("i7") = "i7" THEN
	    		Response.write("- Intel Core i7 <br />")
	    		Response.write(" ")
	    	END IF
	    	IF rs.fields.Item("ram") = "ram" THEN
	    		Response.write("- Kingston HyperX RAM Stick <br />")
	    		Response.write(" ")
	    	END IF
	    	IF rs.fields.Item("g930") = "g930" THEN
	    		Response.write("- Logitech G930 Gaming Headset <br />")
	    		Response.write(" ")
	    	END IF
	    	IF rs.fields.Item("ssd") = "ssd" THEN
	    		Response.write("- Kingston HyperX SSD <br />")
	    		Response.write(" ")
	    	END IF
	    	rs.MoveNext 
	    loop
	 END IF

	 dim query2
	 query2 = "SELECT [Price] FROM [Basket];"
	 rs2.Open query2, conn

	 dim total

	 do until rs2.EOF
	 	total = total + rs2.fields.Item("Price")
	 	rs2.MoveNext
	 loop

	 IF total <> 0 THEN
	 	Response.write("<br /><br /><b>Your Total Is: </b>" & total & ".00$ + tx")
	 ELSE
	 	Response.write("<br /><br /><b>Your Basket Is Empty! No total to display.</b>")
	 END IF

	 rs2.Close
     rs.Close
     conn.Close 
%>
<br />
<center><h2>Are you sure you wish to checkout?</h2>
<p><a href="check_out.asp">Yes!</a> | <a href="store.asp">No!</a></p></center>

</body>
</html>