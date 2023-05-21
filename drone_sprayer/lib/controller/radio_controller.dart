import 'package:get/get.dart';

class ButtonController extends GetxController{

  String _productType = 'liquid';
  String get orderType =>_productType;
  void setProductType(String type) {
    _productType = type;
    update();
  }
}