import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controller/course_manager_controller.dart';
import '../widgets/app_pages_skeleton.dart';

class CourseManagerPage extends GetView<CourseManagerController> {
  const CourseManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSkeleton(child:const Center(child:  Text("Cursos"),));
  }
}
