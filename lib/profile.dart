import 'package:flutter/material.dart';
void main() {
  runApp(UserProfile());
}

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', textDirection: TextDirection.ltr,),
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
            // stops: [0.4, 0.7],
            // tileMode: TileMode.repeated,
          ),
        ),
        child:SingleChildScrollView(

        child:Padding(
          padding: EdgeInsets.all(20.0),
          child:
          Column(
            children: [
              // User profile picture
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/dp.png'),
                    )
                ),
              ),
              SizedBox(height: 20.0),

              // User name
              Text(
                'Disha Purohit', textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),

              // User email
              Text(
                'purohitdisha@gmail.coom',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),

              Opacity(
                opacity: 0.4,// User information section
                 child:Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      // User address
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 10.0),
                          Text('123 Main Street, Anytown, CA 12345', textDirection: TextDirection.ltr),
                        ],
                      ),
                      SizedBox(height: 10.0),

                      // User phone number
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 10.0),
                          Text('+1 (555) 555-5555'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ),
              SizedBox(height: 20.0),

              // Edit profile button
              ElevatedButton(
                onPressed: () {
                  // Navigate to edit profile page
                  // Navigator.pushNamed(context, '/editProfile');
                },
                child: Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
