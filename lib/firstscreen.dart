import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'dart:developer';
import 'package:hexadairy_milkapp/signup.dart';
import 'package:hexadairy_milkapp/homepagetry1.dart';
import 'package:http/http.dart';

// void main() {
//   runApp(FirstScreen());
// }

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BackgroundImageScreen(),
    );
  }
}

class BackgroundImageScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/HEXALogo.jpg'),
                //image: NetworkImage('https://media.istockphoto.com/id/1287218584/photo/dairy-products-on-blue-background-with-copy-space.jpg?s=612x612&w=0&k=20&c=AyGIszGerjN_L_sSyEqKoE_HLF-a_VsVlmtE775n5eQ='),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX:1, sigmaY:1),
            child: Container(
              color: Colors.lightBlueAccent.withOpacity(0.15),
            ),
          ),
          Center(
            child: Stack(
              children: [
                Positioned(
                  bottom: 40,
                  right: 5,
                  child: Text(
                    'SIP SMILE & SHINE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      backgroundColor: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: 15,
           right: 15,
           child:  Center(
              child: IconButton(
                icon: Icon(Icons.arrow_drop_down, size: 48.0, color: Colors.white),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Myapp()),
                  // );

                  showModalBottomSheet(context: context, builder: (BuildContext context){
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(30.0)
                        // image: DecorationImage(
                        //   image: AssetImage('assets/images/'),
                        //   fit: BoxFit.cover,)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                              controller: emailController,
                              keyboardType: TextInputType.text,
                              //maxLength: ,
                              decoration: InputDecoration(
                                hintText: "Enter Email",
                                hintStyle: TextStyle(color: Colors.indigoAccent),
                                suffixIcon: Icon(Icons.mail_outline),
                                suffixIconColor: Colors.indigoAccent,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.indigoAccent, width: 2.0),
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25,),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextField(
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                obscuringCharacter: "#",
                                decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(color: Colors.indigoAccent),
                                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                                  suffixIconColor: Colors.indigoAccent,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.indigoAccent, width: 2.0),
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                )
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 8,),
                              ElevatedButton(onPressed: (){
                                login(email: emailController.text.toString(), password: passwordController.text.toString());
                              },
                                  child:Text("Login")
                              ),
                              SizedBox(height: 8,),
                              ElevatedButton(onPressed: (){

                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup()));
                              },
                                  child:Text("Sign up")
                              ),
                              SizedBox(height: 8,),
                              ElevatedButton(onPressed: (){

                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>HomePage()));
                              },
                                  child:Text("Skip")
                              ),
                            ],

                          ),

                        ],
                      ),
                    );
                  });
                },

              ),

            )
                     ),
        ],
      ),
    );
  }

  login({required String email,required String password})async{
    try{
      Response response = await post(
        Uri.parse('https://milk-ap-is.vercel.app/milkapp/signin'),
        body: {
          'email' : email,
          'password' : password,
        }
      );
       if(response.statusCode == 200){
         print('login successful!');
       }else{
         print('login failed!!');
       }
    } catch(e){
      print(e.toString());
    }
  }
}

// class NextPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Next Page'),
//       ),
//       body: Center(
//         child: Text(
//           'Welcome to hexa dairy',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
