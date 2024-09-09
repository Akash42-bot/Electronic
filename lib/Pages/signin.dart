import 'package:electronic/3const/imports.dart';
import 'package:electronic/firebase_auth/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  AuthServices _auth =AuthServices();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    double mw = MediaQuery.of(context).size.width;
    double mh = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: primaryColor,
        body: Expanded(
            child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/back.jpg'),
                        fit: BoxFit.fitWidth)),
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
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: secondaryColor),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log in to your account',
                        style: mystyles(25, null, FontWeight.bold),
                      ),
                      Gap(10),
                      Text(
                        'Please provide your Email ID to',
                        style: mystyles(15, Colors.grey),
                      ),
                      Text(
                        'login/sign up before you place the order',
                        style: mystyles(15, Colors.grey),
                      ),
                      Gap(30),
                      TextFormField(
                        controller: _emailcontroller,
                        decoration:
                            InputDecoration(hintText: 'E-mail',border: OutlineInputBorder()),
                      ),
                      Gap(20),
                      SizedBox(
                        height: mh * 0.080,
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          controller: _passwordcontroller,
                          decoration: InputDecoration(hintText: 'Password',
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
                          ),
                          obscureText: !isObs,
                        ),
                      ),
                      Gap(20),
                      InkWell(onTap: ()async{
                        User? user = await _auth.signInWithEmailAndPassword(
                            _emailcontroller.text, _passwordcontroller.text);

                        if (user != null) {
                          Get.snackbar('Sucess', 'login sucessful');
                          Get.offAllNamed('/homepage');
                        } else {
                          Get.snackbar("Sorry", 'There has been a problem, try again');
                        }
                      },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.black,
                          height: mh * 0.080,
                          width: mw * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SIGN IN ',
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
                      Center(
                          child: Text(
                        'Reset Password',
                        style: mystyles(15, Colors.grey, FontWeight.bold),
                      )),
                      Gap(60),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/second');
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.grey.shade400,
                          height: mh * 0.079,
                          width: mw * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Create an Account ',
                                style:
                                    mystyles(20, primaryColor, FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
