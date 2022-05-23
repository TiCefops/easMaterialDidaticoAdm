import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class NavigationDrawerWidget {

  Widget navigationDrawer() {
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: Get.width * 0.19,
            ),
          ],
        ),ListTile(
          leading: const Icon(Icons.home),
          onTap: () {
            Get.offAndToNamed(Routes.initial);
          },
          title: const Text("Início"),
        ),

        ListTile(
          leading: const Icon(Icons.person),
          onTap: () {
            Get.offAndToNamed(Routes.userManager);
          },
          title: const Text("Gerenciar Usuários"),
        ),
        ListTile(
          leading: const Icon(Icons.event),
          onTap: () {
            Get.offAndToNamed(Routes.courseManager);

          },
          title: const Text("Gerenciar Cursos"),
        ),
        ListTile(
          leading: const Icon(Icons.work),
          onTap: () {
            Get.offAndToNamed(Routes.courseManager);
          },
          title: const Text("Gerenciar Turmas"),
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text("Sair"),
          onTap: () {},
        )
      ],
    ));
  }
}
