
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/infra/model/group_model.dart';

abstract class GroupRepository{
  Future<DocumentSnapshot> getGroupById({required String id});
  Future<void> updateModuleById({required String turmaId,required String moduleName,required String moduleId});
  Stream<QuerySnapshot> getAllGroup();
}