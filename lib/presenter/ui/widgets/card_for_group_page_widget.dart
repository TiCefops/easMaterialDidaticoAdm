import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/presenter/ui/controller/group_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'module_edit.dart';

class CardForPageWidget extends StatelessWidget {
  final List<QueryDocumentSnapshot<Object?>> snapshot;

   CardForPageWidget({Key? key, required this.snapshot}) : super(key: key);
final GroupController controller=Get.find<GroupController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: snapshot.length,
        itemBuilder: (BuildContext context, int index) {
          List data = snapshot[index].get("modulos");
          String aceitandoCadastro =
          snapshot[index].get("mostrar") ? "Habilitado" : "Desabilitado";
          return InkWell(
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Curso: ${snapshot[index].get("nomeCurso")}"),
                  Text("Turma: ${snapshot[index].get("nome")}"),
                  // Text("Módulo Atual: ${data.last["nomeModulo"]}"),
                  Text("Aceitar cadastro: $aceitandoCadastro"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(snapshot[index].get("mostrar")
                            ? "Desabilitar Cadastro"
                            : "Aceitar Cadastro"),
                      ),
                      TextButton(
                        onPressed: ()async {
                          Map<String, dynamic> data=snapshot[index].data() as Map<String, dynamic>;


                          Get.defaultDialog(title: snapshot[index].get("nome"),
                          content: ModuleEdit(group: data,)

                          );

                        },
                        child: Text("Editar"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
