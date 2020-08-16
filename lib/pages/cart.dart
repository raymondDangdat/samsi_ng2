import 'package:flutter/material.dart';


//my imports
import 'package:samsi/components/card_products.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Center(
            child: Text(
              'Cart',
            )),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),

      //body part
      body: new Cart_products(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total Amount", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: new Text("\N44500", style: TextStyle(fontWeight: FontWeight.bold),),
            ),),

            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new MaterialButton(onPressed: (){},
              child: new Text("Check Out", style: TextStyle(color: Colors.white),),
              color: Colors.red,),
            ))
          ],
        ),
      ),
    );
  }
}
