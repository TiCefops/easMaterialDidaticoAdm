
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/infra/datasources/course_datasource.dart';


class CourseDataSourceImpl implements CourseDataSource{
  final FirebaseFirestore firestore;
  CourseDataSourceImpl(this.firestore);


  @override
  Future<CollectionReference<Object?>> courseDb() async{
    CollectionReference data = firestore.collection('cursos');
   return data;
  }
}