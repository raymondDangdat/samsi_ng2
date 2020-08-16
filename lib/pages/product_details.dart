import 'package:flutter/material.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},
          child: Center(
              child: Text(
            'samsi',
          )),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          "\N${widget.product_detail_old_price}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: new Text(
                          "\N${widget.product_detail_new_price}",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          //===============The first buttons============
          Row(
            children: <Widget>[
              // ========== the size button ===========
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Sizes"),
                            content: new Text("Choose the size"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Size"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Colors"),
                            content: new Text("Choose a color"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Color"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Quantities"),
                            content: new Text("Choose the quantity"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Qty"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //===============The second buttons============
          Row(
            children: <Widget>[
              // ========== the buy button ===========
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                      onPressed: () {},
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 0.2,
                      child: new Text("Buy Now")),
                ),
              ),

              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {}),
            ],
          ),

          Divider(color: Colors.red,),
          new ListTile(
            title: new Text("Product Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            subtitle: new Text("This is the product details, it says everything you need to know about the product dispalyed above. This is the product details, it says everything you need to know about the product dispalyed above. This is the product details, it says everything you need to know about the product dispalyed above. This is the product details, it says everything you need to know about the product dispalyed above"),
          ),

          Divider(color: Colors.red,),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Product name", style: TextStyle(color: Colors.grey),),),

//              Remember to create the product brand
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),)
            ],
          ),

//          Add the product condition
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product brand", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Brand name"),),
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product condition", style: TextStyle(color: Colors.grey),),),

              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("NEW", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),)
            ],
          ),

      Divider(),
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text("Similar Products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      )),


//          SIMILAR PRODUCTS
        Container(
          height: 360.0,
          child: Similar_products(),
        )
        ],
      ),
    );
  }
}


class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      //create maps
      "name": "Blazer Male",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 15000,
      "price": 12500
    },
    {
      //create maps
      "name": "Blazer Lads",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 20000,
      "price": 12000
    },
    {
      //create maps
      "name": "Dress Red",
      "picture": "images/products/dress1.jpeg",
      "old_price": 10000,
      "price": 7000,
    },
    {
      //create maps
      "name": "Dress Black",
      "picture": "images/products/dress2.jpeg",
      "old_price": 10000,
      "price": 7000
    },
    {
      //create maps
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 12000,
      "price": 8000
    },
    {
      //create maps
      "name": "Hills Red",
      "picture": "images/products/hills2.jpeg",
      "old_price": 18000,
      "price": 12000
    },

    {
      //create maps
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "old_price": 18000,
      "price": 12000
    },
    {
      //create maps
      "name": "Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 9000,
      "price": 5000
    },
    {
      //create maps
      "name": "Skirt Rubber",
      "picture": "images/products/skt2.jpeg",
      "old_price": 8000,
      "price": 4500
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_product(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  Similar_Single_product({
    this.product_name,
    this.product_old_price,
    this.product_picture,
    this.product_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                    //passing the values of the product to the product details page
                    product_detail_name: product_name,
                    product_detail_new_price: product_price,
                    product_detail_old_price: product_old_price,
                    product_detail_picture: product_picture,
                  ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white,
                      child: new Row(children: <Widget>[
                        Expanded(
                          child: Text(product_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                        ),
                        new Text("\N${product_price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                      ],)
                  ),
                  child: Image.asset(
                    product_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}

