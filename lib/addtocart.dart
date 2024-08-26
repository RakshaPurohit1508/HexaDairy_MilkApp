import 'package:flutter/material.dart';
import 'package:hexadairy_milkapp/homepagetry1.dart';
import 'package:hexadairy_milkapp/profile.dart';

class addcart extends StatefulWidget{
  @override
  State<addcart> createState() => _addcartState();
}

class _addcartState extends State<addcart> {
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
                  color: Colors.lightBlue,)
            ),
            Text("My cart",
              style: TextStyle(fontSize: 15.0, color: Colors.lightBlue),
            ),
          ],
        ),
        leading: IconButton(onPressed: (){;},
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
        //  toolbarOpacity: 0.2,
        //backgroundColor: Colors.lightBlue,
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
            //child: Image.asset("assets/images/milkbk.jpeg",fit:BoxFit.fill),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("assets/images/milkbck.jpeg"),
            //       fit: BoxFit.cover),
            //),
          ),

    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Icon(
    Icons.shopping_cart,
    size: 100.0,
    color: Colors.blue,
    ),
    SizedBox(height: 20.0),
    Text(
    'Your cart is empty',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 20.0),
    ElevatedButton(
    onPressed: () {
    // Define your navigation or action here
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    print('Shop Now button pressed');
    },
    child: Text('Shop Now'),
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