import 'package:electronic/2home_list_class/services/services.dart';
import 'package:electronic/3const/imports.dart';
import 'package:electronic/Pages/add_address.dart';
import 'package:electronic/adress_model/model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class address extends StatelessWidget {
  final ListServices _listservices = ListServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder<List<AdressModel>>(
          stream: _listservices.fetchPlaces(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final address = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {

                        Get.to(() => DeliveryForm(), arguments: AdressModel(
                          id: '',
                          adress: '',
                          place: '',
                          zip: '',
                          state: '',
                        ));

                    },
                    child: Row(
                      children: [
                        Text('Add Delivery Address', style: mystyles(15, Colors.green,FontWeight.bold)),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: address.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(address[index].id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) async {
                          await _listservices.deletePlaces(address[index].id);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Address removed')),
                          );
                        },
                        background: Container(
                          color: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: AlignmentDirectional.centerEnd,
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(20),
                              Row(
                                children: [
                                  Text('Delivery to',style: mystyles(17,),),
                                  Text(' ${address[index].adress}',style: mystyles(17,null,FontWeight.bold),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => DeliveryForm(), arguments: AdressModel(
                                        id: '',
                                        adress: '',
                                        place: '',
                                        zip: '',
                                        state: '',
                                      ));
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Center(child: Text('Change')),
                                    ),
                                  ),
                                ],
                              ),
                              Text('${address[index].place}'),
                              Row(
                                children: [
                                  Text('${address[index].state} '),
                                  Text('${address[index].zip}')
                                ],
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
