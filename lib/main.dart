import 'package:doan/answer_question.dart';
import 'package:doan/Begin.dart';
import 'package:doan/Login.dart';
import 'package:doan/Shop.dart';
import 'package:doan/turn.dart';
import 'Item_support.dart';
import 'package:doan/result_answer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:doan/choose_categories.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ChooseCategories(),
    );
  }
}
