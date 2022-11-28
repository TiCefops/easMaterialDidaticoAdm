

import '../../domain/entities/course_entity.dart';

abstract class CourseDataSource{
  Future<List<CourseEntity>> getAllCourses();
  Future<CourseEntity> getCourseById({required String id});
}