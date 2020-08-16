import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fluttertoast/fluttertoast.dart';

//local import
import 'package:samsi/components/horizontal_listview.dart';
import 'package:samsi/components/products.dart';
import 'package:samsi/pages/product_details.dart';
import 'package:samsi/pages/cart.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage(
            'images/c1.jpg',
          ),
          AssetImage(
            'images/m1.jpeg',
          ),
          AssetImage(
            'images/m2.jpg',
          ),
          AssetImage(
            'images/w1.jpeg',
          ),
          AssetImage(
            'images/w3.jpeg',
          ),
          AssetImage(
            'images/w4.jpeg',
          ),
          AssetImage(
            'images/dangdat.jpg',
          ),
          AssetImage(
            'images/bag.jpg',
          ),
          AssetImage(
            'images/beans.jpg',
          ),
          AssetImage(
            'images/table.jpg',
          ),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 6.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          title: Center(
              child: Text(
                'samsi',
              )),
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
            new IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
                })
          ],
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              //header
              new UserAccountsDrawerHeader(
                accountName: Text('Dangdat Raymond'),
                accountEmail: Text('realdangdat@samsi.ng'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: new BoxDecoration(color: Colors.pink),
              ),
//body
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    'Home',
                  ),
                  leading: Icon(
                    Icons.home,
                    color: Colors.red,
                  ),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    'My Account',
                  ),
                  leading: Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    'My Orders',
                  ),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: Colors.red,
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
                },
                child: ListTile(
                  title: Text(
                    'Shopping Card',
                  ),
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                  ),
                ),
              ),

              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    'Favourites',
                  ),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),

              Divider(),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    'Settings',
                  ),
                  leading: Icon(
                    Icons.settings,
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Fluttertoast.showToast(msg: "Coming soon bro!");
                },
                child: ListTile(
                  title: Text(
                    'About',
                  ),
                  leading: Icon(
                    Icons.help,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: new Column(
          children: <Widget>[
            //image carousel begins here
            image_carousel,
            //padding widget
            new Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: new Text(
                    "Categories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
            ),

            //Horizontal list view begins here
            HorizontalList(),

            new Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: new Text(
                    "Recent Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ),

            //grid view
            Flexible(child: Products()),
          ],
        ));
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
