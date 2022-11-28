

import '../entities/course_entity.dart';

abstract class CourseRepository{
  Future<CourseEntity> getCourseById({required String id});
  Future<List<CourseEntity>> getAllCourse();
}