import 'package:flutter/material.dart';

void main() {
  runApp(AdminPanel());
}

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon tap
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              child: IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Handle user icon tap
                },
              ),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          // Sidebar
          MediaQuery.of(context).size.width > 600
              ? Expanded(
            flex: 1,
            child: Sidebar(),
          )
              : Container(),
          // Dashboard content
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard Overview',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DashboardCard(
                        title: 'Total Users',
                        value: '1,200',
                        icon: Icons.people,
                        color: Colors.orange,
                      ),
                      DashboardCard(
                        title: 'Active Sessions',
                        value: '300',
                        icon: Icons.access_time,
                        color: Colors.green,
                      ),
                      DashboardCard(
                        title: 'Total Sales',
                        value: '\$25,000',
                        icon: Icons.attach_money,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: MediaQuery.of(context).size.width <= 600
          ? Drawer(
        child: Sidebar(),
      )
          : null,
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'Admin Menu',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SidebarItem(
            icon: Icons.dashboard,
            title: 'Dashboard',
            destination: DashboardScreen(),
          ),
          SidebarItem(
            icon: Icons.person,
            title: 'Users',
            destination: UsersScreen(),
          ),
          SidebarItem(
            icon: Icons.perm_media,
            title: 'Media',
            destination: MediaScreen(),
          ),
          SidebarItem(
            icon: Icons.branding_watermark,
            title: 'Brands',
            destination: BrandsScreen(),
          ),
          SidebarItem(
            icon: Icons.people_alt,
            title: 'Customers',
            destination: CustomersScreen(),
          ),
          SidebarItem(
            icon: Icons.category,
            title: 'Categories',
            destination: CategoriesScreen(),
          ),
          SidebarItem(
            icon: Icons.subdirectory_arrow_right,
            title: 'Sub-Categories',
            destination: SubCategoriesScreen(),
          ),
          SidebarItem(
            icon: Icons.shopping_bag,
            title: 'Products',
            destination: ProductsScreen(),
          ),
          SidebarItem(
            icon: Icons.widgets,
            title: 'Product Variants',
            destination: ProductVariantsScreen(),
          ),
          SidebarItem(
            icon: Icons.notifications,
            title: 'Notification',
            destination: NotificationScreen(),
          ),
          SidebarItem(
            icon: Icons.local_offer,
            title: 'Offers',
            destination: OffersScreen(),
          ),
          SidebarItem(
            icon: Icons.settings,
            title: 'Settings',
            destination: SettingsScreen(),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget destination;

  SidebarItem({
    required this.icon,
    required this.title,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
    );
  }
}

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Center(
        child: Text('Users Screen'),
      ),
    );
  }
}

// Screens for new items in the admin menu
class MediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media'),
      ),
      body: Center(
        child: Text('Media Screen'),
      ),
    );
  }
}

class BrandsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands'),
      ),
      body: Center(
        child: Text('Brands Screen'),
      ),
    );
  }
}

class CustomersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
      ),
      body: Center(
        child: Text('Customers Screen'),
      ),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Center(
        child: Text('Categories Screen'),
      ),
    );
  }
}

class SubCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub-Categories'),
      ),
      body: Center(
        child: Text('Sub-Categories Screen'),
      ),
    );
  }
}

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Center(
        child: Text('Products Screen'),
      ),
    );
  }
}

class ProductVariantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Variants'),
      ),
      body: Center(
        child: Text('Product Variants Screen'),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Center(
        child: Text('Notification Screen'),
      ),
    );
  }
}

class OffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers'),
      ),
      body: Center(
        child: Text('Offers Screen'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}

// Widget for Dashboard Cards
class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  DashboardCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: color),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}