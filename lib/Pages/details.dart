import 'package:electronic/1GetX/state_management.dart';
import 'package:electronic/2home_list_class/model/listview.dart';
import 'package:electronic/3const/imports.dart';
import 'package:electronic/Pages/Laptops.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Details extends StatefulWidget {
  Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isClicked=false;
  late PageController _pageController;
  int _currentPage = 1; // Set the initial page to 1

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1); // Start on the second container
  }

  @override
  Widget build(BuildContext context) {

    final ListModel? product = Get.arguments as ListModel?;

    if (product == null) {
      return Scaffold(
        body: Center(
          child: Text('No product data available'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Icon(Icons.search),
          Gap(5),
          Icon(Icons.shopping_cart),
          Gap(5),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 200,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                        child: Image(image: NetworkImage('${product.image1}'))),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                        child: Image(image: NetworkImage('${product.image}'))),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                        child: Image(image: NetworkImage('${product.image2}'))),
                  ),
                ],
              ),
            ),
            // Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  height: 8.0,
                  width: _currentPage == index ? 16.0 : 8.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.black : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            Gap(5),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${product.name}',style: mystyles(16,Color(0xff000000),FontWeight.w500,),
                  ),
                  Gap(5),
                  Text('See More ',style: mystyles(14,Color(0xff000000),FontWeight.w900,),),
                  Gap(12),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '4.5 ',
                              style: mystyles(
                                  15, Colors.white, FontWeight.bold),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 16,
                            ),],
                        ),
                      ),
                      Gap(2),
                      Text('(200 Rating)')
                    ],
                  ),
                  Gap(8),
                  Text('\$''${product.price}',style: mystyles(30,null,FontWeight.w800),),
                ],
              ),
              
            ),
            Gap(5),
            Divider(thickness: 0.5,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Available offers',style: mystyles(19,null,FontWeight.w900),),
                  Gap(20),
                  Row(
                    children: [
                      Icon(Icons.local_offer),
                      Gap(11),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Flat X30 discount on first prepaid transaction using RuPay debit card, minimum order value... ',style: mystyles(15),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Icon(Icons.local_offer),
                      Gap(11),
                      Expanded(
                        child: Column(
                          children: [
                            Text('₹30 Off on first prepaid transaction using UPI. Minimum order value 750/- ',style: mystyles(15),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Icon(Icons.local_offer),
                      Gap(11),
                      Expanded(
                        child: Column(
                          children: [
                            Text('5% Unlimited Cashback on Flipkart Axis Bank Credit Card',style: mystyles(15),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Text('          +5more',style: mystyles(15,null,FontWeight.bold),),
                  Gap(30),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(height: 60,width: 110,
                   decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10),color: Colors.grey.shade200,),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Free Delivery',style: mystyles(13,null,FontWeight.w500),)],),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 60,width: 110,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10),color: Colors.grey.shade200,),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("No cost EMI \$212/ month",style: mystyles(13,null,FontWeight.w500),)],),
                    ),
                    Container(height: 60,width: 110,
                      padding: EdgeInsets.only(left: 23),
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10),color: Colors.grey.shade200,),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(' Product Exchange',style: mystyles(13,null,FontWeight.w500),)],),
                    )
                  ],)
                ],
              ),
            ),
            Gap(5),
            Container(
                height: 60,
                width: double.infinity,
                child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(height: 60,width: 196,
                      decoration: BoxDecoration(border: Border.all(
                        color: Colors.grey.shade300
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.share,size: 20,),
                        Text('  Share',style: mystyles(20),)
                        
                      ],),
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300))),
                    height: 60,width: 196, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.filter_b_and_w),
                    Text('  Add to Compare')

                  ],),
                  ),
                ],),

            ),
            Container(
              height: 60,
              width: double.infinity,
              child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 60,width: 196,
                    decoration: BoxDecoration(border: Border.all(
                        color: Colors.grey.shade300
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ADD TO CART',style: mystyles(20,null,FontWeight.bold),)

                      ],),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black,border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300))),
                    height: 60,width: 196, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('BUY NOW',style: mystyles(20,Colors.white,FontWeight.bold),)

                    ],),
                  ),
                ],),

            )
          ],
        ),
      ),
    );
  }
}
