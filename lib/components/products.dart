import 'package:flutter/material.dart';
import 'package:samsi/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
      "name": "Pants Black",
      "picture": "images/products/pants1.jpg",
      "old_price": 8000,
      "price": 35000
    },
    {
      //create maps
      "name": "Pants Ash",
      "picture": "images/products/pants2.jpeg",
      "old_price": 8000,
      "price": 4000
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
    {
      //create maps
      "name": "Dress Black",
      "picture": "images/products/dress2.jpeg",
      "old_price": 10000,
      "price": 7000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_product(
              product_name: product_list[index]['name'],
              product_picture: product_list[index]['picture'],
              product_old_price: product_list[index]['old_price'],
              product_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  Single_product({
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
