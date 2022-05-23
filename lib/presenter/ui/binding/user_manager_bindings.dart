import 'package:get/get.dart';

import '../controller/user_manager_controller.dart';

class UserManagerBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UserManagerController>(() {
      return UserManagerController();
    });
  }

}