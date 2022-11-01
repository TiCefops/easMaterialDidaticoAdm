import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/infra/model/group_model.dart';

abstract class GroupService{
  Future<DocumentSnapshot> getGroup(String id);
  Stream<QuerySnapshot> getAllGroup();
  Future<void> setModule(String turmaId,String moduleId,String moduleName);
}