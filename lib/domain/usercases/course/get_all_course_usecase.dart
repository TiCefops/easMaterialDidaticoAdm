
import 'package:easmaterialdidaticoadm/domain/entities/course_entity.dart';

abstract class GetAllCourseUseCase{
  Future<List<CourseEntity>> call();
}