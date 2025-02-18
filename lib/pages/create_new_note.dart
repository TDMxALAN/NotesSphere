import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/router.dart';

class CreateNotePage extends StatefulWidget {
  final bool isNewCategory;
  const CreateNotePage({super.key, required this.isNewCategory});

  @override
  State<CreateNotePage> createState() => _CreateNewNotePageState();
}

class _CreateNewNotePageState extends State<CreateNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isNewCategory == true
              ? "create new category"
              : 'create new note',
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => AppRouter.router.go('/notes'),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
    );
  }
}
