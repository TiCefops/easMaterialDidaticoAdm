
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/services/get_group_service.dart';

import '../../domain/repositories/course_repository.dart';
import '../repositories/course_repository_impl.dart';

class GetGroupServiceImpl implements GetGroupService {

  @override
  Future<DocumentSnapshot> getGroup(String id)async{
    final FirebaseFirestore firestore=FirebaseFirestore.instance;
    CourseRepository _repository=CourseRepositoryImpl(firestore);

    return _repository.getCourseById(id: id);
  }

}