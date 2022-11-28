import '../../domain/entities/course_entity.dart';

class CourseModel extends CourseEntity{
  CourseModel({
      this.ativo, 
      this.receberCadastro, 
      this.id, 
      this.firstModule, 
      this.nome,});

  CourseModel.fromJson(dynamic json) {
    ativo = json['ativo'];
    receberCadastro = json['receberCadastro'];
    id = json['id'];
    firstModule = json['firstModule'];
    nome = json['nome'];
  }
  bool? ativo;
  bool? receberCadastro;
  String? id;
  String? firstModule;
  String? nome;
CourseModel copyWith({  bool? ativo,
  bool? receberCadastro,
  String? id,
  String? firstModule,
  String? nome,
}) => CourseModel(  ativo: ativo ?? this.ativo,
  receberCadastro: receberCadastro ?? this.receberCadastro,
  id: id ?? this.id,
  firstModule: firstModule ?? this.firstModule,
  nome: nome ?? this.nome,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ativo'] = ativo;
    map['receberCadastro'] = receberCadastro;
    map['id'] = id;
    map['firstModule'] = firstModule;
    map['nome'] = nome;
    return map;
  }

}