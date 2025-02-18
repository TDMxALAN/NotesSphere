import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sphere/services/note_services.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/constants.dart';
import 'package:notes_sphere/utils/router.dart';
import 'package:notes_sphere/utils/text_styles.dart';

class CreateNotePage extends StatefulWidget {
  final bool isNewCategory;
  const CreateNotePage({super.key, required this.isNewCategory});

  @override
  State<CreateNotePage> createState() => _CreateNewNotePageState();
}

class _CreateNewNotePageState extends State<CreateNotePage> {
  List<String> categories = [];
  final NoteService noteService = NoteService();

  Future _loadCategories() async {
    categories = await noteService.getAllCategories();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isNewCategory == true
              ? "create new category"
              : 'create new note',
          style: AppTextStyles.appTitle,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => AppRouter.router.go('/notes'),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppConstants.kDefaultPadding / 2),
              child: Form(
                child: Column(
                  children: [
                    //dropdown
                    Column(
                      children: [
                        widget.isNewCategory
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  style: TextStyle(
                                    color: AppColors.kWhiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "New Category Name",
                                    hintStyle: TextStyle(
                                      color: AppColors.kWhiteColor
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.dmSans().fontFamily,
                                      fontSize: 20,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: AppColors.kWhiteColor
                                            .withOpacity(0.1),
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: AppColors.kWhiteColor,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButtonFormField(
                                    style: TextStyle(
                                      color: AppColors.kWhiteColor,
                                      fontFamily:
                                          GoogleFonts.dmSans().fontFamily,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                    isExpanded: false,
                                    hint: Text('select category'),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: AppColors.kWhiteColor
                                              .withOpacity(0.1),
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          AppConstants.kDefaultPadding,
                                        ),
                                        borderSide: BorderSide(
                                          color: AppColors.kWhiteColor,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    items: categories.map((String category) {
                                      return DropdownMenuItem<String>(
                                        alignment: Alignment.centerLeft,
                                        value: category,
                                        child: Text(
                                          category,
                                          style: AppTextStyles.appButton,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {}),
                              ),
                        SizedBox(height: 10),

                        //title field
                        TextFormField(
                          maxLines: 2,
                          style: TextStyle(
                            color: AppColors.kWhiteColor,
                            fontSize: 30,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Note Title',
                            hintStyle: TextStyle(
                              color: AppColors.kWhiteColor.withOpacity(0.5),
                              fontSize: 35,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: 6,
                          style: TextStyle(
                            color: AppColors.kWhiteColor,
                            fontSize: 30,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Note Content',
                            hintStyle: TextStyle(
                              color: AppColors.kWhiteColor.withOpacity(0.3),
                              fontSize: 20,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Divider(
                          color: AppColors.kWhiteColor.withOpacity(0.2),
                          thickness: 1,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.kFabColor),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Save Note",
                                  style: AppTextStyles.appButton
                                      .copyWith(fontSize: 25),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.save,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
