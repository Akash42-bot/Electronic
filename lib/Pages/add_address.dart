import 'package:electronic/2home_list_class/services/services.dart';
import 'package:electronic/adress_model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryForm extends StatefulWidget {
  @override
  State<DeliveryForm> createState() => _DeliveryFormState();
}

class _DeliveryFormState extends State<DeliveryForm> {
  late final AdressModel place;

  final _formKey = GlobalKey<FormState>();
  final ListServices _listServices = ListServices();

  final _addressController = TextEditingController();
  final _placeController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _stateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    place = Get.arguments;

    _stateController.text = place.state;
    _placeController.text = place.place;
    _addressController.text = place.adress;
    _zipCodeController.text = place.zip;
  }

  Future<void> _updatePlace() async {
    final updatedPlace = AdressModel(
      place: _placeController.text,
      adress: _addressController.text,
      zip: _zipCodeController.text,
      id: place.id,
      state: _stateController.text,
    );
    await _listServices.updatePlaces(updatedPlace);
  }

  Future<void> _addPlace() async {
    final newAddress = AdressModel(
      place: _placeController.text,
      adress: _addressController.text,
      zip: _zipCodeController.text,
      id: '',
      state: _stateController.text,
    );
    await _listServices.addPlaces(newAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Information'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address Field
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Place Field
              TextFormField(
                controller: _placeController,
                decoration: InputDecoration(
                  labelText: 'Place',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your place';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // State Field
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your state';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Zip Code Field
              TextFormField(
                controller: _zipCodeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Zip Code',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your zip code';
                  } else if (value.length != 5) {
                    return 'Zip code should be 5 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),

              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );

                      if (place.id.isEmpty) {
                        await _addPlace();
                      } else {
                        await _updatePlace();
                      }

                      Get.back(); // Return to the previous screen and refresh the data
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
