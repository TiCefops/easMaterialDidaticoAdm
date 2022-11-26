import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/group_controller.dart';


class NewGroupWidget extends GetView<GroupController> {
  const NewGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width * 0.5,
      child: Form(
        child: Column(
          children: [
            const Text("Selecione O Curso"),
            Container(
              color: Colors.red,
              width: 300,
              height: 40,
            ),
            const Text("Nome da Turma"),
            SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(

              ),
            ),const Text("Turno"),
            Container(
              color: Colors.red,
              width: 300,
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_sharp))
              ],
            )
          ],
        ),
      ),
    );
  }
}
