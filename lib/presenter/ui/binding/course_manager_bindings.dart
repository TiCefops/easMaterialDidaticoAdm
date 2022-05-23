
import 'package:get/get.dart';

import '../controller/course_manager_controller.dart';

class CourseManagerBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CourseManagerController>(() {
      return CourseManagerController();
    });  }

}