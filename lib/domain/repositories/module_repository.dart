
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ModuleRepository{

  Future<void> updateModuleById({required String turmaId,required Map<String,dynamic> module});
  Future<QuerySnapshot> getAllModulesByCourseId({required String courseId});

}