import 'package:get/get.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';

class AddProductcBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AddProductsController());
  }
}
