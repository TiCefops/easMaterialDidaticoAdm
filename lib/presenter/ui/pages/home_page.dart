
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infra/services/navigate_to_login_service.dart';
import '../controller/home_controller.dart';
import '../routes/routes.dart';
import '../widgets/app_pages_skeleton.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  final FirebaseAuth auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if(auth.currentUser?.uid==null){
      Future.delayed(Duration.zero,(){Get.toNamed(Routes.login);});
    }else{
       NavigateToLoginService().navigateToLogin(Routes.home);

    }
    controller.veryfyUser();
    return AppSkeleton(
        child:Center(child: Container(
          child: Column(

            children: [
              Text("Home"),

              Text("Olá ${FirebaseAuth.instance.currentUser?.displayName}"),

            ],
          ),
        ),));
  }

}
