import 'package:get/get.dart';
import 'package:task1/domain/models/product_model/product_model.dart';

class ProductsController extends GetxController {
  Rx<Products> allProducts = dummyProducts.obs;

  Rx<Products> get likesProducts => Rx<Products>(
        Products(
          products: allProducts.value.products.where((element) => element.isLiked).toList(),
        ),
      );

  likeProduct({required int id}) {
    for (int i = 0; i < allProducts.value.products.length; i++) {
      if (allProducts.value.products[i].id == id) {
        allProducts.value.products[i] = allProducts.value.products[i].copyWith(
          isLiked: !allProducts.value.products[i].isLiked,
          count: 1,
        );
      }
    }
    update();
  }

  minus({required int id}) {
    allProducts.value.products.firstWhere((element) => element.id == id).count--;
    allProducts.value.products.removeWhere((element) => element.count == 0);
    update();
  }

  plus({required int id}) {
    allProducts.value.products.firstWhere((element) => element.id == id).count++;
    update();
  }
}
