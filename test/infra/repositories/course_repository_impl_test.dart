import 'package:easmaterialdidaticoadm/domain/entities/course_entity.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/course_repository.dart';
import 'package:easmaterialdidaticoadm/external/datasources/get_course_datasource_impl.dart';
import 'package:easmaterialdidaticoadm/infra/repositories/course_repository_impl.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../mocks/FirestoreMock.dart';

void main() async {
  final FirestoreMock _mock = FirestoreMock();
  final coureDb = CourseDataSourceImpl(_mock.setCourseData());
  final CourseRepository _repository = CourseRepositoryImpl(coureDb);

  group("Course Repository test", () {
    test("getCourseById", () async {
      CourseEntity course =
          await _repository.getCourseById(id: "JKvhYXcuDsUhKrgbvYP7");
      expect(true, course.ativo);
      expect("Auxiliar de Enfermagem", course.nome);
    });

    test("getAllCourses", () async {
      List<CourseEntity> course = await _repository.getAllCourse();
      expect(2, course.length);
      expect("Auxiliar de Enfermagem", course.first.nome);

    });
  });
}
