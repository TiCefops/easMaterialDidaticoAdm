import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewModule {
  void showForm() {
    Get.defaultDialog(
        title: "Nova Turma",
        content: SizedBox(
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
                    Expanded(child: SizedBox()),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_sharp))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
