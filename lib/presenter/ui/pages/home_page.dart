
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../widgets/app_pages_skeleton.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSkeleton(
        child:Container(child: Text("Home"),));
  }
}
