import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/module_repository.dart';

import '../../domain/usercases/module_service.dart';

class ModuleServiceImpl implements ModuleService {
  final ModuleRepository repository;

  ModuleServiceImpl(this.repository);

  @override
  Future<List<Map<String, dynamic>>> getAllModules(
      {required String courseId}) async {
    List<Map<String, dynamic>> data = [];
    QuerySnapshot snap =
        await repository.getAllModulesByCourseId(courseId: courseId);
    for (var element in snap.docs) {
      Map<String, dynamic> currentData = element.data() as Map<String, dynamic>;
      data.add(currentData);
    }
    return data;
  }

  @override
  Future<void> updateModulepById(
      {required String turmaId, required Map<String, dynamic> module}) async {
    await repository.updateModuleById(turmaId: turmaId, module: module);
  }
}
