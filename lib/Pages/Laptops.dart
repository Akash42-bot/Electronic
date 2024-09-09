import 'package:electronic/1GetX/state_management.dart';
import 'package:electronic/2home_list_class/model/listview.dart';
import 'package:electronic/3const/imports.dart';
import 'package:electronic/4laptop/service.dart';
import 'package:electronic/Pages/details.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class laptops extends StatelessWidget {
  LaptopClass _laptopClass = LaptopClass();
  final ElectroClass ec = Get.find<ElectroClass>();

  @override
  Widget build(BuildContext context) {
    double mw = MediaQuery.of(context).size.width;
    double mh = MediaQuery.of(context).size.height;

    return GetBuilder<ElectroClass>(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text(
            'Laptops',
            style: mystyles(24, Colors.black, FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Icon(Icons.search),
            Gap(5),
            Icon(Icons.shopping_cart),
            Gap(2),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: mh * 0.05,
                    width: mw * 0.32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.compare), Gap(5), Text('Compare')],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: mh * 0.05,
                    width: mw * 0.32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sort_outlined),
                        Gap(5),
                        Text('Sort')
                      ],
                    ),
                  ),
                  Container(
                    height: mh * 0.05,
                    width: mw * 0.32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.filter_alt),
                        Gap(5),
                        Text('Filter')
                      ],
                    ),
                  ),
                ],
              ),

              ///Listview
              StreamBuilder<List<ListModel>>(
                stream: _laptopClass.fetchLaptops(),
                builder: (context, snapshot) {
                  final laptops = snapshot.data!;

                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: laptops.length,
                    itemBuilder: (context, index) {
                      final product = laptops[index];
                      return Stack(children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0.5),
                          height: mh * 0.3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade200)),
                        ),
                        Positioned(
                          top: 2,
                          child: GestureDetector(
                            onTap: (){
                              Get.toNamed('/details',arguments:product);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 2),
                              height: mh * 0.2,
                              width: mw * 0.32,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage("${product.image}"),
                                fit: BoxFit.contain,
                              )),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 160,
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              width: 400,
                              height: mh * 0.15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 25,
                                          width: 230,
                                          color: Colors.grey.shade200,
                                          child: Center(
                                              child: Text(
                                                  'NVIDA Geforce GTX 1650 8 GB'))),
                                      Gap(80),
                                      Container(
                                          height: 25,
                                          width: 60,
                                          color: Colors.grey.shade200,
                                          child:
                                              Center(child: Text('1.66 kg'))),
                                    ],
                                  ),
                                  Gap(15),
                                  Container(
                                      height: 25,
                                      width: 247,
                                      color: Colors.grey.shade200,
                                      child: Center(
                                          child: Text(
                                              '39.43 cm (15.6 inch) Full HD Display')))
                                ],
                              ),
                            )),
                        Positioned(
                          top: 20,
                          left: 140,
                          child: Container(
                            // color: Colors.yellow,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            height: mh * 0.19,
                            width: mw * 0.63,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${laptops[index].name}',
                                  style: mystyles(
                                      14.2, Colors.black, FontWeight.bold),
                                  maxLines: 2,
                                ),
                                Gap(7),
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
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(7),
                                Row(
                                  children: [
                                    Text(
                                      '\$' '${laptops[index].price} ',
                                      style: mystyles(
                                          17, Colors.black, FontWeight.bold),
                                    ),
                                    Text(
                                        '\$' '${laptops[index].originalprice} ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                        )),
                                    Text(
                                      '${laptops[index].off} ' 'off',
                                      style: mystyles(17, Colors.green.shade600,
                                          FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Gap(7),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.local_offer,
                                      size: 12,
                                    ),
                                    Text(
                                      ' Upto \$200 off on Exxhange No Cost EMI',
                                      style: mystyles(11.5),
                                    )
                                  ],
                                ),
                                Gap(7),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            left: 355,
                            top: -10,
                            child: InkWell(
                              onTap: () {
                                ec.toggleIcon(index);
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300),
                                child: Icon(ec.icons[index],
                                  size: 19, color: Colors.black,
                                ),
                              ),
                            ))
                      ]);
                    },
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
