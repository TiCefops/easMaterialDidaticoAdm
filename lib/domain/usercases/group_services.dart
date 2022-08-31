import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GroupService{
  Future<DocumentSnapshot> getGroup(String id);
  Stream<QuerySnapshot> getAllGroup();
  Future<void> setModule(String id);
}