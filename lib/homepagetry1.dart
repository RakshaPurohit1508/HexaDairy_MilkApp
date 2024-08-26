import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexadairy_milkapp/addtocart.dart';
import 'package:hexadairy_milkapp/milkcategorygrid.dart';
import 'package:hexadairy_milkapp/curdcategory.dart';
import 'package:hexadairy_milkapp/categorypage_butter.dart';
import 'package:hexadairy_milkapp/cheesecategorygrid.dart';
import 'package:hexadairy_milkapp/profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // Define named routes for navigation
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/milk': (context) => milkgrid(),
      //   '/curd': (context) => Curdgrid(),
      //   '/butter': (context) => categorybutter(),
      //   '/cheese': (context) => cheesegrid(),
      //   //'/more_categories': (context) => MoreCategoriesPage(),
      // },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<String> imgList = [
    'https://media.istockphoto.com/id/909574006/photo/dairy-products-shot-on-bluish-tint-background.jpg?s=612x612&w=0&k=20&c=HkV16dh8kcyn485ogOOjIN47gEcoeuA-9afdRKemK_0=',
    'https://media.istockphoto.com/id/181892006/photo/bowl-of-sour-cream.jpg?s=612x612&w=0&k=20&c=jWPYBMRZnDrnfuZaIblXqjGl6ElOAa3zFe8mzlpl0GI=',
    'https://media.istockphoto.com/id/1338222224/photo/butter-blocks-and-pieces-on-wooden-table-copy-space.jpg?s=612x612&w=0&k=20&c=65ZYwALchrY4iXYkfrchnnWKCpuP20TZvXnSSmWnBPM=',
    'https://media.istockphoto.com/id/178421857/photo/various-types-of-cheese.jpg?s=612x612&w=0&k=20&c=7OJWQOlQASFNmKmgAjf-QpCsIC4lhMylHyXvxBVOJRg=',
    'https://media.istockphoto.com/id/170169190/photo/a-cinnamon-chocolate-and-strawberry-smoothie.jpg?s=612x612&w=0&k=20&c=d2OUzLUgYVIZ5dPS2RcOfdyjuayIJAXl-b_yXZsYKGo=',
    'https://media.istockphoto.com/id/686931912/vector/the-original-concept-poster-to-advertise-milk.jpg?s=612x612&w=0&k=20&c=LYeAEO-0PAr7AYtgJ-Lsrl1zjVxLuY13qC_jfC43V_c=',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hexa Dairy',
          style: TextStyle(
            color: Colors.black,
            wordSpacing: 3,
            fontSize: 24.0.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFBF9F1), Color(0xFFE5E1DA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF615EFC), Color(0xFF7E8EF1), Color(0xFFD1D8C5), Color(0xFFEEEEEE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imgList
                      .map((item) => Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: 500.w,
                        )),
                  ))
                      .toList(),
                ),
                // SizedBox(height: 20),
                // AnimatedContainer(
                //   duration: Duration(seconds: 2),
                //   curve: Curves.easeInOut,
                //   height: _isExpanded ? 300 : 150,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("assets/images/milkproducts.jpg"),
                //       fit: BoxFit.cover,
                //     ),
                //     borderRadius: BorderRadius.circular(15),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.black26,
                //         spreadRadius: 5,
                //         blurRadius: 7,
                //         offset: Offset(0, 3),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 20.h),
                Text(
                  'Recommended for You',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.h),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: [
                    _buildProductCard('Milk', 'assets/images/milk.jpg',
                        "Nature's Perfect Blend of Nutrition and Taste.", () {
                          //Navigator.pushNamed(context, '/milk');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => milkgrid()));
                        }),
                    _buildProductCard('Curd', 'assets/images/curd.png',
                        'Creamy Delight, Naturally Right, Richness in Every Bite.', () {
                          //Navigator.pushNamed(context, '/curd');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Curdgrid()));
                        }),
                    _buildProductCard('Butter', 'assets/images/butter.jpg',
                        'Spread Joy, Spread Flavor, Richness That Melts Hearts.', () {
                          //Navigator.pushNamed(context, '/butter');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => categorybutter()));
                        }),
                    _buildProductCard('Cheese', 'assets/images/cheese.jpeg',
                        'Elevate Your Palate, Slice by Slice, Savory Bliss in Every Bite.', () {
                          // Navigator.pushNamed(context, '/cheese');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => cheesegrid()));
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60.h,
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
                  Navigator.pushNamed(context, '/');
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Navigate to search page
                },
              ),
              SizedBox(width: 40.w), // Spacer
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        focusElevation: 6,
        onPressed: _toggleExpansion,
        child: Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
      ),
    );
  }

  Widget _buildProductCard(String title, String imagePath, String description, VoidCallback onTap) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 16,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imagePath,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  final String title;

  const ProductPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('This is the $title page'),
      ),
    );
  }
}

// class MoreCategoriesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('More Categories'),
//       ),
//       body: Center(
//         child: Text('This is the More Categories page'),
//       ),
//     );
//   }
// }

