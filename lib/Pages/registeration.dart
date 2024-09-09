import 'package:electronic/3const/imports.dart';
import 'package:electronic/firebase_auth/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  AuthServices _auth = AuthServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastController = TextEditingController();
  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    double mw = MediaQuery.of(context).size.width;
    double mh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          ///first heading container
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.recycling,
                    color: secondaryColor,
                    size: 50,
                  ),
                  Text(
                    ' Leuze',
                    style: mystyles(50, secondaryColor, FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: secondaryColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create An Account",
                      style: mystyles(25, null, FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'Already Have An Acoount?',
                          style: mystyles(15),
                        ),
                        Text(
                          'Sign In',
                          style: mystyles(17, null, FontWeight.bold),
                        ),
                      ],
                    ),
                    Gap(20),

                    ///first name and last name
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey.shade200,
                            child: TextFormField(
                              controller: _nameController,
                              style: TextStyle(color: Colors.black),
                              // Set text color
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                    color: Colors.grey), // Set label color
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Space between the two fields
                        Expanded(
                          child: Container(
                            color: Colors.grey.shade200,
                            child: TextFormField(
                              controller: _lastController,
                              style: TextStyle(color: Colors.black),
                              // Set text color
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                    color: Colors.grey), // Set label color
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(20),

                    ///email
                    Container(
                      color: Colors.grey.shade200,
                      child: TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.black), // Set text color
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                          labelStyle:
                              TextStyle(color: Colors.grey), // Set label color
                        ),
                      ),
                    ),
                    Gap(20),

                    ///password
                    Container(
                      height: mh * 0.080,
                      color: Colors.grey.shade200,
                      child: TextFormField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.black),
                        // Set text color
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          suffix: IconButton(
                            onPressed: () {
                              isObs = !isObs;
                              setState(() {});
                            },
                            icon: Icon(
                              isObs ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black, // Set icon color
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(color: Colors.grey), // Set label color
                        ),
                        obscureText: !isObs,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Password';
                          }
                          if (value.length < 8) {
                            return "Password must contain at least 8 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    Gap(20),

                    ///signup
                    InkWell(
                      onTap: () async {
                        User? user = await _auth.signUpWithEmailAndPassword(
                            _emailController.text, _passwordController.text);

                        if (user != null) {
                          Get.bottomSheet(
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    height: 90,width: 90,decoration:
                                  BoxDecoration(shape: BoxShape.circle,color: Colors.black,image: DecorationImage(image: AssetImage('assets/images/tick.png')),boxShadow:
                                  <BoxShadow>[
                                    BoxShadow(color: Colors.grey,spreadRadius: 5,offset: Offset(2, 2)),
                                    BoxShadow(color: Colors.grey,spreadRadius: 10),
                                  ]),),
                                  SizedBox(height: 20),
                                  Text(
                                    'REGISTER SUCCESS',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'By tapping Sign Up button you accept terms and privacy of this app',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      'CLOSE',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),);
                          Get.offAllNamed('/home');
                        } else {
                          Get.snackbar(backgroundColor: Colors.white,
                              "Sorry", 'There has been a problem, try again');
                        }},
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: mh * 0.080,
                        width: mw * 0.9,
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SIGN UP',
                              style:
                                  mystyles(20, secondaryColor, FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 25,
                              color: secondaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(20),

                    ///afte signup
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'By tapping Sign Up button you',
                              style: mystyles(15, Colors.black),
                            ),
                            TextSpan(
                              text: ' accept terms and ',
                              style:
                                  mystyles(15, Colors.black, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'privacy',
                              style:
                                  mystyles(15, Colors.black, FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' of this app ',
                              style: mystyles(15, Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(40),

                    ///back
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back, size: 20),
                          Text(
                            ' Back to Sign In Page',
                            style: mystyles(20, Colors.black, FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
