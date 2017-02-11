<html>

<head>

  <title>.: TechnoShop - Login :.</title>

  <link rel='stylesheet' href='css\jqui.css'>

    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />

</head>

<body>
 <%
  CheckLogin
 %>

  <% Sub LoginForm %>
  <div class="login-card">
    <h1>Log-in</h1><br>

  <form action="login.asp" method="post">
    <input type="text" name="user" placeholder="Username">
    <input type="password" name="pass" placeholder="Password">
    <input type="submit" name="login" class="login login-submit" value="Login">
  </form>
  <% End Sub %>

  <% 
  Sub CheckLogin

    set conn=Server.CreateObject("ADODB.Connection") 
    conn.provider="Microsoft.Jet.OLEDB.4.0"
    conn.open(server.mappath("database.mdb"))

    dim rs
    set rs=Server.CreateObject("ADODB.recordset")

    dim query
    query = "SELECT [User].UserName, [User].Password FROM [User] WHERE [User].UserName='" & Request.Form("user") & "' AND [User].Password ='" & Request.Form("pass") & "';"
    rs.Open query, conn

    If rs.EOF Then
      LoginForm
    Else
      'UserLoggedIn is the var name
      Session("UserLoggedIn") = "true"
      Response.Redirect("store.asp")
    End If

    rs.Close
    conn.Close 

  End Sub
  %>


  <div class="login-help">
    <a href="register.asp">Register</a> | <a href="#">Forgot Password</a> | <a href="index.html">Home</a>
  </div>
</div>


  <script src='js\jquery_and_jqueryui.js'></script>

  <footer style="float:right;"><small>Copyright &copy; Philip Michael.</small></footer>

</body>

</html>