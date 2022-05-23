import 'package:easmaterialdidaticoadm/firebase_options.dart';
import 'package:easmaterialdidaticoadm/presenter/ui/widgets/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web
  );
  runApp(const MyApp());
}
