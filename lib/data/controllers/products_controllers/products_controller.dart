import 'package:get/get.dart';
import 'package:task1/domain/models/product_model/product_model.dart';
import 'package:collection/collection.dart';

class ProductsController extends GetxController {
  Rx<Products> allProducts = dummyProducts.obs;

  Rx<Products> get likesProducts => Rx<Products>(
        Products(
          products: allProducts.value.products.where((element) => element.isLiked).toList(),
        ),
      );

  Rx<Products> get productsInCart => Rx<Products>(
        Products(
          products: allProducts.value.products.where((element) => element.isInCart).toList(),
        ),
      );
  RxInt get totalPrice {
    int total = allProducts.value.products.map((e) => e.iPrice * e.count).toList().sum;
   return total.obs;
  }

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
    for (int i = 0; i < allProducts.value.products.length; i++) {
      if (allProducts.value.products[i].id == id && allProducts.value.products[i].count > 0) {
        allProducts.value.products[i].count = allProducts.value.products[i].count - 1;
      }
    }
    for (int i = 0; i < allProducts.value.products.length; i++) {
      if (allProducts.value.products[i].count < 1) {
        allProducts.value.products[i].isInCart = false;
      }
    }
    update();
  }

  plus({required int id}) {
    allProducts.value.products.firstWhere((element) => element.id == id).count++;
    update();
  }

  addToCart({required Product product}) {
    for (int i = 0; i < allProducts.value.products.length; i++) {
      if (allProducts.value.products[i].id == product.id) {
        allProducts.value.products[i] = allProducts.value.products[i].copyWith(
          isInCart: true,
          count: 1,
        );
      }
    }
    update();
  }
}
