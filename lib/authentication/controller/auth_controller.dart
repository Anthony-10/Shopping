import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/authentication/view/auth_view.dart';
import 'package:shopping_app/core/service/data_base_service.dart';
import 'package:shopping_app/core/widget/drawer/drawer_view/drawer_view.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  User get user => _firebaseUser.value;

  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount _users;
  GoogleSignInAccount get users => _users;
  //var googleAccount = Rx<GoogleSignInAccount>(null);

  int initialIndexAuth = 0;

  final DatabaseService databaseService = Get.put(DatabaseService());

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    //super.onInit();
  }

  Future<void> createUser(
      {String email, String password, String firstName}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      {
        databaseService
            .addUserInfo(email: email, firstName: firstName)
            .then((value) => Get.off(() => DrawerView()));
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error creating account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logIn({String email, String password}) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then((value) => Get.off(() => DrawerView()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error login account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> googleLogin() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;
      _users = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => Get.off(() => DrawerView()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error signOut account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _googleSignIn.disconnect().then((value) => Get.off(() => AuthView()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error signOut account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendPassWordResetEmil({String email}) async {
    try {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((value) => Get.off(() => AuthView()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error resetting account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUserAccount({String email, String password}) async {
    try {
      User user = _auth.currentUser;
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await user.reauthenticateWithCredential(credential).then((value) =>
          value.user.delete().then((value) => Get.off(() => AuthView())));
      Get.snackbar('User Account Deleted', 'Success');
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error resetting account", e.message,
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      rethrow;
    }
  }
}
