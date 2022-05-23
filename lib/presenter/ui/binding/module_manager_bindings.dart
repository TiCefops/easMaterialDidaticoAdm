
import 'package:get/get.dart';

import '../controller/module_manager_controller.dart';

class ModuleManagerBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ModuleManagerController>(() {
      return ModuleManagerController();
    });
  }
}