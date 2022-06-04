import 'package:get/get.dart';

class KeranjangController extends GetxController {
  var selIndex = 0.obs;
  void changeIndex(int index) {
    selIndex.value = index;
  }
}
