
import 'package:easmaterialdidaticoadm/presenter/ui/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../infra/services/authentication_service.dart';
import '../../../infra/services/navigate_to_login_service.dart';

class LoginController extends GetxController{
  User? user;
  RxBool loading = false.obs;
  RxBool userActive=false.obs;
  RxString message="".obs;


  Future<void> loginWithGoogle() async {
    loading.value = true;

    await Authentication.signInWithGoogle().then(
          (value) async {

            if (value!.uid.isNotEmpty) {
              await NavigateToLoginService().navigateToLogin(Routes.home);



        }
      },
    ).onError((error, stackTrace) {
      loading.value = false;
    });
    loading.value = false;
  }
}