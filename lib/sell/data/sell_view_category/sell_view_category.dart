import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/sell/models/sell_view_model.dart';

class SellViewCategory extends GetxController {
  final databaseService = Get.put(DatabaseService());

  static SellViewItems user = SellViewItems(
    label: "Users",
    subtitle: '7',
    icon: Icons.people_outline,
  );
  SellViewItems categorie = SellViewItems(
    label: "Categories",
    //subtitle: '${databaseService.categories}',
    icon: Icons.category,
  );
  SellViewItems product = SellViewItems(
    label: "Products",
    //subtitle: '${databaseService.products}',
    icon: Icons.track_changes,
  );
  SellViewItems sold = SellViewItems(
    label: "Sold",
    //subtitle: '${databaseService.sold}',
    icon: Icons.tag_faces,
  );
  SellViewItems order = SellViewItems(
    label: "Orders",
    //subtitle: '${databaseService.order}',
    icon: Icons.shopping_cart_rounded,
  );
  static SellViewItems returns = SellViewItems(
    label: "Returns",
    //subtitle: '${databaseService.returns}',
    icon: Icons.close,
  );

  static final List<SellViewItems> all = [
    user,
    //categorie,
    //product,
    //sold,
    //order,
    returns,
  ];
}
