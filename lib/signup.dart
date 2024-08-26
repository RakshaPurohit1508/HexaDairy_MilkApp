import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //const Signup({super.key});
  TextEditingController nameController = TextEditingController();

  TextEditingController mailController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  //TextEditingController cnfmpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
            // image: DecorationImage(
            //   image: AssetImage('assets/images/signup.jpg'),
            //   fit: BoxFit.cover,)
        ),
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Your Name",
                    hintStyle: TextStyle(color: Colors.indigo),
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.indigo,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                      borderRadius: BorderRadius.circular(4.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: mailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(color: Colors.indigo),
                    prefixIcon: Icon(Icons.mail_outline),
                    prefixIconColor: Colors.indigo,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                      borderRadius: BorderRadius.circular(4.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: pwdController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(color: Colors.indigo),
                    prefixIcon: Icon(Icons.remove_red_eye),
                    prefixIconColor: Colors.indigo,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                      borderRadius: BorderRadius.circular(4.5),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 25,),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: TextField(
              //     controller: cnfmpController,
              //     keyboardType: TextInputType.text,
              //     obscureText: true,
              //     obscuringCharacter: "*",
              //     decoration: InputDecoration(
              //       hintText: "Confirm Password",
              //       hintStyle: TextStyle(color: Colors.indigo),
              //       prefixIcon: Icon(Icons.remove_red_eye),
              //       prefixIconColor: Colors.indigo,
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.indigo, width: 2.0),
              //         borderRadius: BorderRadius.circular(4.5),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                sign(email: mailController.text,
                    password: pwdController.text,
                  uname: nameController.text);
              },
                  child: Text("Sign Up")
              ),
            ],
          ),
        ),

      ),
    );
  }

  sign({required String email,required String password, required String uname})async{
    try{
      Response response = await post(
          Uri.parse('https://milk-ap-is.vercel.app/milkapp/signup'),
          body: {
            'email' : email,
            'password' : password,
            'username' : uname
          }
      );
      if(response.statusCode == 200){
        print('signin successful!');
      }else{
        print('signin failed!!');
      }
    } catch(e){
      print(e.toString());
    }
  }
}


