import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sphere/utils/router.dart';
import 'package:notes_sphere/utils/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NotesSphere',
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme.copyWith(
          textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme)),
      routerConfig: AppRouter.router,
    );
  }
}
