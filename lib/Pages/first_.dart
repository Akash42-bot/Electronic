import 'package:electronic/3const/imports.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    double mw = MediaQuery.of(context).size.width;
    double mh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.recycling,
                  color: secondaryColor,
                  size: 80,
                ),
                Text(
                  ' Leuze',
                  style: mystyles(80, secondaryColor, FontWeight.bold),
                ),
              ],
            ),
            Gap(100),
            Text(
              'We Provide The Best Electronic',
              style: mystyles(25, secondaryColor, FontWeight.bold),
            ),
            Text(
              'Products From Great Brands',
              style: mystyles(25, secondaryColor, FontWeight.bold),
            ),
            Gap(20),
            Text(
              'You will be able to find a wide selection of',
              style: mystyles(15, Colors.grey, FontWeight.bold),
            ),
            Text(
              'electronics from top brands',
              style: mystyles(15, Colors.grey, FontWeight.bold),
            ),
            Gap(100),
            InkWell(
              onTap: (){
                Get.toNamed('/signin');
              },
              child: Container(
                height: mh * 0.1,
                width: mh * 0.1,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.arrow_forward,size: mw*0.1,color:Colors.black, ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
