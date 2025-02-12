import 'package:flutter/material.dart';
import 'package:notes_sphere/models/note_model.dart';
import 'package:notes_sphere/services/note_services.dart';
import 'package:notes_sphere/utils/constants.dart';
import 'package:notes_sphere/utils/router.dart';
import 'package:notes_sphere/utils/text_styles.dart';
import 'package:notes_sphere/widgets/note_category_card.dart';

class NoteByCategory extends StatefulWidget {
  final String category;
  const NoteByCategory({super.key, required this.category});

  @override
  State<NoteByCategory> createState() => _NoteByCategoryState();
}

class _NoteByCategoryState extends State<NoteByCategory> {
  final NoteService noteService = NoteService();
  List<Note> noteList = [];

  //load all notes by category
  Future<void> _loadNotesByCategory() async {
    noteList = await noteService.getNotesByCategoryName(widget.category);
    setState(() {
      print(noteList.length);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadNotesByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => AppRouter.router.go('/notes'),
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          widget.category,
          style: AppTextStyles.appTitle.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppConstants.kDefaultPadding,
          ),
          child: Column(
            children: [
              // SizedBox(
              //   height: 30,
              // ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.kDefaultPadding,
                  mainAxisSpacing: AppConstants.kDefaultPadding,
                  childAspectRatio: 7 / 11,
                ),
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  return NoteCategoryCard(
                    noteTitle: noteList[index].title,
                    noteContent: noteList[index].content,
                    removeNote: () async {},
                    editNote: () async {},
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
