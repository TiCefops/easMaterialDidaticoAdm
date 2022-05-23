
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CourseRepository{
  Future<DocumentSnapshot> getCourseById({required String id});
  Stream<QuerySnapshot> getAllCourse();
}