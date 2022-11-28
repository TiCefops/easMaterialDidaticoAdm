
import 'package:easmaterialdidaticoadm/domain/repositories/course_repository.dart';

import '../../domain/entities/course_entity.dart';
import '../datasources/course_datasource.dart';

class CourseRepositoryImpl implements CourseRepository{

  CourseRepositoryImpl(this.dataSource);

  final CourseDataSource dataSource;

  @override
  Future<CourseEntity> getCourseById({required String id})async {

    return await dataSource.getCourseById(id: id);
  }

  @override
  Future<List<CourseEntity>> getAllCourse()async {
    return await dataSource.getAllCourses();
  }



}