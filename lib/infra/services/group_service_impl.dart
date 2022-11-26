
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/group_repository.dart';
import 'package:easmaterialdidaticoadm/domain/usercases/group_services.dart';

class GroupServiceImpl implements GroupService{

  final GroupRepository _repository;

  GroupServiceImpl(this._repository);

  @override
  Future<DocumentSnapshot<Object?>> getGroup(String id) {
    // TODO: implement getGroup
    throw UnimplementedError();
  }

  @override
  Future<void> setModule(String turmaId,String moduleId,String moduleName) async {
    await _repository.updateModuleById(turmaId: turmaId, moduleName: moduleName, moduleId: moduleId);
  }

  @override
  Stream<QuerySnapshot> getAllGroup() async*{
    yield* _repository.getAllGroup();
  }

  @override
  Future<void> showGroupToSingIn({required String groupId,required bool currentValue}) async{
 await _repository.showGroupToSingIn(groupId: groupId, currentValue: currentValue);
  }

  @override
  Future<void> removeModuleById({required String turmaId, required Map<String, dynamic> module})async {
  await _repository.removeModuleById(turmaId: turmaId, module: module);
  }
}