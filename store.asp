<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">
<script src="script.js"></script>
	<title>.: TechnoShop - Store :.</title>
</head>
<body>
<hr>
<!-- Navigation Bar -->
<center><ul>
<li><a href="index.html">| Home |</a></li>
<li>&nbsp;<a href="store.asp">| Store |</a></li>
</ul></center>
<!-- End navbar -->
<hr>
<p style="float:right;"><a href="login.asp">Login</a>&nbsp;|&nbsp;<a href="register.asp">Register</a></p>
<br />
<br/>
<%
    dim conn
      set conn=Server.CreateObject("ADODB.Connection")
      conn.Provider="Microsoft.ACE.OLEDB.12.0"
      conn.Open "C:\inetpub\wwwroot\database.accdb"

      ' Create a record set
      dim rs
      set rs=Server.CreateObject("ADODB.recordset")
      
      ' Query Database
      dim query
      query = "SELECT ProductName, Price, Description, img, tagName FROM Product"
        rs.Open query, conn

      'Output products
      response.write("<ul>" & vbCrLf)
      do until rs.EOF
        response.write("<li>" & vbCrLf)
        response.write ("<div class='productImg'><img src='" & rs.fields.Item("img") & "' style='width:300;height:200;'></div>" & vbCrLf)
        response.write("<p>" & vbCrLf)
        response.write("<h3><a href='addproduct.asp?" & rs.fields.Item("tagName") & "' title='Add To Cart'>" & rs.fields.Item("ProductName") & "</a></h3>" & vbCrLf) 
        response.write("<p>" & rs.fields.Item("Description") & "</p>" & vbCrLf)
        response.write("$" & rs.fields.Item("Price") & vbCrLf)
        response.write("<br /><i><a href='" & rs.fields.Item("tagName") & ".html'>More Details</a></i>")
        response.write("</p>" & vbCrLf)  
        response.write("</li>" & vbCrLf)
        rs.MoveNext
      loop
      response.write("</ul>" & vbCrLf)

      rs.Close
conn.close

%>
<p style="float:left;"><a href="checkout.asp"><u>Checkout</u></a></p>

<footer>Copyright &copy; Philip Michael.</footer>
</body>
</html>