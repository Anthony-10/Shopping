import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DrawerFunctions extends GetxController {
  int initialIndex = 0;

  var names;
  var emails;
  var images;
  var url;

  /*var name;
  var gmail;
  var image;
*/
  /* StreamBuilder<QuerySnapshot<Object>> buildStreamBuilder() {
    //String uid = FirebaseAuth.instance.currentUser.uid;
    print('++++++++++++++++++++StreamBuilder++++++++++++++++++++++++++++++');
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .where("userId", isEqualTo: FirebaseAuth.instance.currentUser.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Check your connection"),
              );
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.size,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 50.0,
                              child: images != null
                                  ? Image.network(
                                images,
                                fit: BoxFit.fill,
                              )
                                  : Icon(
                                Icons.person,
                                size: Get.height * 0.1,
                              ),
                            ),
                            Positioned(
                                bottom: -3,
                                right: -3,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: 30.0,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      addProductsController.bottomIndex = 1;
                                      print(
                                          '????????????????????????????????????????????????????');
                                    });
                                    Get.bottomSheet(BottomSheetChose(
                                        addProductsController: addProductsController))
                                        .whenComplete(() => addProductsController
                                        .drawerImage.isNotEmpty
                                        ? addProductsController.userImage().whenComplete(
                                            () => databaseService.updateUserInfo())
                                        : Get.snackbar(
                                      "Error Massage",
                                      'No image Selected',
                                      snackPosition: SnackPosition.BOTTOM,
                                    ));
                                    print(
                                        'OOOOOOOOO BottomSheet OOOOOOOOOOOOO ${drawerFunctions.names} ${drawerFunctions.emails} 0000000000000000');
                                  },
                                ))
                          ],
                        ),
                        ListTile(
                          title: Text(
                            newImage = snapshot.data.docs[index]['Url'].toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            }
            return null;
          } else {
            return Text('Loading.........');
          }
        });*/
  /*Future<void> getData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();
    if (documentSnapshot.exists) {
      images = documentSnapshot.get('Url');
      names = documentSnapshot.get('firstName');
      emails = documentSnapshot.get('email');

      print(
          '<<<<<<<<<< GetData <<<<<<<<<<<<<<<<< $images, $names, $emails >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.');
    } else {
      print('wewe');
    }
  }*/
  //}

  Future<void> getData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      if (documentSnapshot.exists) {
        images = documentSnapshot.get('Url');
        names = documentSnapshot.get('firstName');
        emails = documentSnapshot.get('email');
        url = documentSnapshot.get('userId');

        print(
            '<<<<<<<<<<<<<<<<<<<<<<<<<<< $images, $names, $emails, $url >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.');
      } else {
        print('wewe');
      }
    } catch (e) {
      print(e);
    }
  }
}
