

import 'package:easmaterialdidaticoadm/domain/entities/course_entity.dart';

import '../../repositories/course_repository.dart';
import 'get_all_course_usecase.dart';

class GetAllCourseUseCaseImpl implements GetAllCourseUseCase{
  final CourseRepository repository;

  GetAllCourseUseCaseImpl(this.repository);
  @override
  Future<List<CourseEntity>>call()async{
   return await repository.getAllCourse();

  }
}