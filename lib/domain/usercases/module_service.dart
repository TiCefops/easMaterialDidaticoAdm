
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ModuleService{
  Future<void> updateModulepById({required String turmaId,required Map<String,dynamic> module});
  Future<QuerySnapshot> getAllModules({required String courseId});
}