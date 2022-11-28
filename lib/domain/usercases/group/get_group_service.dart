

import '../../entities/course_entity.dart';

abstract class GetGroupService{

  Future<CourseEntity> getGroup(String id);
}