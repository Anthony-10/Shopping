import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/buy/data/slide_controller.dart';

class BuyView extends StatefulWidget {
  @override
  _BuyViewState createState() => _BuyViewState();
}

class _BuyViewState extends State<BuyView> {
  final controller = SlideController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      onPageChanged: controller.selectedPageIndex,
                      itemCount: controller.homePageData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    controller.homePageData[index].imageAsset),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                        );
                      }),
                ),
                Positioned(
                  bottom: 20,
                  right: 150,
                  child: Row(
                      children: List.generate(
                          controller.homePageData.length,
                          (index) => Obx(
                                () => Container(
                                  margin: EdgeInsets.all(4),
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                      color:
                                          controller.selectedPageIndex.value ==
                                                  index
                                              ? Colors.red
                                              : Colors.white,
                                      shape: BoxShape.circle),
                                ),
                              ))),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                height: Get.height * 0.06,
                width: Get.width,
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(15),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 90,
                      child: Card(
                        child: ListTile(
                            title: TextButton(
                              onPressed: () {},
                            ),
                            subtitle: Text(
                              'wewe',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 40.0),
                            )),
                        elevation: 20.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton(
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            'wewe',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton(
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            'wewe',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton(
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            'wewe',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton(
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            'wewe',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton(
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            'wewe',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton(
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            'wewe',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton(
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            'wewe',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton(
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            'wewe',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    Card(
                      child: ListTile(
                          title: TextButton(
                            onPressed: () {},
                          ),
                          subtitle: Text(
                            'wewe',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 40.0),
                          )),
                      elevation: 20.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
