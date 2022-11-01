import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/group_controller.dart';

class ModuleEdit extends GetView<GroupController> {
  final Map<String, dynamic> group;

  const ModuleEdit({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> modulos = modulosFormated();
    return Column(
      children: [
        SizedBox(
          child: Row(
            children: [
              const Text("Adicionar módulo"),
              const Divider(
                indent: 20.0,
                endIndent: 10.0,
                thickness: 1,
              ),
              SizedBox(
                child: Builder(builder: (context) {
                  return FutureBuilder<List<Map<String, dynamic>>>(
                      future: controller.getAllModulesByCourseId(
                          courseId: group["courseId"]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          modulosFormated().forEach((modulesAdd) {
                            snapshot.data!.removeWhere((element) =>
                                element["id"] == modulesAdd["moduloId"]);
                            if (snapshot.data!.isEmpty) {
                              snapshot.data
                                  ?.add({"nome": "nenhum módulo disponivel"});
                            }
                          });
                          controller.selectValuesForMenu(snapshot.data!.first);
                          return DropdownButton<Map<String, dynamic>>(
                            value: controller.selectedValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (Map<String, dynamic>? value) {
                              controller.selectValuesForMenu(value!);
                            },
                            items: snapshot.data
                                ?.map<DropdownMenuItem<Map<String, dynamic>>>(
                                    (Map<String, dynamic> value) {
                              return DropdownMenuItem<Map<String, dynamic>>(
                                value: value,
                                child: Text(value["nome"]),
                              );
                            }).toList(),
                          );
                        }
                        return const CircularProgressIndicator();
                      });
                }),
              ),
              Obx(() {
                return controller.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : IconButton(
                        onPressed: () async {

                          await controller.setModule(
                              turmaId: group["id"]);
                        },
                        icon: const Icon(Icons.add));
              })
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              const Text("Aceitar Cadastro"),
              Checkbox(
                  value: group["mostrar"],
                  onChanged: (value) {
                    print(value);
                  })
            ],
          ),
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Módoulos"),
              const SizedBox(
                width: 40,
              ),
              SizedBox(
                  width: 320,
                  height: 120,
                  child: ListView.builder(
                      itemCount: modulos.length,
                      itemBuilder: (BuildContext context, index) {
                        return Row(
                          children: [
                            Text(modulos[index]["nomeModulo"]),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove))
                          ],
                        );
                      })),
            ],
          ),
        )
      ],
    );
  }

  List<Map<String, dynamic>> modulosFormated() {
    List<dynamic> modulosFormatter = [];
    List<Map<String, dynamic>> modulos = [];

    modulosFormatter.addAll(group["modulos"]);
    for (var element in modulosFormatter) {
      modulos.add(element);
    }
    return modulos;
  }
}
