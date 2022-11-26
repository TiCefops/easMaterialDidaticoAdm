import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GroupService{
  Future<DocumentSnapshot> getGroup(String id);
  Stream<QuerySnapshot> getAllGroup();
  Future<void> showGroupToSingIn({required String groupId,required bool currentValue});
  Future<void> setModule(String turmaId,String moduleId,String moduleName);
  Future<void> removeModuleById({required String turmaId,required Map<String,dynamic> module});

}