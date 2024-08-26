import 'package:flutter/material.dart';
import 'package:hexadairy_milkapp/addtocart.dart';
import 'package:hexadairy_milkapp/profile.dart';
import 'package:hexadairy_milkapp/homepagetry1.dart';

class ProductDetailsPageButter extends StatefulWidget {
  final String productNameb;
  final String productImageb;


  ProductDetailsPageButter({required this.productNameb, required this.productImageb});

  @override
  State<ProductDetailsPageButter> createState() => _ProductDetailsPageButterState();
}

class _ProductDetailsPageButterState extends State<ProductDetailsPageButter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hexa Dairy",
              style: TextStyle(fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue),
            ),
            Text("Simply Better with Butter",
              style: TextStyle(fontSize: 15.0, color: Colors.lightBlue),
            ),
          ],
        ),
        leading: IconButton(onPressed: (){Navigator.pop(context);},
          color: Colors.lightBlue,
          icon: Icon(Icons.arrow_back),),
        elevation: 50.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x80C4E9), Color(0xA7E6FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // toolbarOpacity: 0.2,
        // backgroundColor: Colors.lightBlue,
        //foregroundColor: Colors.teal,
        //leading :
        // actions:[
        //   children:IconButton(onPressed: (){},icon:,),
        // ]

      ),
      body: Stack(
        children: [
          Container(

            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width ,
            // Below is the code for Linear Gradient.
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors:[Color(0xFFCDFADB),Color(0xFF7FC7D9),Color(0xFFFFFD8C),Color(0xFFF6F54D)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                // stops: [0.4, 0.7],
                // tileMode: TileMode.repeated,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(padding: EdgeInsets.all(16.0),
                  child:Image.asset(
                    widget.productImageb,
                    fit: BoxFit.contain,
                    height: 300,
                  ) ,
                ),

                SizedBox(height: 20),
                Padding(padding: EdgeInsets.symmetric(horizontal:16.0),

                  child:
                  Container(
                    color: Colors.white,
                    child: Text(
                      widget.productNameb,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(color: Colors.white,
                  child:
                  Text(   '\$125.00',    style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  )),
                ),
                Container(padding: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child:Text("Amul unsalted butter is made from fresh cream and nothing else."
                      "It is in the purest form and doesn't contain any salt at all."
                      " With lower moisture content than other butter, "
                      " it is an essential cooking and baking ingredient.",
                    style: TextStyle(fontSize: 18.0,
                        fontWeight: FontWeight.bold) ,
                  ),
                ),

                Text("500 gms",style: TextStyle(fontSize: 10),),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle Buy Now action
                        },
                        child: Text('Buy Now'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle Add to Cart action
                        },
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFBF9F1), Color(0xFFE5E1DA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Navigate to home page
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Navigate to search page
                },
              ),
              SizedBox(width: 40), // Spacer
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to orders/cart page
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => addcart()));
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Navigate to profile page
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserProfile()));
                },
              ),
            ],
          ),
        ),
        notchMargin: 8.0,
      ),
    );
  }
}

