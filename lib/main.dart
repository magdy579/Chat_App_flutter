import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/scrrens/Login.dart';
import 'package:chatapp/scrrens/chatPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'scrrens/regessterpage.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      routes: {
         LoginPage.id :(context) => LoginPage(),
        RegisterPage.id:(context) => RegisterPage(),
        ChatPage.id :(context) =>  ChatPage(),
      },
      initialRoute: LoginPage.id,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.deepPurple
      //   ),
      //   useMaterial3: true,
      // ),
    );
  }
}

