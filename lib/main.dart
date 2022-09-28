import 'package:flutter/material.dart';
import 'feature/user_detail/presentation/pages/initial_page.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Information',
      theme: ThemeData(
        primaryColor: Colors.grey.shade800,
      ),
      home: const InitialPage(),
    );
  }
}
