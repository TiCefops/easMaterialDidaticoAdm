

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/module_repository.dart';

import '../../domain/usercases/module_service.dart';

class ModuleServiceImpl implements ModuleService{
  final ModuleRepository repository;

  ModuleServiceImpl( this.repository);
  @override
  Future<QuerySnapshot<Object?>> getAllModules({required String courseId}) async{

    return await repository.getAllModulesByCourseId(courseId: courseId);
  }

  @override
  Future<void> updateModulepById({required String turmaId, required Map<String, dynamic> module}) async{

   await repository.updateModuleById(turmaId: turmaId, module: module);
  }
}