
import 'package:easmaterialdidaticoadm/presenter/ui/controller/group_controller.dart';
import 'package:get/get.dart';

class GroupBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<GroupController>(() {
      return GroupController();
    });  }

}