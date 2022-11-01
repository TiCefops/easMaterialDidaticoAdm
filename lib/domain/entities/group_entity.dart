

abstract class GroupEntity {


 final bool mostrar;
 final String nome;
 final String id;
 final List<ModuloEntity> modulos;
 final String courseId;
 final String periodo;

  GroupEntity(this.mostrar, this.nome, this.id, this.modulos, this.courseId, this.periodo);

}

abstract class ModuloEntity {
  final  String moduloId;
  final bool disponivel;
  final  String nomeModulo;
  final String dataFim;
  final String dataInicio;

  ModuloEntity(this.moduloId, this.disponivel, this.nomeModulo, this.dataFim, this.dataInicio);

}
