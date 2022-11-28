
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/infra/datasources/course_datasource.dart';
import 'package:easmaterialdidaticoadm/infra/model/course_model.dart';

import '../../domain/entities/course_entity.dart';


class CourseDataSourceImpl implements CourseDataSource{
  final FirebaseFirestore firestore;
  CourseDataSourceImpl(this.firestore);


  @override
  Future<List<CourseEntity>> getAllCourses() async{
    var  data = await firestore.collection('cursos').get();
   return     data.docs.map((e) => CourseModel.fromJson(e)).toList();
  }

  @override
  Future<CourseEntity> getCourseById({required String id}) async{
    var  data = await firestore.collection('cursos').doc(id).get();
    return CourseModel.fromJson(data.data());
  }
}