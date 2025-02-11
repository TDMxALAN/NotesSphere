import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_sphere/models/note_model.dart';
import 'package:notes_sphere/models/todo_model.dart';
import 'package:notes_sphere/utils/router.dart';
import 'package:notes_sphere/utils/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize hive
  await Hive.initFlutter();

  //register adapters
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(TodoAdapter());

  //open hive boxes
  await Hive.openBox('notes');
  await Hive.openBox('todos');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NotesSphere',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeClass.darkTheme,
    );
  }
}
