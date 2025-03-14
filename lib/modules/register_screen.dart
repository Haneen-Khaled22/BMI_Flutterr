import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testandroid/BeautyProducts/api_provider.dart';
import 'package:testandroid/modules/login_screen.dart';

import '../Components/components.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isVisible = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(

          'Register',

          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Register',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  defaultTextFormFeild(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validator:  (value) {
                      bool emailValid = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                      ).hasMatch(value!);
                      if (value.isEmpty) {
                        return "Email must not be empty  ";}
                      // } else if (emailValid == false) {
                      //   return "Enter a valid email";
                      // }
                      return null;
                    },
                    labelText: 'Email Address',
                    prefixicon: Icons.email,

                  ),

                  // TextFormField(
                  //   validator: (value) {
                  //     bool emailValid = RegExp(
                  //       r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                  //     ).hasMatch(value!);
                  //     if (value.isEmpty) {
                  //       return "Email must not be empty  ";
                  //     } else if (emailValid == false) {
                  //       return "Enter a valid email";
                  //     }
                  //     return null;
                  //   },
                  //   controller: emailController,
                  //   keyboardType: TextInputType.emailAddress,
                  //   onFieldSubmitted: (value) => {print(value)},
                  //   onChanged: (value) => {print(value)},
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     labelText: 'Email address',
                  //     prefixIcon: Icon(Icons.email),
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password must not be empty  ";
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: isVisible,
                    keyboardType: TextInputType.visiblePassword,
                    onFieldSubmitted: (value) => {print(value)},
                    onChanged: (value) => {print(value)},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon:IconButton(onPressed: (){
                          setState(() {
                            isVisible = !isVisible;
                          });
                        }, icon: Icon(isVisible?Icons.remove_red_eye:Icons.visibility_off))
                    ),
                  ),
                  SizedBox(height: 20),
                  defaultmaterialButton(
                      onPressed: ()async
                      {
                       // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        if (formKey.currentState!.validate() ) {
                         await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text).then((user){
                                print(user.user?.email);
                                print(user.user?.refreshToken);
                          });


                        }
                        // Object? tokenFromshared= sharedPreferences.get("token");
                        // print("token : ${tokenFromshared}");

                      },
                      text: 'Register',
                      color: Colors.teal),

                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      navigateTo(context, LoginScreen());
                    },
                    child: Text(
                      'Login Now',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
