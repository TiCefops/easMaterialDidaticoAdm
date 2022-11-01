import 'dart:convert';

import 'package:easmaterialdidaticoadm/domain/entities/group_entity.dart';

class GroupModel extends GroupEntity {
  final bool mostrar;
  final String nome;
  final String id;
  final List<Modulo> modulos;
  final String courseId;
  final String periodo;

  GroupModel(
      {required this.mostrar,
      required this.nome,
      required this.id,
      required this.modulos,
      required this.courseId,
      required this.periodo})
      : super(mostrar, nome, id, modulos, courseId, periodo);


  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      mostrar: json["mostrar"],
      nome: json["nome"],
      id: json["id"],
      modulos: List.of(json["modulos"])
          .map((i) => i /* can't generate it properly yet */)
          .toList() as List<Modulo>,
      courseId: json["courseId"],
      periodo: json["periodo"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mostrar": mostrar,
      "nome": nome,
      "id": id,
      "modulos": jsonEncode(modulos),
      "courseId": courseId,
      "periodo": periodo,
    };
  }


//

}

class Modulo extends ModuloEntity {
   String moduloId;
  bool disponivel;
   String nomeModulo;
   String dataFim;
   String dataInicio;

  Modulo(
      {required this.moduloId,
      required this.disponivel,
      required this.nomeModulo,
      required this.dataFim,
      required this.dataInicio})
      : super(moduloId, disponivel, nomeModulo, dataFim, dataInicio);

  factory Modulo.fromJson(Map<String, dynamic> json) {
    return Modulo(
      moduloId: json["moduloId"],
      disponivel: json["disponivel"].toLowerCase() == 'true',
      nomeModulo: json["nomeModulo"],
      dataFim: json["dataFim"],
      dataInicio: json["dataInicio"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "moduloId": moduloId,
      "disponivel": disponivel,
      "nomeModulo": nomeModulo,
      "dataFim": dataFim,
      "dataInicio": dataInicio,
    };
  }
}
