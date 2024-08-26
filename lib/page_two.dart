import 'package:flutter/material.dart';
import 'package:hexadairy_milkapp/categorypage_butter.dart';
import 'package:hexadairy_milkapp/page_three.dart';

class CategoryDetailsPageButter extends StatefulWidget {
  final String categoryNameb;
  final String categoryImageb;

  CategoryDetailsPageButter(
      {required this.categoryNameb, required this.categoryImageb});

  @override
  State<CategoryDetailsPageButter> createState() => _CategoryDetailsPageButterState();
}

class _CategoryDetailsPageButterState extends State<CategoryDetailsPageButter> {
  final List<Map<String, String>> products = [
    {'name': 'Unsalted Butter', 'image': 'assets/images/unsalted_butter1.jpg'},

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
                  color: Colors.white70),
            ),
            Text("Simply Better with Butter",
              style: TextStyle(fontSize: 15.0, color: Colors.white70),
            ),
          ],
        ),
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
        toolbarOpacity: 0.2,
        backgroundColor: Colors.lightBlue,
        //foregroundColor: Colors.teal,
    leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white70),
    onPressed: () {
    Navigator.push(context,MaterialPageRoute(builder: (context) => categorybutter())); // Navigate back to previous screen
    },
    )

      ),
      body: Stack(
        children: [
          Container(
            //child: Image.asset("assets/images/milkbk.jpeg",fit:BoxFit.fill),
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("assets/images/salted_butter.jpg"),
            //       fit: BoxFit.cover),
            // ),
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

          GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (ctx, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPageButter(
                      productNameb: products[index]['name']!,
                      productImageb: products[index]['image']!,
                    ),
                  ),
                );
              },
              child: GridTile(
                child: Image.asset(
                  products[index]['image']!,
                  fit: BoxFit.cover,
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(products[index]['name']!),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}