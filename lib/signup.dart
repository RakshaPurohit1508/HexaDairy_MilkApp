import 'dart:developer';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'SignUpModel.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //const Signup({super.key});
  TextEditingController usernameController = TextEditingController();

  TextEditingController mailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  //TextEditingController cnfmpController = TextEditingController();

  Future<SignUpModel>signUp(String email,String password,String username)async{
    if(email==""|| password=="" || username==""){
      //   Enter Required Field's
      //return log("Enter Required Field's");
      throw ArgumentError("Enter Required Fields");
    }
    else{
      final response=await http.post(Uri.parse("https://milk-ap-is.vercel.app/milkapp/signup"),
          headers: {
            "Content-Type":"application/json"
          },
          body: jsonEncode({
            "email":email,
            "password":password,
            "username":username
          })
      );
      if(response.statusCode==200){
        Map<String,dynamic>responsedata=jsonDecode(response.body);
        SignUpModel signUpModel=SignUpModel.fromJson(responsedata);
        return signUpModel;
      }
      else{
        return SignUpModel();
      }
    }
  }
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
                  controller: passwordController,
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
              SizedBox(height: 25,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "User Name",
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
                signUp( mailController.text, passwordController.text, usernameController.text);
              },
                  child: Text("Sign Up")
              ),
            ],
          ),
        ),

      ),
    );
  }

  // sign({required String email,required String password, required String uname})async{
  //   try{
  //     Response response = await post(
  //         Uri.parse('https://milk-ap-is.vercel.app/milkapp/signup'),
  //         body: {
  //           'email' : email,
  //           'password' : password,
  //           'username' : uname
  //         }
  //     );
  //     if(response.statusCode == 200){
  //       print('signin successful!');
  //     }else{
  //       print('signin failed!!');
  //     }
  //   } catch(e){
  //     print(e.toString());
  //   }
  // }
}


