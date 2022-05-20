import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/buy_page/controller/buy_controller.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/core/widget/bottom_image_selection/bottom_sheet_chose.dart';
import 'package:shopping_app/sell/add_products/controller/addproducts_controller.dart';
import 'package:shopping_app/sell/add_products/widget/bottom_sheet.dart';
import 'package:shopping_app/sell/add_products/widget/bottom_sheet2.dart';
import 'package:shopping_app/sell/data/add_product/add_product.dart';
import 'package:shopping_app/sell/models/product_model.dart';

class AddProductsView extends StatefulWidget {
  AddProductsView({
    Key key,
  }) : super(key: key);

  @override
  _AddProductsViewState createState() => _AddProductsViewState();
}

class _AddProductsViewState extends State<AddProductsView> {
  final addProductsController = Get.put(AddProductsController());
  final DatabaseService databaseService = Get.put(DatabaseService());

  final bottomSheetView = Get.put(BottomSheetView());

  final buyController = Get.put(BuyController());

  ValueChanged<ProductItems> onClickProduct;
  var height = Get.height;
  var width = Get.width;
  @override
  void initState() {
    // TODO: implement initState
    databaseService.getCounterNumber();
    print('getCategories(),jjjjjjjjjjjjjjjj');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          addProductsController.bottomIndex = 0;
          Get.bottomSheet(
              BottomSheetChose(addProductsController: addProductsController));
        },
      ),
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Obx(() => addProductsController.image.isNotEmpty
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: addProductsController.image
                              .map((element) => SizedBox(
                                    height: height * 0.7,
                                    width: width,
                                    child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Image.file(
                                        element,
                                        fit: BoxFit.fill,
                                      ),
                                      color: Colors.white70,
                                      elevation: 3.0,
                                      margin: EdgeInsets.all(9.0),
                                    ),
                                  ))
                              .toList(),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                            children: AddProductItems.all
                                .map(
                                  (item) => SizedBox(
                                    height: height * 0.7,
                                    width: width,
                                    child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Center(
                                          child: Text(
                                        item.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      color: Colors.white70,
                                      elevation: 3.0,
                                      margin: EdgeInsets.all(9.0),
                                    ),
                                  ),
                                )
                                .toList()),
                      )),
                SizedBox(
                  height: height * .03,
                ),
                Text(
                  'Enter Three Dimension Of Your Products',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: height * .04,
                ),
                SizedBox(
                    width: width * 0.6,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            //adding Await
                            String uuid = FirebaseAuth.instance.currentUser.uid;
                            if (addProductsController.image.isNotEmpty) {
                              await databaseService.userImage();
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => BottomSheet2(),
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )));
                              buyController.getCategories(uid: uuid);
                            } else {
                              Get.snackbar('Massage', 'Select Image',
                                  snackPosition: SnackPosition.TOP);
                            }
                          },
                          child: Text('Continue'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
