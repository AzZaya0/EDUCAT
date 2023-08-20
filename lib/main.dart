import 'package:educat/provider/loginProvider.dart';
import 'package:educat/screens/onBoarding/checkOnboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckOnboard(),
    ),
  ));
}
