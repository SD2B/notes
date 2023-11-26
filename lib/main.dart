import 'package:flutter/material.dart';
import 'package:notesapp/firebase_options.dart';
import 'package:notesapp/screens/noteListScreen.dart';
import 'package:notesapp/service/noteProvider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note App',
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          primaryColor: Colors.yellow,
          appBarTheme: AppBarTheme(
              centerTitle: true,
              color: Colors.yellow[300],
              elevation: 20,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold)),
        ),
        home: NoteListScreen(),
      ),
    );
  }
}
