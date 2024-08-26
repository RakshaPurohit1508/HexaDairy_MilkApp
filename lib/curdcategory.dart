import 'package:flutter/material.dart';
import 'package:hexadairy_milkapp/curd.dart';
import 'package:hexadairy_milkapp/productcurd.dart';
import 'package:hexadairy_milkapp/homepagetry1.dart';
import 'package:hexadairy_milkapp/profile.dart';
import 'package:hexadairy_milkapp/addtocart.dart';


class Curdgrid extends StatefulWidget {
  @override
  State<Curdgrid> createState() => _CurdgridState();
}

class _CurdgridState extends State<Curdgrid> {
  final List<Map<String, String>> categories = [
    {"name": "ButterMilk", "image": "assets/images/buttermilk.png"},
    {"name": "Shrikhand", "image": "assets/images/shrikhand.jpg"},
    {"name": "Lassi", "image": "assets/images/sweet-lassi.jpg"},
    {"name": "Yogurt", "image": "assets/images/Yogurt.jpg"},

    // Add more categories as needed
  ];

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
            Text("A Cup Full of Happiness",
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
          //   //child: Image.asset("assets/images/milkbk.jpeg",fit:BoxFit.fill),
          //   //decoration: BoxDecoration(
          //     //image: DecorationImage(
          //         image: AssetImage("assets/images/milkbck.jpeg"),
          //         fit: BoxFit.cover),
          //   ),
          ),

          GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: categories.length,
            itemBuilder: (ctx, i) =>
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryDetailsPage(
                              categoryName: categories[i]['name']!,
                              categoryImage: categories[i]['image']!,
                            ),
                      ),
                    );
                  },
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: GridTile(
                      child: Image.asset(
                        categories[i]['image']!,
                        fit: BoxFit.cover,
                      ),
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(categories[i]['name']!),
                      ),
                    ),
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