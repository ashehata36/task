import 'package:get/get.dart';

class BottomBarController extends GetxController {
  RxInt currentPage = 0.obs;
  void onItemSelected(int value){
    currentPage.value = value;
  }
}