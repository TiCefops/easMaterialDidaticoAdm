

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/repositories/module_repository.dart';

class ModuleRepositoryImpl implements ModuleRepository{
  final FirebaseFirestore firestore;

  ModuleRepositoryImpl(this.firestore);
  @override
  Future<QuerySnapshot<Object?>> getAllModulesByCourseId({required String courseId}) async{
   CollectionReference modules= firestore.collection("modulos").doc(courseId).collection("modulos");
   QuerySnapshot snp=await modules.get();

   return snp;
  }

  @override
  Future<void> updateModuleById({required String turmaId, required Map<String, dynamic> module}) {
    // TODO: implement updateModulepById
    throw UnimplementedError();
  }
}