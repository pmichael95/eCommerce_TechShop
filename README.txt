		=== BY PHILIP MICHAEL [1279765] ===

In order to properly execute, operate, and manage the website, it MUST be in C:\inetpub\wwwroot
Once set, feel free to navigate to localhost and click on Store in the navigation bar.
Once there, click the name (title) of whichever product you're interested in.
That product will then be added to the .mdb database file in the Basket table with its corresponding price.

The .accdb table is used to get the product names, descriptions, and prices. 
The connect.asp lets you register (insert) into the database.

addproduct.asp adds a product to the .mdb database.

The checkout.asp file checks out the user's basket and calls the check_out.asp file to delete the rows.

CSS files for some components are found in the css folder.
Likewise for some JS files.

Individual .html files for every product contain detailed information accessible by More Details on the store.asp page.

