
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/course_repository.dart';

import '../../external/datasources/get_course_by_id_provider.dart';
import '../datasources/course_datasource.dart';

class CourseRepositoryImpl implements CourseRepository{
  final FirebaseFirestore firestore;
  CourseRepositoryImpl(this.firestore);

  late  final CourseDataSource _dataSource=CourseDataSourceImpl(firestore);
  late  final  CollectionReference _db;


  @override
  Future<DocumentSnapshot> getCourseById({required String id})async {
      _db=await _dataSource.courseDb();
      DocumentSnapshot snapshot = await _db.doc(id).get();
    return snapshot;
  }

  @override
  Stream<QuerySnapshot<Object?>> getAllCourse()async* {
  yield*  _db.snapshots();
  }



}