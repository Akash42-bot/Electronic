
import 'package:electronic/1GetX/Binding.dart';
import 'package:electronic/Pages/Laptops.dart';
import 'package:electronic/Pages/add_address.dart';
import 'package:electronic/Pages/address.dart';
import 'package:electronic/Pages/details.dart';
import 'package:electronic/Pages/first_.dart';
import 'package:electronic/Pages/homepage.dart';
import 'package:electronic/Pages/registeration.dart';
import 'package:electronic/Pages/signin.dart';
import 'package:electronic/user_profile/user_page.dart';
import 'package:electronic/firebase_auth/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        darkTheme: ThemeData.dark(),
        color: Colors.white,
        initialRoute: 'first',
        getPages: [
          GetPage(name: '/first', page:()=>First()),
          GetPage(name: '/signin', page:()=>Signin()),
          GetPage(name: '/second', page:()=>Registration()),
          GetPage(name: '/homepage', page: ()=>Homepage()),
          GetPage(name: '/laptop', page: ()=>laptops(),binding: BindingClass()),
          GetPage(name: '/details', page: ()=>Details()),
           GetPage(name: '/cart', page: ()=>address()),



        ],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        // home: First(),
      ),
    );
  }
}
