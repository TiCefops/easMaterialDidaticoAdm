
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/course_repository.dart';

import '../datasources/course_datasource.dart';

class CourseRepositoryImpl implements CourseRepository{

  CourseRepositoryImpl(this.dataSource);

  final CourseDataSource dataSource;

  @override
  Future<DocumentSnapshot> getCourseById({required String id})async {
      CollectionReference db=await dataSource.courseDb();
      DocumentSnapshot snapshot = await db.doc(id).get();
    return snapshot;
  }

  @override
  Stream<QuerySnapshot<Object?>> getAllCourse()async* {
    CollectionReference db=await dataSource.courseDb();
    yield*  db.snapshots();
  }



}