import 'package:get/get.dart';
import 'package:task1/data/controllers/products_controllers/products_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ProductsController(),
      permanent: true,
    );
  }
}
