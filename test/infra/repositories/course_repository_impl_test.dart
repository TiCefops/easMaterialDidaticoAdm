import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/course_repository.dart';
import 'package:easmaterialdidaticoadm/external/datasources/get_course_by_id_provider.dart';
import 'package:easmaterialdidaticoadm/infra/repositories/course_repository_impl.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../mocks/FirestoreMock.dart';

void main() async {
  final FirestoreMock _mock = FirestoreMock();
  final coureDb=CourseDataSourceImpl(_mock.setCourseData());
  final CourseRepository _repository = CourseRepositoryImpl(coureDb);

  group("Course Repository test", () {
    test("getCourseById", () async {
      DocumentSnapshot course =
          await _repository.getCourseById(id: "JKvhYXcuDsUhKrgbvYP7");
      expect(true, course.exists);
      expect("Auxiliar de Enfermagem", course.get("nome"));
    });

    test("getAllCourses", () async* {
      Stream<QuerySnapshot> course = _repository.getAllCourse();

    });
  });
}
