
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easmaterialdidaticoadm/domain/entities/user_data_model.dart';

abstract class UserRepository{
  Stream<QuerySnapshot> getAllUser();
  Future<UserDataModel> getUserById({required String id});
  Future<UserDataModel> updateUser({required UserDataModel data,required String id});
  Future<void> disableUser({required String id});

}