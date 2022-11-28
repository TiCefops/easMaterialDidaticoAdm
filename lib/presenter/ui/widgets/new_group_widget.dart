import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/course_entity.dart';
import '../controller/group_controller.dart';

class NewGroupWidget extends GetView<GroupController> {
  NewGroupWidget({Key? key}) : super(key: key);
  final TextEditingController groupFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width * 0.5,
      child: Form(
        child: Column(
          children: [
            const Text("Selecione o Curso"),
            FutureBuilder<List<CourseEntity>>(
              future: controller.getAllCourse(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CourseEntity>> snapshot) {
                if (snapshot.hasData) {
                  snapshot.data!.removeAt(0);
                  controller.setDropDownValue(snapshot.data!.first);
                  controller.selectedCourseId.value = snapshot.data!.first.id!;
                  controller.selectedCourseName.value =
                      snapshot.data!.first.nome!;
                  return Obx(() {
                    return DropdownButton<CourseEntity>(
                      value: controller.dropDownValue,
                      onChanged: (value) {
                        controller.selectedCourseId.value = value!.id!;
                        controller.selectedCourseName.value = value.nome!;

                        controller.setDropDownValue(value);
                      },
                      items: snapshot.data!.map<DropdownMenuItem<CourseEntity>>(
                          (CourseEntity value) {
                        return DropdownMenuItem<CourseEntity>(
                          value: value,
                          child: Text(value.nome!),
                        );
                      }).toList(),
                    );
                  })
                  ;
                }
                return const CircularProgressIndicator();
              },
            ),
            const Text("Nome da Turma"),
            SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(
                controller: groupFormController,
              ),
            ),
            const Text("Periodo"),
            Obx(() {
              return DropdownButton<String>(
                  value: controller.selectedShift.value,
                  items: controller.shiftItems
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? value) =>
                      controller.selectedShift.value = value!);
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () async{
                      await  controller.newGroup(nome: groupFormController.text);
                    },
                    icon: const Icon(Icons.arrow_forward_sharp))
              ],
            )
          ],
        ),
      ),
    );
  }
}
