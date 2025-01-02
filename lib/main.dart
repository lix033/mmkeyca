import 'package:flutter/material.dart';
import 'package:mykey/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  runApp(const MyApp());
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBu1mm2zWqDJ7e-IHN5BjrKvYg5C9PYrwU",
      appId: "mykey-40dff",
      messagingSenderId: "849037601373",
      projectId: "1:849037601373:android:9eb92cefb337b5a57afbb4",
      storageBucket: "mykey-40dff.firebasestorage.app",
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyKeys',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}


