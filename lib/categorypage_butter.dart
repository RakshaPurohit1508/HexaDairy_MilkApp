import 'package:flutter/material.dart';
import 'package:hexadairy_milkapp/page_two.dart';
import 'package:hexadairy_milkapp/homepagetry1.dart';
import 'package:hexadairy_milkapp/addtocart.dart';
import 'package:hexadairy_milkapp/profile.dart';


class categorybutter extends StatefulWidget {
  @override
  State<categorybutter> createState() => _categorybutterState();
}

class _categorybutterState extends State<categorybutter> {
//
  final List<Map<String,String>> categories = [
      {'name': 'Unsalted Butter', 'image': 'assets/images/unsalted_butter1.jpg'},
      {'name': 'Salted Butter', 'image': 'assets/images/saltedbt.jpeg'},
      {'name': 'Garlic Butter', 'image': 'assets/images/garlic_butter.jpg'},
      {'name': 'Ghee', 'image': 'assets/images/ghee.jpg'},
  ];

  // Track which item is currently being hovered over
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hexa Dairy',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              Text(
                "Simply Better with Butter",
                style: TextStyle(fontSize: 15.0, color: Colors.white70),
              ),
            ],
          ),
          elevation: 50.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x0080c4e9), Color(0x00a7e6ff)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          backgroundColor: Colors.lightBlue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white70),
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back to previous screen
            },
          ),
        ),
        body: Container(
        height: MediaQuery.of(context).size.height ,
    width: MediaQuery.of(context).size.width ,
    // Below is the code for Linear Gradient.
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    colors:[Color(0xFFCDFADB),Color(0xFF7FC7D9),Color(0xFFFFFD8C),Color(0xFFF6F54D)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    ),
    ),

          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/salted_butter.jpg'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoryDetailsPageButter(
                          categoryNameb: categories[index]['name']!,
                          categoryImageb: categories[index]['image']!,
                        ),
                  ),
                );
              },
                child: GridTile(
                  footer: GridTileBar(
                    title: Text(
                      categories[index]['name']!,
                      style: const TextStyle(
                          fontSize: 18, color: Colors.black54),
                      textAlign: TextAlign.center,

                    ),

                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      // color: _hoveredIndex == index ? Colors.black.withOpacity(0.4) : Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Opacity(
                      opacity: 0.7,
                      child: Card(
                        elevation: 5,
                        // child:
                        // onTap: () {
                        //   // Handle category tap
                        //   print('Tapped category: ${categories[index]['name']!}');
                        //   // Navigate to a new page or do something else
                        // },
                        child: Image.asset(
                          categories[index]['image']!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),

                      ),
                    ),
                  ),
                ),
          ),
        ),

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

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}
