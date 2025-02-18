import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_sphere/models/note_model.dart';
import 'package:notes_sphere/services/note_services.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/constants.dart';
import 'package:notes_sphere/utils/router.dart';
import 'package:notes_sphere/utils/text_styles.dart';
import 'package:notes_sphere/widgets/bottom_sheet.dart';
import 'package:notes_sphere/widgets/notes_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NoteService noteService = NoteService();
  List<Note> allNotes = [];
  Map<String, List<Note>> noteWithCategory = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIfUserIsNew();
  }

  //check if user is new
  void _checkIfUserIsNew() async {
    final bool isNewUser = await noteService.isNewUser();

    //if the user is new create the initial notes
    if (isNewUser) {
      await noteService.createInitialNotes();
    }

    //load the notes
    _loadNotes();
  }

  //load the notes
  Future<void> _loadNotes() async {
    final List<Note> loadedNotes = await noteService.loadNotes();
    final Map<String, List<Note>> notesByCategory =
        noteService.getNotesByCategoryMap(loadedNotes);
    setState(() {
      allNotes = loadedNotes;
      noteWithCategory = notesByCategory;
    });
  }

  //open bottom sheet
  void openBottomSheet() {
    showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.6),
      //Colors.black.withOpacity(0.5),
      context: context,
      builder: (context) {
        return CategoryInputBottomSheet(
          onNewNote: () {
            Navigator.pop(context);
            AppRouter.router.push(
              '/create-note',
              extra: false,
            );
          },
          onNewCategory: () {
            Navigator.pop(context);
            AppRouter.router.push(
              '/create-note',
              extra: true,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: AppTextStyles.appTitle.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => AppRouter.router.go('/'),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //todo : on pressed
        onPressed: openBottomSheet,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Icon(
          Icons.add,
          color: AppColors.kWhiteColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.kDefaultPadding),
        child: Column(
          children: [
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppConstants.kDefaultPadding,
                mainAxisSpacing: AppConstants.kDefaultPadding,
                childAspectRatio: 6 / 4,
              ),
              itemCount: noteWithCategory.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //go to notes by category page
                    AppRouter.router.push('/category',
                        extra: noteWithCategory.keys.elementAt(index));
                  },
                  child: NotesCard(
                    noteCategory: noteWithCategory.keys.elementAt(index),
                    noOfNotes: noteWithCategory.keys.elementAt(index).length,
                  ),
                );
              },
            )

            //!debugging purpose
            // : NotesCard(
            //     noteCategory: noteWithCategory.keys.elementAt(0),
            //     noOfNotes: noteWithCategory.keys.elementAt(0).length),
          ],
        ),
      ),
    );
  }
}
