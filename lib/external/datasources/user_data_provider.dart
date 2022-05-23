
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/repositories/users_repository.dart';
import 'package:easmaterialdidaticoadm/domain/entities/user_data_model.dart';

class UserDataProvider implements UserRepository{
  UserDataProvider({required this.firestore});
  final FirebaseFirestore firestore;

  @override
  Future<void> disableUser({required String id}) {
    // TODO: implement disableUser
    throw UnimplementedError();
  }

  @override
  Stream<QuerySnapshot> getAllUser()async* {

    CollectionReference data =   firestore.collection('users');
    yield* data.orderBy("nome",descending: false).snapshots();


  }

  @override
  Future<UserDataModel> getUserById({required String id}) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<UserDataModel> updateUser({required UserDataModel data, required String id}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}