import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      //create maps
      "name": "Blazer Male",
      "picture": "images/products/blazer1.jpeg",
      "price": 12500,
      "size": "M",
      "color": "Red",
      "quantity": 3,
    },
    {
      //create maps
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "price": 12000,
      "size": "7",
      "color": "Ash",
      "quantity": 1,
    },
    {
      //create maps
      "name": "Shoes",
      "picture": "images/products/hills1.jpeg",
      "price": 8000,
      "size": "7",
      "color": "Brown",
      "quantity": 4,
    },
    {
      //create maps
      "name": "Shoes",
      "picture": "images/products/hills2.jpeg",
      "price": 12000,
      "size": "7",
      "color": "Red",
      "quantity": 2,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_product_name: Products_on_the_cart[index]['name'],
            cart_product_color: Products_on_the_cart[index]["color"],
            cart_product_qty: Products_on_the_cart[index]["quantity"],
            cart_product_size: Products_on_the_cart[index]["size"],
            cart_product_price: Products_on_the_cart[index]["price"],
            cart_product_picture: Products_on_the_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;

  Single_cart_product({
    this.cart_product_name,
    this.cart_product_color,
    this.cart_product_picture,
    this.cart_product_price,
    this.cart_product_qty,
    this.cart_product_size,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//      =========================  THE LEADING SECTION TO DISPLAY IMAGE  ============================
        leading: new Image.asset(cart_product_picture),
//        ========================= THE TITLE SECTION TO DISPLAY THE PRODUCT NAME
        title: new Text(cart_product_name),
        
//        ============ SUBTITLE SECTION TO DISPLAY OTHER INFORMATION ABOUT THE PRODUCT
        subtitle: new Column(
          children: <Widget>[
//            ROW INSIDE THE COLUMN
            new Row(
              children: <Widget>[
//                this section is for the size of the product
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text(
                    "Size:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_product_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
//                ============================== This section is for the product color =====================================
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 2.0),
                  child: new Text("Color:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_product_color,
                      style: TextStyle(color: Colors.red)),
                ),
              ],
            ),

//            ============ THIS SECTION IS THE PRODUCT PRICE
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\N${cart_product_price}",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,
                color: Colors.red),
              ),
            )
          ],
        ),
        trailing: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
            new Text("${cart_product_qty}"),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
          ],
        ),
      ),
    ),
    );
  }
}
 