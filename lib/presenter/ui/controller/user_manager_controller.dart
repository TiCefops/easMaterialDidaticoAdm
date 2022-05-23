
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

import '../../../domain/repositories/users_repository.dart';
import '../../../infra/repositories/user_data_repository_impl.dart';



class UserManagerController extends GetxController{
  final UserRepository _repository=UserRepositoryImpl(firestore: FirebaseFirestore.instance);
  Stream<QuerySnapshot> getAll()async*{
    yield* _repository.getAllUser();
  }



}