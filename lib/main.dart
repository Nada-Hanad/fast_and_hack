import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast & Hack with Flutter',
      theme: ThemeData().copyWith(
        // change the focus border color of the TextField
        colorScheme: ThemeData().colorScheme.copyWith(primary: beige),
        // change the focus border color when the errorText is set
        errorColor: beige,
      ),
      home: const MyHomePage(title: 'Fast & Hack with Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}
