import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElectroClass extends GetxController {
  List<IconData> icons = List.generate(10, (index) => Icons.favorite_border);
  void toggleIcon(int index) {
    icons[index] = icons[index] == Icons.favorite_border
        ? Icons.favorite
        : Icons.favorite_border;
    update();
  }



}