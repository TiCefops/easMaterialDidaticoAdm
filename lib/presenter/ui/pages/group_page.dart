import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/presenter/ui/controller/group_controller.dart';
import 'package:easmaterialdidaticoadm/presenter/ui/styles/app_text_stayle.dart';
import 'package:easmaterialdidaticoadm/presenter/ui/styles/appp_colors.dart';
import 'package:easmaterialdidaticoadm/presenter/ui/widgets/app_pages_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infra/model/group_model.dart';
import '../widgets/card_for_group_page_widget.dart';

class GroupPage extends GetView<GroupController> {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSkeleton(
      child: SizedBox(
        child: Column(
          children: [
            Center(
              child: Text(
                "Gerenciar Turmas",
                style: AppTextStyle.titleHome,
              ),
            ),
            SizedBox(
              width: Get.width * 0.4,
              child: TextField(
                decoration: InputDecoration(
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.blue,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Buscar"),
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            SizedBox(
              width: Get.width * 0.25,
              height: Get.height * 0.8,
              child: StreamBuilder(
                  stream: controller.getAllGroup(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                          child: CardForPageWidget(snapshot: snapshot.data!.docs));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
