import 'package:flutter/material.dart';
import 'package:hexadairy_milkapp/addtocart.dart';
import 'package:hexadairy_milkapp/profile.dart';
import 'package:hexadairy_milkapp/homepagetry1.dart';

class cheesepro extends StatefulWidget {
  final String productName;
  final String productImage;

  cheesepro({required this.productName, required this.productImage});

  @override
  State<cheesepro> createState() => _cheeseproState();
}

class _cheeseproState extends State<cheesepro> {
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
            Text("Say CHEESE Everyday!!",
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
            //child: Image.asset("assets/images/milkbk.jpeg",fit:BoxFit.fill),
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
                    widget.productImage,
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
                      widget.productName,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(color: Colors.white,
                  child:
                  Text(   '\$199.99',    style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  )),
                ),
                Container(padding: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child:Text("Amul Slim 'n' Trim Double Toned Milk (Polypack),"
                      " as the name suggests, is treated twice to reduce fat to minimal."
                      " It is very high on calcium which makes it beneficial for bones. "
                      "It suits best for health conscious people as it helps maintain weight.",
                    style: TextStyle(fontSize: 18.0,
                        fontWeight: FontWeight.bold) ,
                  ),
                ),

                Text("500 ml",style: TextStyle(fontSize: 10),),
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
