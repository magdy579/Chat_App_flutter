import 'package:chatapp/cubit/chat/chat_cubit.dart';
import 'package:chatapp/cubit/log_in_cubit.dart';
import 'package:chatapp/cubit/regessstar_cubit.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/scrrens/Login.dart';
import 'package:chatapp/scrrens/chatPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LogInCubit(),),
        BlocProvider(create: (context) => RegisterCubit(),),
        BlocProvider(create: (context) => ChatCubit(),),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

