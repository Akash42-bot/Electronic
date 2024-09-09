import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'package:electronic/1carousel/model/carosel.dart';
import 'package:electronic/1carousel/serviceclass/services.dart';
import 'package:electronic/2home_list_class/model/listview.dart';
import 'package:electronic/2home_list_class/services/services.dart';
import 'package:electronic/3const/imports.dart';

class Homepage extends StatelessWidget {
  SlideServices _services = SlideServices();
  ListServices _listServices = ListServices();

  @override
  Widget build(BuildContext context) {
    double mw = MediaQuery.of(context).size.width;
    double mh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 7, bottom: 7),
              height: 70,
              width: 70,
              child: Image(
                image: AssetImage('assets/images/logo2.png'),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Leuze',
              style: mystyles(30, null, FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
               image:DecorationImage(image: AssetImage('assets/images/background.jpg'),fit: BoxFit.cover)
              ),
              child: Container()
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle ta
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle tap
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      ///body

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Gap(20),

            ///searchbar
            Card(
              margin: EdgeInsets.all(10),
              elevation: 2,
              color: Colors.white,
              child: Container(
                height: mh * 0.06,
                width: mw * 0.99,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Try search here',
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none, // Removes the default underline
                    ),
                  ),
                ),
              ),
            ),

            ///carousel slider
            StreamBuilder<List<SlideModel>>(
              stream: _services.fetchPlaces(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: mh * 0.3,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: List.generate(
                          5,
                              (index) => Container(
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ),
                  );
                }

                if (!snapshot.hasData) {
                  return Center(child: Text('No data available'));
                }

                final products = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(1),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      animateToClosest: true,
                      enlargeFactor: 0.4,
                      height: mh * 0.3,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: products
                        .map((item) => Container(
                      child: Center(
                          child: Image.network(
                            '${item.image}',
                            fit: BoxFit.cover,
                            width: mw * 0.8,
                            height: mh * 0.2,
                          )),
                    ))
                        .toList(),
                  ),
                );
              },
            ),

            ///Category
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: mystyles(20, Colors.black, FontWeight.bold),
                  ),
                  Spacer(),
                  Text('More'),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 10,
                  )
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Get.toNamed('/laptop');
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 40,
                    width:40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/c1.png'))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  width:40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/c2.png'))),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  width:40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/c3.png'))),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  width:40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/c4.png'))),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  width:40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/c5.png'))),
                ),

              ],
            ),

            ///Gridview
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    'Top Deal on Electronics',
                    style: mystyles(20, Colors.black, FontWeight.bold),
                  ),
                  Spacer(),
                  Text('More'),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 10,
                  )
                ],
              ),
            ),

            StreamBuilder<List<ListModel>>(
              stream: _listServices.fetchGadgets(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4, // Number of shimmer placeholders
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.70,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => Container(
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  );
                }

                if (!snapshot.hasData) {
                  return Center(child: Text('No data available'));
                }

                final gadgets = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: gadgets.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.70,
                    ),
                    itemBuilder: (context, index) {
                      final gadget = gadgets;
                      return Stack(children: [
                        Container(
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200)),
                        ),
                        Positioned(
                          top: 30,
                          left: 12,
                          child: Container(
                            height: 130,
                            width: 173,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                    NetworkImage('${gadget[index].image}'),
                                    fit: BoxFit.scaleDown)),
                          ),
                        ),
                        Positioned(
                            top: 155,
                            left: 10,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(top: 11),
                              height: 101,
                              width: 190,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${gadget[index].name}',
                                    style: mystyles(
                                      14,
                                      Colors.black,
                                    ),
                                  ),
                                  Gap(5),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '\$' '${gadget[index].price}',
                                        style: mystyles(
                                            15, Colors.black, FontWeight.bold),
                                      ),
                                      Text('${gadget[index].originalprice}',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              decoration:
                                              TextDecoration.lineThrough)),
                                      Text(
                                        ' ${gadget[index].off}' 'off',
                                        style: mystyles(
                                            14, Colors.green, FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Gap(5),
                                  Row(
                                    children: [
                                      Icon(Icons.local_offer,size: 13,),
                                      Text(' Exchange Offer & more',style: mystyles(13),)
                                    ],)
                                ],
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.symmetric(
                            horizontal: 2,
                          ),
                          height: 23,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.black),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '4.6',
                                style: mystyles(
                                    16, secondaryColor, FontWeight.bold),
                              ),
                              Icon(
                                Icons.star,
                                color: secondaryColor,
                                size: 15,
                              )
                            ],
                          ),
                        )
                      ]);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
