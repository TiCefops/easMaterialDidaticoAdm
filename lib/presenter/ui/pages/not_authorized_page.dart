import 'package:flutter/material.dart';

class NotAuthorizedPage extends StatelessWidget {
  const NotAuthorizedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Text(
          "Sem Autorização",
          style: TextStyle(
              fontSize: size.width * 0.04,
              color: Colors.red,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
