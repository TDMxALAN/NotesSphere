import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_sphere/pages/home_page.dart';
import 'package:notes_sphere/pages/notes_page.dart';
import 'package:notes_sphere/pages/todo_page.dart';

class AppRouter {
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: false,
    initialLocation: '/',
    routes: [
      //home page
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      //notes page
      GoRoute(
        name: 'notes',
        path: '/notes',
        builder: (context, state) => const NotesPage(),
      ),
      //todos page
      GoRoute(
        name: 'todos',
        path: '/todos',
        builder: (context, state) => const TodoPage(),
      )
    ],
  );
}
