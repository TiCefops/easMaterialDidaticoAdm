import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_manager_controller.dart';
import '../widgets/app_pages_skeleton.dart';
import '../widgets/user_card_widget.dart';

class UserManagerPage extends GetView<UserManagerController> {
  const UserManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSkelecte(
        child: SizedBox(
      child: StreamBuilder(
        stream: controller.getAll(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(

                itemCount:snapshot.data!.docs.length ,
                itemBuilder: (BuildContext context, int index) {
                  return UserCardWidget(data: snapshot.data!.docs[index]);
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }

}
