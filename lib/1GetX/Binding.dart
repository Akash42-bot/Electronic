import 'package:electronic/1GetX/state_management.dart';
import 'package:get/get.dart';

class BindingClass extends Bindings{
  @override
  void dependencies() {
    Get.put<ElectroClass>(ElectroClass());
  }
}