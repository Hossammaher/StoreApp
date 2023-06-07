import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/screens/HomePage.dart';
import 'package:store_app/screens/UpdatePage.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
      initialRoute: HomePage.id,

    );
  }
}
