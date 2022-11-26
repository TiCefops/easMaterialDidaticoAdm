
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GroupRepository{
  Future<DocumentSnapshot> getGroupById({required String id});
  Future<void> showGroupToSingIn({required String groupId,required bool currentValue});

  Future<void> updateModuleById({required String turmaId,required String moduleName,required String moduleId});
  Future<void> removeModuleById({required String turmaId,required Map<String,dynamic> module});
  Stream<QuerySnapshot> getAllGroup();
}